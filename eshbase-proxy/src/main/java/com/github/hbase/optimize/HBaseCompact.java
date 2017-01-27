package com.github.hbase.optimize;


import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.Callable;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HRegionInfo;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.fs.HFileSystem;
import org.apache.hadoop.hbase.regionserver.HStore;
import org.apache.hadoop.hbase.util.FSUtils;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

public class HBaseCompact {
	public static String KEY_STARTTIME = "starttime";
	public static String KEY_ENDTIME = "endtime";
	public static String KEY_TABLENAME = "tablename";
	public static String KEY_SIZE = "marjorfilesize";
	public static String KEY_DIRECT = "directcompactsize";
	public static String KEY_REGIONINDEX = "regionindex";
	private static String starttime;
	private static String endtime;
	private static String tablename;
	private static int regionindex;
	private static Logger logger;
	private static Configuration hconf;
	private static Properties props;
	private static Connection connection;

	/**
	 * wait until time comes
	 */
	private static void waitTime() {
		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
		String curdate = formatter.format(new java.util.Date());

		while (curdate.compareTo(starttime) < 0 || curdate.compareTo(endtime) > 0) {
			try {
				Thread.sleep(60 * 1000);
				curdate = formatter.format(new java.util.Date());
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

	private static void quickPoll(Callable<Boolean> c, long waitMs) throws Exception {
		int sleepMs = 10;
		long retries = (int) Math.ceil(((double) waitMs) / sleepMs);
		while (retries-- >= 0) {
			if (c.call().booleanValue()) {
				return;
			}
			Thread.sleep(sleepMs);
		}
		logger.warn("quick poll timeout");
		return;
	}

	private static void initPropery() {
		/** load property */
		props = new Properties();
		InputStream in = null;
		try {
			in = new FileInputStream("conf/config.properties");
			props.load(in);
			in.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			System.exit(1);
		} catch (IOException e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			System.exit(1);
		}

		/** fulfill property */
		starttime = props.getProperty(KEY_STARTTIME);
		endtime = props.getProperty(KEY_ENDTIME);
		tablename = props.getProperty(KEY_TABLENAME);
		// majorcompactsize = Long.parseLong(props.getProperty(KEY_SIZE));
		// directcompactsize = Long.parseLong(props.getProperty(KEY_DIRECT));
		regionindex = Integer.parseInt(props.getProperty(KEY_REGIONINDEX));
	}

	private static void storeNewConfig(int newRegionIndex) {
		OutputStream fos = null;
		try {
			props.setProperty(KEY_REGIONINDEX, Integer.toString(newRegionIndex));
			fos = new FileOutputStream("conf/config.properties");
			props.store(fos, "Update regionindex");
			fos.flush();
			fos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private static Connection getHBaseConnection() {
		if (connection == null) {
			try {
				connection = ConnectionFactory.createConnection(hconf);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return connection;
	}

	private static void majorCompact() {
		Table table = null;
		Admin hadmin = null;
		HColumnDescriptor[] columndescs = null;
		HTableDescriptor tdesc;
		try {
			hadmin = getHBaseConnection().getAdmin();
			table = getHBaseConnection().getTable(TableName.valueOf(tablename));
			tdesc = table.getTableDescriptor();
			columndescs = tdesc.getColumnFamilies();
		} catch (IOException e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			System.exit(1);
		}

		int i = regionindex;
		getTableDetails();
		while (true) {
			waitTime();
			try {
				final HFileSystem hfs = new HFileSystem(hconf, false);
				List<HRegionInfo> regionlist = hadmin.getTableRegions(TableName.valueOf(tablename));
				if (i >= regionlist.size()) {
					i = 0;
					Thread.sleep(10 * 60 * 1000);
				}
				for (HColumnDescriptor col : columndescs) {
					String familyname = col.getNameAsString();
					HRegionInfo region = regionlist.get(i);
					final Path regionfamilypath =HStore.getStoreHomedir(FSUtils.getTableDir(FSUtils.getRootDir(hconf), TableName.valueOf(tablename)), region,
							familyname.getBytes());
					FileStatus[] statuslist = hfs.listStatus(regionfamilypath);
					String maxfilename = null;
					if (statuslist.length > 1) {
						long totalfilesize = 0;
						long max_size = 0;
						final long filenum = statuslist.length;
						for (FileStatus status : statuslist) {
							totalfilesize += status.getLen();
							if (status.getLen() > max_size) {
								max_size = status.getLen();
								maxfilename = status.getPath().getName();
							}
						}
						final String finalMaxfilename = maxfilename;

						logger.info("Starting major compact region:" + region.getRegionNameAsString() + "\tFamily:" + familyname + "\tFilenum:" + filenum + "\tTotalSize:"
								+ totalfilesize / 1024 / 1024  + "MB");
						hadmin.majorCompactRegion(region.getRegionName(), familyname.getBytes());

						// wait for hours
						long wait_time = totalfilesize / 1024 / 1024 / 1024 * 40 * 1000;
						quickPoll(new Callable<Boolean>() {
							public Boolean call() throws Exception {
								FileStatus[] statuslist = hfs.listStatus(regionfamilypath);
								long local_max_size = 0;
								String local_maxfilename = null;
								for (FileStatus status : statuslist) {
									if (status.getLen() > local_max_size) {
										local_max_size = status.getLen();
										local_maxfilename = status.getPath().getName();
									}
								}
								return local_maxfilename.compareTo(finalMaxfilename) != 0;
							}
						}, wait_time);
						logger.info("Complete major compact region:" + region.getRegionNameAsString());
					} else {
						logger.error("Table:" + tablename + "\tRegion:" + region.getRegionNameAsString() + "\tFamily:" + familyname
								+ "\tCan not do major compact caused by file number" + " is one with size :" + statuslist[0].getLen());
					}
				}

				i++;
				storeNewConfig(i);
				Thread.sleep(1 * 1000);
			} catch (IOException e) {
				e.printStackTrace();
				logger.error(e.getMessage());
			} catch (InterruptedException e) {
				e.printStackTrace();
				logger.error(e.getMessage());
			} catch (Exception e) {
				e.printStackTrace();
				logger.error(e.getMessage());
			} finally {
				if (table != null) {
					try {
						table.close();
					} catch (IOException e) {
						e.printStackTrace();
						logger.error(e.getMessage());
						System.exit(1);
					}
				}
			}
		}
	}

	private static void getTableDetails() {
		Table table = null;
		Admin hadmin = null;
		HColumnDescriptor[] columndescs = null;
		HTableDescriptor tdesc;
		try {
			hadmin = getHBaseConnection().getAdmin();// new HBaseAdmin(hconf);
			table = getHBaseConnection().getTable(TableName.valueOf(tablename));
			tdesc = table.getTableDescriptor();
			columndescs = tdesc.getColumnFamilies();
		} catch (IOException e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			System.exit(1);
		}

		try {
			final HFileSystem hfs = new HFileSystem(hconf, false);
			long tableSize = 0;
			List<HRegionInfo> regionlist = hadmin.getTableRegions(TableName.valueOf(tablename));
			for (HRegionInfo region : regionlist) {
				for (HColumnDescriptor col : columndescs) {
					String familyname = col.getNameAsString();
					final Path regionfamilypath = HStore.getStoreHomedir(FSUtils.getTableDir(FSUtils.getRootDir(hconf), TableName.valueOf(tablename)), region,
							familyname.getBytes());
					FileStatus[] statuslist = hfs.listStatus(regionfamilypath);
					long totalfilesize = 0;
					for (FileStatus status : statuslist) {
						totalfilesize += status.getLen();
						tableSize += status.getLen();
					}
					logger.info("Table:" + tablename + "\tRegion:" + region.getRegionNameAsString() + "\tFamily:" + familyname + "\tFilenum:" + statuslist.length + "\tSize:"
							+ totalfilesize / 1024 / 1024  + "MBytes");
				}
			}
			logger.info("Table:" + tablename + "\tSize: " + tableSize / 1024 / 1024 / 1024 + "GBytes");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		} finally {
			if (table != null) {
				try {
					table.close();
				} catch (IOException e) {
					e.printStackTrace();
					logger.error(e.getMessage());
					System.exit(1);
				}
			}
		}
	}

	public static void main(String[] args) {
		Configuration conf = new Configuration();
		conf.addResource(new Path("conf/core-site.xml"));
		conf.addResource(new Path("conf/hdfs-site.xml"));
		conf.addResource(new Path("conf/hbase-site.xml"));
		hconf = new Configuration(conf);
		/** init logger */
		PropertyConfigurator.configure("conf/log4j.properties");
		logger = Logger.getLogger(HBaseCompact.class);

		logger.info("Starting enniu HBase Graceful Major Compact");
		/** Load property */
		initPropery();

		/** start major compact */
		majorCompact();
		logger.info("Stoping enniu HBase Graceful Major Compact");
	}
}
