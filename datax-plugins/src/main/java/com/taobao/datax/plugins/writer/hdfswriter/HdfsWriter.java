/**
 * (C) 2010-2011 Alibaba Group Holding Limited.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License 
 * version 2 as published by the Free Software Foundation. 
 * 
 */

package com.taobao.datax.plugins.writer.hdfswriter;

import java.io.BufferedWriter;
import java.io.Closeable;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;
import org.apache.hadoop.io.SequenceFile;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.io.compress.CompressionCodec;
import org.apache.hadoop.io.compress.CompressionOutputStream;
import org.apache.hadoop.util.ReflectionUtils;
import org.apache.log4j.Logger;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.google.common.cache.RemovalListener;
import com.google.common.cache.RemovalNotification;
import com.taobao.datax.common.exception.DataExchangeException;
import com.taobao.datax.common.exception.ExceptionTracker;
import com.taobao.datax.common.plugin.Line;
import com.taobao.datax.common.plugin.LineReceiver;
import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.common.plugin.PluginStatus;
import com.taobao.datax.common.plugin.Writer;
import com.taobao.datax.common.util.ETLConstants;
import com.taobao.datax.common.util.ETLDateUtils;
import com.taobao.datax.plugins.common.DFSUtils;

public class HdfsWriter extends Writer {

	private static final Logger logger = Logger.getLogger(HdfsWriter.class);

	private FileSystem fs;

	private Path p = null;

	private char FIELD_SPLIT = '\u0001';

	private char LINE_SPLIT = '\n';

	private int BUFFER_SIZE = 8 * 1024;

	private String ENCODING = "UTF-8";

	private String delMode = "3";

	private String hadoop_conf = "";

	private String partitionColumn = "nopartition";

	private String partitionName = "dateentry";

	private int partColumnIdx = 0;
	private int bakPartColumnIdx = 1;
	private int partRuleId = 0;
	private String partFormat = "";

	private String filetype = "TXT";

	String ugi = null;
	String dir = null;

	private int concurrency = 10;

	private char[] nullChars = null;

	private static char[] searchChars = new char[2];

	private DfsWriterStrategy dfsWriterStrategy = null;
	

	static {
		Thread.currentThread().setContextClassLoader(HdfsWriter.class.getClassLoader());
	}

	/*
	 * NOTE: if user set parameter 'splitnum' to 1, which means no-split in
	 * hdfswriter, we use dir + prefixname as the fixed hdfs-file name for
	 * example: dir = hdfs://taobao/dw prefixname = bazhen.csy splitname = 1 we
	 * use hdfs://taobao/dw/bazhen.csy as the target filename which hdfswriter
	 * dump file to
	 * 
	 * for other cases, we use prefixname as just prefix filename, for example
	 * dir = hdfs://taobao/dw prefixname = bazhen.csy splitname = 2 at last, the
	 * generated filename will be hdfs://taobao/dw/bazhen.csy-0
	 * hdfs://taobao/dw/bazhen.csy-1 the suffix is thread number
	 */

	@Override
	public int prepare(PluginParam param) {
		String dir = param.getValue(ParamKey.dir);
		String ugi = param.getValue(ParamKey.ugi, null);
		String prefixname = param.getValue(ParamKey.prefixname, "prefix");
		delMode = param.getValue(ParamKey.delMode, this.delMode);
		concurrency = param.getIntValue(ParamKey.concurrency, 1);
		hadoop_conf = param.getValue(ParamKey.hadoop_conf, "");

		if (dir.endsWith("*")) {
			dir = dir.substring(0, dir.lastIndexOf("*"));
		}
		if (dir.endsWith("/")) {
			dir = dir.substring(0, dir.lastIndexOf("/"));
		}

		Path rootpath = new Path(dir);
		try {
			fs = FileSystem.get(DFSUtils.getConf(dir, ugi, hadoop_conf));
			/* No split to dump file, use dir as absolute filename . */
			if (concurrency == 1) {
				DFSUtils.deleteFile(fs, new Path(dir + "/" + prefixname), true);
			}
			/* use dir as directory path . */
			else {
				if ("4".equals(delMode))
					DFSUtils.deleteFiles(fs, rootpath, true, true);
				else if ("3".equals(delMode))
					DFSUtils.deleteFiles(fs, new Path(dir + "/" + prefixname + "-*"), true, true);
			}
		} catch (Exception e) {
			logger.error(ExceptionTracker.trace(e));
			throw new DataExchangeException(e);
		} finally {
			closeAll();
		}

		return PluginStatus.SUCCESS.value();
	}

	@Override
	public List<PluginParam> split(PluginParam param) {
		HdfsFileSplitter spliter = new HdfsFileSplitter();
		spliter.setParam(param);
		spliter.init();
		return spliter.split();
	}

	@Override
	public int init() {
		FIELD_SPLIT = param.getCharValue(ParamKey.fieldSplit, FIELD_SPLIT);
		ENCODING = param.getValue(ParamKey.encoding, ENCODING);
		LINE_SPLIT = param.getCharValue(ParamKey.lineSplit, LINE_SPLIT);
		searchChars[0] = FIELD_SPLIT;
		searchChars[1] = LINE_SPLIT;
		BUFFER_SIZE = param.getIntValue(ParamKey.bufferSize, BUFFER_SIZE);
		delMode = param.getValue(ParamKey.delMode, this.delMode);
		nullChars = param.getValue(ParamKey.nullChar, "").toCharArray();
		hadoop_conf = param.getValue(ParamKey.hadoop_conf, "");

		this.ugi = param.getValue(ParamKey.ugi, null);
		System.setProperty("HADOOP_USER_NAME", ugi);
		this.dir = param.getValue(ParamKey.dir);
		try {
			this.partitionColumn = param.getValue(ParamKey.partitionColumn);
			this.partitionName = param.getValue(ParamKey.partitionName);
			if (StringUtils.isNotEmpty(partitionColumn)) {
				String[] pps = StringUtils.split(partitionColumn, ":");
				if (pps.length > 3) {
					this.partColumnIdx = NumberUtils.toInt(pps[0], 0);
					this.bakPartColumnIdx = NumberUtils.toInt(pps[1], 0);
					this.partRuleId = NumberUtils.toInt(pps[2], 0);
					this.partFormat = pps[3];
				} else {
					this.partitionColumn = "nopartition";
				}
			} else {
				this.partitionColumn = "nopartition";
			}
		} catch (Exception ex) {
		}
		try {
			fs = FileSystem.get(DFSUtils.getConf(dir, ugi, hadoop_conf));
		} catch (Exception e) {
			logger.error(ExceptionTracker.trace(e));
			closeAll();
			throw new DataExchangeException(String.format("HdfsWriter Initialize file system failed:%s,%s", e.getMessage(), e.getCause()));
		}
		if (dir != null) {
			p = new Path(dir);
		} else {
			closeAll();
			throw new DataExchangeException("Can't find the param [" + ParamKey.dir + "] in hdfs-writer-param.");
		}

		this.filetype = param.getValue(ParamKey.fileType, "TXT");
		if ("SEQ".equalsIgnoreCase(filetype) || "SEQ_COMP".equalsIgnoreCase(filetype))
			dfsWriterStrategy = new DfsWriterSequeueFileStrategy();
		else if ("SEQ_DAY_SPLI".equalsIgnoreCase(filetype))
			dfsWriterStrategy = new DfsDaySplitWriterSequeueFileStrategy();
		else if ("TXT_COMP".equalsIgnoreCase(filetype))
			dfsWriterStrategy = new DfsWriterTextFileStrategy(true);
		else if ("TXT".equalsIgnoreCase(filetype))
			dfsWriterStrategy = new DfsWriterTextFileStrategy(false);
		else {
			closeAll();
			throw new DataExchangeException("HdfsWriter cannot recognize filetype: " + filetype);
		}

		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int connect() {
		if (p == null) {
			closeAll();
			throw new DataExchangeException("HdfsWriter Can't initialize file system .");
		}
		try {
			if ("2".equals(delMode))
				DFSUtils.deleteFile(fs, p, true);

			dfsWriterStrategy.open();

			getMonitor().setStatus(PluginStatus.CONNECT);

			return PluginStatus.SUCCESS.value();
		} catch (Exception ex) {
			closeAll();
			logger.error(ExceptionTracker.trace(ex));
			throw new DataExchangeException(String.format("HdfsWriter initialize file system failed: %s, %s", ex.getMessage(), ex.getCause()));
		}
	}

	@Override
	public int startWrite(LineReceiver receiver) {
		getMonitor().setStatus(PluginStatus.WRITE);
		try {
			dfsWriterStrategy.write(receiver);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new DataExchangeException(String.format("Some errors occurs on starting writing: %s,%s", ex.getMessage(), ex.getCause()));
		} finally {
			dfsWriterStrategy.close();
			closeAll();
		}
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int commit() {
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int finish() {
		closeAll();
		getMonitor().setStatus(PluginStatus.WRITE_OVER);
		return PluginStatus.SUCCESS.value();
	}

	private void closeAll() {
		try {
			IOUtils.closeStream(fs);
		} catch (Exception e) {
			throw new DataExchangeException(String.format("HdfsWriter closing filesystem failed: %s,%s", e.getMessage(), e.getCause()));
		}
	}

	@Override
	public int cleanup() {
		closeAll();
		return PluginStatus.SUCCESS.value();
	}

	public interface DfsWriterStrategy {
		void open();

		void write(LineReceiver receiver);

		void close();
	}

	class DfsWriterSequeueFileStrategy implements DfsWriterStrategy {
		private Configuration conf = null;

		// private SequenceFile.Writer writer = null;

//		private Map<String, SequenceFile.Writer> writers = new java.util.concurrent.ConcurrentHashMap<String, SequenceFile.Writer>();
		private LoadingCache<String, MyHDFSWriter> writersCache = null;

		private Writable key = null;

		private Writable value = null;

		private boolean compressed = false;

		private String keyClassName = null;

		private String valueClassName = null;

		private String codecClassName = null;

		private Class<?> keyClass = null;

		private Class<?> valueClass = null;

		private Method keySetMethod = null;

		private Method valueSetMethod = null;

		// modified by bazhen.csy
		private int keyFieldIndex = -1;

		private SequenceFile.CompressionType compressioType = SequenceFile.CompressionType.BLOCK;

		public DfsWriterSequeueFileStrategy() {
			super();
			String cType = getParam().getValue(ParamKey.compressionType, "NONE");
			if ("BLOCK".equalsIgnoreCase(cType)) {
				compressioType = SequenceFile.CompressionType.BLOCK;
				compressed = true;
			} else if ("RECORD".equalsIgnoreCase(cType)) {
				compressioType = SequenceFile.CompressionType.RECORD;
				compressed = true;
			} else {
				compressioType = SequenceFile.CompressionType.NONE;
			}
			this.conf = DFSUtils.newConf();

			this.writersCache = CacheBuilder.newBuilder().maximumSize(10000).concurrencyLevel(100).expireAfterAccess(180, TimeUnit.SECONDS)
					.removalListener(new RemovalListener<String, MyHDFSWriter>() {
						@Override
						public void onRemoval(RemovalNotification<String, MyHDFSWriter> removal) {
							logger.info("removal: " + removal.getKey() + "/" + removal.getValue());
							IOUtils.closeStream(removal.getValue());
						}
					}).build(new CacheLoader<String, MyHDFSWriter>() {
						public MyHDFSWriter load(String key) {
							return newWriter(key);
						}
					});

		}

		@Override
		public void close() {
			writersCache.invalidateAll();
		}

		@Override
		public void write(LineReceiver resultHandler) {
			Line line = null;
			try {
				StringBuilder sb = new StringBuilder(10240);
				while ((line = resultHandler.getFromReader()) != null) {
					int len = line.getFieldNum();
					for (int i = 0; i < len; i++) {
						if (i == partColumnIdx) {
							if (StringUtils.isEmpty(line.getField(i))) {
								if (i == keyFieldIndex) {
									if (keySetMethod != null)
										keySetMethod.invoke(key, new Object[] { adapterType(line.getField(bakPartColumnIdx), keyClassName) });

								} else {
									sb.append(replaceChars(line.getField(bakPartColumnIdx), searchChars)).append(FIELD_SPLIT);
								}
								continue;
							}
						}
						if (i == keyFieldIndex) {
							if (keySetMethod != null)
								keySetMethod.invoke(key, new Object[] { adapterType(line.getField(i), keyClassName) });

						} else {
							sb.append(replaceChars(line.getField(i), searchChars)).append(FIELD_SPLIT);
						}
					}
					sb.delete(sb.length() - 1, sb.length());
					if (valueSetMethod != null)
						valueSetMethod.invoke(value, new Object[] { adapterType(sb.toString(), valueClassName) });
					if (StringUtils.isNotEmpty(partitionColumn)) {// 需要分区
						switch (partRuleId) {
						case 0: {
							try {
								writersCache.get(line.getField(partColumnIdx)).append(key, value);
							} catch (Exception ex) {
								logger.error(ExceptionTracker.trace(ex));
								writersCache.invalidate(line.getField(partColumnIdx));
								writersCache.get(line.getField(partColumnIdx)).append(key, value);
							}
							break;
						}
						case 1: {
							String pv = StringUtils.substring(line.getField(partColumnIdx), 0, NumberUtils.toInt(partFormat));
							if (pv == null)
								pv = StringUtils.substring(line.getField(bakPartColumnIdx), 0, NumberUtils.toInt(partFormat));
							try {
								writersCache.get(pv).append(key, value);
							} catch (Exception ex) {
								logger.error(ExceptionTracker.trace(ex));
								writersCache.invalidate(pv);
								writersCache.get(pv).append(key, value);
							}
							break;
						}
						case 4: {
							String pv = ETLDateUtils.formatDate(ETLDateUtils.parseDate(line.getField(partColumnIdx), ETLConstants.DATE_FORMAT_SSS), partFormat);
							try {
								writersCache.get(pv).append(key, value);
							} catch (Exception ex) {
								logger.error(ExceptionTracker.trace(ex));
								writersCache.invalidate(pv);
								writersCache.get(pv).append(key, value);
							}
							break;
						}
						default: {
							try {
								writersCache.get("nopartition").append(key, value);
							} catch (Exception ex) {
								logger.error(ExceptionTracker.trace(ex));
								writersCache.invalidate("nopartition");
								writersCache.get("nopartition").append(key, value);
							}
						}
						}
					} else {
						try {
							writersCache.get("nopartition").append(key, value);
						} catch (Exception ex) {
							logger.error(ExceptionTracker.trace(ex));
							writersCache.invalidate("nopartition");
							writersCache.get("nopartition").append(key, value);
						}
					}
					sb.setLength(0);
				}
			} catch (Exception e) {
				logger.error(ExceptionTracker.trace(e));
				throw new DataExchangeException(e);
			}
		}

		private Path getNewFile(Path p) throws IOException {
			Random random = new Random();
			Path newPath = new Path(p.getParent().toUri() + "/" + p.getName() + "-" + random.nextLong());
			if ("1".equals(delMode) && fs.exists(newPath)) {
				return getNewFile(newPath);
			} else {
				return newPath;
			}
		}

		/**
		 * 获取指定分区字段的writer
		 * 
		 * @return
		 */
		/*
		 * public SequenceFile.Writer getWriter(String partitionColumn){
		 * SequenceFile.Writer ww=writers.get(partitionColumn); if (ww==null){
		 * try{ if (compressed) { Class<?> codecClass =
		 * Class.forName(codecClassName); CompressionCodec codec =
		 * (CompressionCodec) ReflectionUtils.newInstance(codecClass, conf); if
		 * ("nopartition".equalsIgnoreCase(partitionColumn)){ if
		 * ("1".equals(delMode) && fs.exists(p) ){ ww =
		 * SequenceFile.createWriter(fs, conf,getNewFile(p),
		 * keyClass,valueClass, compressioType, codec); }else{ ww =
		 * SequenceFile.createWriter(fs, conf,p, keyClass,valueClass,
		 * compressioType, codec); } }else{ Path thePath=new
		 * Path(p.getParent().toUri
		 * ()+"/"+partitionName+"="+partitionColumn+"/"+p.getName()); if
		 * ("1".equals(delMode) && fs.exists(thePath) ){ ww =
		 * SequenceFile.createWriter(fs, conf,getNewFile(thePath),
		 * keyClass,valueClass, compressioType, codec); }else{ ww =
		 * SequenceFile.createWriter(fs, conf,thePath, keyClass,valueClass,
		 * compressioType, codec); } } } else{ if
		 * ("nopartition".equalsIgnoreCase(partitionColumn)){ if
		 * ("1".equals(delMode) && fs.exists(p) ){ ww =
		 * SequenceFile.createWriter(fs, conf,getNewFile(p),
		 * keyClass,valueClass); }else{ ww = SequenceFile.createWriter(fs, conf,
		 * p, keyClass,valueClass); } }else{ Path thePath=new
		 * Path(p.getParent().
		 * toUri()+"/"+partitionName+"="+partitionColumn+"/"+p.getName()); if
		 * ("1".equals(delMode) && fs.exists(thePath) ){ ww =
		 * SequenceFile.createWriter(fs, conf,getNewFile(thePath),
		 * keyClass,valueClass); }else{ ww = SequenceFile.createWriter(fs, conf,
		 * thePath, keyClass,valueClass); } } } }catch(Exception ex){
		 * ex.printStackTrace(); } writers.put(partitionColumn, ww); return ww;
		 * }else{ return ww; } }
		 */

		@SuppressWarnings("deprecation")
		public MyHDFSWriter newWriter(String partitionColumn) {
			SequenceFile.Writer ww = null;
			try {
				if (compressed) {
					Class<?> codecClass = Class.forName(codecClassName);
					CompressionCodec codec = (CompressionCodec) ReflectionUtils.newInstance(codecClass, conf);
					if ("nopartition".equalsIgnoreCase(partitionColumn)) {
						if ("1".equals(delMode) && fs.exists(p)) {
							ww = SequenceFile.createWriter(fs, conf, getNewFile(p), keyClass, valueClass, compressioType, codec);
						} else {
							ww = SequenceFile.createWriter(fs, conf, p, keyClass, valueClass, compressioType, codec);
						}
					} else {
						Path thePath = new Path(p.getParent().toUri() + "/" + partitionName + "=" + partitionColumn + "/" + p.getName());
						if ("1".equals(delMode) && fs.exists(thePath)) {
							ww = SequenceFile.createWriter(fs, conf, getNewFile(thePath), keyClass, valueClass, compressioType, codec);
						} else {
							ww = SequenceFile.createWriter(fs, conf, thePath, keyClass, valueClass, compressioType, codec);
						}
					}
				} else {
					if ("nopartition".equalsIgnoreCase(partitionColumn)) {
						if ("1".equals(delMode) && fs.exists(p)) {
							ww = SequenceFile.createWriter(fs, conf, getNewFile(p), keyClass, valueClass);
						} else {
							ww = SequenceFile.createWriter(fs, conf, p, keyClass, valueClass);
						}
					} else {
						Path thePath = new Path(p.getParent().toUri() + "/" + partitionName + "=" + partitionColumn + "/" + p.getName());
						if ("1".equals(delMode) && fs.exists(thePath)) {
							ww = SequenceFile.createWriter(fs, conf, getNewFile(thePath), keyClass, valueClass);
						} else {
							ww = SequenceFile.createWriter(fs, conf, thePath, keyClass, valueClass);
						}
					}
				}
			} catch (Exception ex) {
				logger.error(ex);
			}
			return new MyHDFSWriter(ww);
		}

		@Override
		public void open() {
			try {
				if ("1".equals(delMode) && fs.exists(p))
					throw new DataExchangeException("the file [" + p.getName() + "] already exists. ");

				codecClassName = getParam().getValue(ParamKey.codecClass, "org.apache.hadoop.io.compress.DefaultCodec");
				keyClassName = getParam().getValue(ParamKey.keyClass, "org.apache.hadoop.io.Text");
				valueClassName = getParam().getValue(ParamKey.valueClass, "org.apache.hadoop.io.Text");

				keyClass = Class.forName(keyClassName);
				valueClass = Class.forName(valueClassName);

				key = (Writable) ReflectionUtils.newInstance(keyClass, conf);
				value = (Writable) ReflectionUtils.newInstance(valueClass, conf);

				keyFieldIndex = param.getIntValue(ParamKey.keyFieldIndex, this.keyFieldIndex);

				if (!keyClassName.toLowerCase().contains("null") && (keyFieldIndex >= 0))
					keySetMethod = keyClass.getMethod("set", new Class[] { DFSUtils.getTypeMap().get(keyClassName) });
				if (!valueClassName.toLowerCase().contains("null"))
					valueSetMethod = valueClass.getMethod("set", new Class[] { DFSUtils.getTypeMap().get(valueClassName) });
				// if (compressed) {
				// Class<?> codecClass = Class.forName(codecClassName);
				// CompressionCodec codec = (CompressionCodec)
				// ReflectionUtils.newInstance(codecClass, conf);
				// writer = SequenceFile.createWriter(fs, conf, p,
				// keyClass,valueClass, compressioType, codec);
				// } else{
				// writer = SequenceFile.createWriter(fs, conf, p,
				// keyClass,valueClass);
				// }
			} catch (Exception e) {
				throw new DataExchangeException(e);
			}
		}

		private Object adapterType(String field, String typename) {
			Object target = null;
			if (typename.toLowerCase().contains("null")) {
				target = null;
			} else if (typename.toLowerCase().contains("text")) {
				target = field;
			} else if (typename.toLowerCase().contains("long")) {
				target = Long.parseLong(field);
			} else if (typename.toLowerCase().contains("integer")) {
				target = Integer.parseInt(field);
			} else if (typename.toLowerCase().contains("double")) {
				target = Double.parseDouble(field);
			} else if (typename.toLowerCase().contains("float")) {
				target = Float.parseFloat(field);
			} else {
				target = field;
			}
			return target;
		}
	}

	class DfsDaySplitWriterSequeueFileStrategy implements DfsWriterStrategy {
		private Configuration conf = null;

		// private SequenceFile.Writer writer = null;
		
		private Writable key = null;

		private Writable value = null;

		private boolean compressed = false;

		private String keyClassName = null;

		private String valueClassName = null;

		private String codecClassName = null;

		private Class<?> keyClass = null;

		private Class<?> valueClass = null;

		private Method keySetMethod = null;

		private Method valueSetMethod = null;

		// modified by bazhen.csy
		private int keyFieldIndex = -1;
		
//		private Map<String, SequenceFile.Writer> dfsDaySeqwriters = new java.util.concurrent.ConcurrentHashMap<String, SequenceFile.Writer>();
		private  LoadingCache<String, MyHDFSWriter> dfsDaySeqwriters=null;

		private SequenceFile.CompressionType compressioType = SequenceFile.CompressionType.BLOCK;

		public DfsDaySplitWriterSequeueFileStrategy() {
			super();
			String cType = getParam().getValue(ParamKey.compressionType, "NONE");
			if ("BLOCK".equalsIgnoreCase(cType)) {
				compressioType = SequenceFile.CompressionType.BLOCK;
				compressed = true;
			} else if ("RECORD".equalsIgnoreCase(cType)) {
				compressioType = SequenceFile.CompressionType.RECORD;
				compressed = true;
			} else {
				compressioType = SequenceFile.CompressionType.NONE;
			}
			this.conf = DFSUtils.newConf();
			this.dfsDaySeqwriters = CacheBuilder.newBuilder().maximumSize(10000).concurrencyLevel(100).expireAfterAccess(180, TimeUnit.SECONDS)
					.removalListener(new RemovalListener<String, MyHDFSWriter>() {
						@Override
						public void onRemoval(RemovalNotification<String, MyHDFSWriter> removal) {
							logger.info("removal: " + removal.getKey() + "/" + removal.getValue());
							IOUtils.closeStream(removal.getValue());
						}
					}).build(new CacheLoader<String, MyHDFSWriter>() {
						public MyHDFSWriter load(String key) {
							logger.info(key);
							return newWriter(key);
						}
					});
		}

		@Override
		public void close() {
			closeWriters();
		}

		@Override
		public void write(LineReceiver resultHandler) {
			Line line = null;
			try {
				StringBuilder sb = new StringBuilder(10240);
				while ((line = resultHandler.getFromReader()) != null) {
					int len = line.getFieldNum();
					for (int i = 0; i < len; i++) {
						if (i == partColumnIdx) {
							if (StringUtils.isEmpty(line.getField(i))) {
								if (i == keyFieldIndex) {
									if (keySetMethod != null)
										keySetMethod.invoke(key, new Object[] { adapterType(line.getField(bakPartColumnIdx), keyClassName) });

								} else {
									sb.append(replaceChars(line.getField(bakPartColumnIdx), searchChars)).append(FIELD_SPLIT);
								}
								continue;
							}
						}
						if (i == keyFieldIndex) {
							if (keySetMethod != null)
								keySetMethod.invoke(key, new Object[] { adapterType(line.getField(i), keyClassName) });

						} else {
							sb.append(replaceChars(line.getField(i), searchChars)).append(FIELD_SPLIT);
						}
					}
					sb.delete(sb.length() - 1, sb.length());
					if (valueSetMethod != null)
						valueSetMethod.invoke(value, new Object[] { adapterType(sb.toString(), valueClassName) });

					if (StringUtils.isNotEmpty(partitionColumn)) {// 需要分区
						switch (partRuleId) {
						case 0: {
							try {
								dfsDaySeqwriters.get(line.getField(partColumnIdx)).append(key, value);
							} catch (Exception ex) {
								logger.error(ExceptionTracker.trace(ex));
								dfsDaySeqwriters.get(line.getField(partColumnIdx)).append(key, value);
							}
							break;
						}
						case 1: {
							String pv = StringUtils.substring(line.getField(partColumnIdx), 0, NumberUtils.toInt(partFormat));
							if (pv == null)
								pv = StringUtils.substring(line.getField(bakPartColumnIdx), 0, NumberUtils.toInt(partFormat));
							try {
								dfsDaySeqwriters.get(pv).append(key, value);
							} catch (Exception ex) {
								logger.error(ExceptionTracker.trace(ex));
								dfsDaySeqwriters.get(pv).append(key, value);
							}
							break;
						}
						case 4: {
							String pv =null;
							try{
								pv = ETLDateUtils.formatDate(ETLDateUtils.parseDate(line.getField(partColumnIdx), ETLConstants.DATE_FORMAT), partFormat);
							}catch(Exception ex){
								try{
									pv = ETLDateUtils.formatDate(ETLDateUtils.parseDate(line.getField(partColumnIdx), ETLConstants.DATE_FORMAT_SSS), partFormat);
								}catch(Exception ex2){
									pv = ETLDateUtils.formatDate(ETLDateUtils.parseDate(line.getField(partColumnIdx), ETLConstants.DATE_ONLY_FORMAT), partFormat);
								}
							}
							try {
								dfsDaySeqwriters.get(pv).append(key, value);
							} catch (Exception ex) {
								logger.error(ExceptionTracker.trace(ex));
								dfsDaySeqwriters.get(pv).append(key, value);
							}
							break;
						}
						default: {
							try {
								dfsDaySeqwriters.get("nopartition").append(key, value);
							} catch (Exception ex) {
								logger.error(ExceptionTracker.trace(ex));
								dfsDaySeqwriters.get("nopartition").append(key, value);
							}
						}
						}
					} else {
						try {
							dfsDaySeqwriters.get("nopartition").append(key, value);
						} catch (Exception ex) {
							dfsDaySeqwriters.get("nopartition").append(key, value);
						}
					}
					sb.setLength(0);
				}
			} catch (Exception e) {
				e.printStackTrace();
				logger.error(e);
				throw new DataExchangeException(e);
			}
		}

		private Path getNewFile(Path p) throws IOException {
			Random random = new Random();
			Path newPath = new Path(p.getParent().toUri() + "/" + p.getName() + "-" + random.nextLong());
			if ("1".equals(delMode) && fs.exists(newPath)) {
				return getNewFile(newPath);
			} else {
				return newPath;
			}
		}

		private void closeWriters() {
			dfsDaySeqwriters.invalidateAll();
		}

		/**
		 * 获取指定分区字段的writer
		 * 
		 * @return
		 */
		@SuppressWarnings("deprecation")
		public MyHDFSWriter newWriter(String partitionColumn) {
			SequenceFile.Writer ww=null;
				try {
					if (compressed) {
						Class<?> codecClass = Class.forName(codecClassName);
						CompressionCodec codec = (CompressionCodec) ReflectionUtils.newInstance(codecClass, conf);
						if ("nopartition".equalsIgnoreCase(partitionColumn)) {
							if ("1".equals(delMode) && fs.exists(p)) {
								ww = SequenceFile.createWriter(fs, conf, getNewFile(p), keyClass, valueClass, compressioType, codec);
							} else {
								ww = SequenceFile.createWriter(fs, conf, p, keyClass, valueClass, compressioType, codec);
							}
						} else {
							Path thePath = new Path(p.getParent().toUri() + "/" + partitionName + "=" + partitionColumn + "/" + p.getName());
							if ("1".equals(delMode) && fs.exists(thePath)) {
								ww = SequenceFile.createWriter(fs, conf, getNewFile(thePath), keyClass, valueClass, compressioType, codec);
							} else {
								ww = SequenceFile.createWriter(fs, conf, thePath, keyClass, valueClass, compressioType, codec);
							}
						}
					} else {
						if ("nopartition".equalsIgnoreCase(partitionColumn)) {
							if ("1".equals(delMode) && fs.exists(p)) {
								ww = SequenceFile.createWriter(fs, conf, getNewFile(p), keyClass, valueClass);
							} else {
								ww = SequenceFile.createWriter(fs, conf, p, keyClass, valueClass);
							}
						} else {
							Path thePath = new Path(p.getParent().toUri() + "/" + partitionName + "=" + partitionColumn + "/" + p.getName());
							if ("1".equals(delMode) && fs.exists(thePath)) {
								ww = SequenceFile.createWriter(fs, conf, getNewFile(thePath), keyClass, valueClass);
							} else {
								ww = SequenceFile.createWriter(fs, conf, thePath, keyClass, valueClass);
							}
						}
					}
				} catch (Exception ex) {
					ex.printStackTrace();
				}
				return  new MyHDFSWriter(ww);
			
		}

		@Override
		public void open() {
			try {
				if ("1".equals(delMode) && fs.exists(p))
					throw new DataExchangeException("the file [" + p.getName() + "] already exists. ");

				codecClassName = getParam().getValue(ParamKey.codecClass, "org.apache.hadoop.io.compress.DefaultCodec");
				keyClassName = getParam().getValue(ParamKey.keyClass, "org.apache.hadoop.io.Text");
				valueClassName = getParam().getValue(ParamKey.valueClass, "org.apache.hadoop.io.Text");

				keyClass = Class.forName(keyClassName);
				valueClass = Class.forName(valueClassName);

				key = (Writable) ReflectionUtils.newInstance(keyClass, conf);
				value = (Writable) ReflectionUtils.newInstance(valueClass, conf);

				keyFieldIndex = param.getIntValue(ParamKey.keyFieldIndex, this.keyFieldIndex);

				if (!keyClassName.toLowerCase().contains("null") && (keyFieldIndex >= 0))
					keySetMethod = keyClass.getMethod("set", new Class[] { DFSUtils.getTypeMap().get(keyClassName) });
				if (!valueClassName.toLowerCase().contains("null"))
					valueSetMethod = valueClass.getMethod("set", new Class[] { DFSUtils.getTypeMap().get(valueClassName) });
				// if (compressed) {
				// Class<?> codecClass = Class.forName(codecClassName);
				// CompressionCodec codec = (CompressionCodec)
				// ReflectionUtils.newInstance(codecClass, conf);
				// writer = SequenceFile.createWriter(fs, conf, p,
				// keyClass,valueClass, compressioType, codec);
				// } else{
				// writer = SequenceFile.createWriter(fs, conf, p,
				// keyClass,valueClass);
				// }
			} catch (Exception e) {
				throw new DataExchangeException(e);
			}
		}

		private Object adapterType(String field, String typename) {
			Object target = null;
			if (typename.toLowerCase().contains("null")) {
				target = null;
			} else if (typename.toLowerCase().contains("text")) {
				target = field;
			} else if (typename.toLowerCase().contains("long")) {
				target = Long.parseLong(field);
			} else if (typename.toLowerCase().contains("integer")) {
				target = Integer.parseInt(field);
			} else if (typename.toLowerCase().contains("double")) {
				target = Double.parseDouble(field);
			} else if (typename.toLowerCase().contains("float")) {
				target = Float.parseFloat(field);
			} else {
				target = field;
			}
			return target;
		}
	}

	class DfsWriterTextFileStrategy implements DfsWriterStrategy {
		private FSDataOutputStream out = null;

		private BufferedWriter bw = null;

		private CompressionOutputStream co = null;

		private boolean compressed = false;

		public DfsWriterTextFileStrategy(boolean compressed) {
			super();
			this.compressed = compressed;
		}

		@Override
		public void close() {
			IOUtils.cleanup(null, bw, out, co);
		}

		@Override
		public void open() {
			try {
				boolean flag = false;
				if ("0".equals(delMode))
					flag = true;
				if (compressed) {
					String codecClassName = param.getValue(ParamKey.codecClass, "org.apache.hadoop.io.compress.DefaultCodec");

					Class<?> codecClass = Class.forName(codecClassName);
					Configuration conf = DFSUtils.newConf();
					CompressionCodec codec = (CompressionCodec) ReflectionUtils.newInstance(codecClass, conf);

					out = fs.create(p, flag, BUFFER_SIZE);
					co = codec.createOutputStream(out);
					bw = new BufferedWriter(new OutputStreamWriter(co, ENCODING), BUFFER_SIZE);
				} else {
					out = fs.create(p, flag, BUFFER_SIZE);
					bw = new BufferedWriter(new OutputStreamWriter(out, ENCODING), BUFFER_SIZE);
				}
			} catch (Exception e) {
				logger.error(ExceptionTracker.trace(e));
				throw new DataExchangeException(e);
			}
		}

		@Override
		public void write(LineReceiver receiver) {
			Line line;
			try {
				while ((line = receiver.getFromReader()) != null) {
					int len = line.getFieldNum();
					for (int i = 0; i < len; i++) {
						// bw.write(line.getField(i));
						bw.write(replaceChars(line.getField(i), searchChars));
						if (i < len - 1)
							bw.write(FIELD_SPLIT);
					}
					bw.write(LINE_SPLIT);
				}
				bw.flush();
			} catch (Exception e) {
				logger.error(ExceptionTracker.trace(e));
				throw new DataExchangeException(e);
			}
		}

	}

	private char[] replaceChars(String str, char[] searchChars) {
		if (null == str) {
			return this.nullChars;
		}
		char[] newchars = str.toCharArray();
		int strLength = str.length();
		for (int i = 0; i < strLength; i++) {
			if (searchChars[0] == newchars[i] || 13 == newchars[i] || 10 == newchars[i]) {
				newchars[i] = ' ';
			}
		}
		return newchars;
	}

	
	

	private class MyHDFSWriter implements Closeable {
		private SequenceFile.Writer writer = null;
		private long lineCountBeWrited = 0;

		public MyHDFSWriter(SequenceFile.Writer writer) {
			this.writer = writer;
		}

		public void append(Writable k, Writable v) throws IOException {
			writer.append(k, v);

			if (++lineCountBeWrited >= 100) {
				writer.hflush();
				lineCountBeWrited = 0;
			}

		}

		public SequenceFile.Writer getWriter() {
			return this.writer;
		}

		@Override
		public void close() throws IOException {
			this.writer.close();
		}
	}

}
