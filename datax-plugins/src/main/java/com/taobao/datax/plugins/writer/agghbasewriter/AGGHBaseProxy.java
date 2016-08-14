package com.taobao.datax.plugins.writer.agghbasewriter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.BufferedMutator;
import org.apache.hadoop.hbase.client.BufferedMutatorParams;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Durability;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.RetriesExhaustedWithDetailsException;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;

import com.taobao.datax.common.model.AggregationRecord;
import com.taobao.datax.common.model.DataProcessField;
import com.taobao.datax.common.util.ETLConstants;
import com.taobao.datax.common.util.ETLStringUtils;
import com.taobao.datax.common.util.ZipStrUtil;

public class AGGHBaseProxy {

	private Configuration config;

	private Connection connection;

	private Table htable;

	private BufferedMutator mutator;

	private Admin admin;

	private TableName htableName;

	private int BUFFER_LINE = 100;

	private List<Put> buffer = new ArrayList<Put>();

	private Logger logger = Logger.getLogger(AGGHBaseProxy.class);

	private Put p;

	ObjectMapper mapper = new ObjectMapper();

	public static AGGHBaseProxy newProxy(String hbase_conf, String table, int bulksize) throws IOException {
		return new AGGHBaseProxy(hbase_conf, table, bulksize);
	}

	private AGGHBaseProxy(String hbase_conf, String tableName, int bulksize) throws IOException {
		Configuration conf = new Configuration();
		conf.addResource(new Path(hbase_conf));
		config = new Configuration(conf);
		htableName = TableName.valueOf(tableName);
		htable = getHBaseConnection().getTable(htableName);
		BufferedMutator.ExceptionListener listener = new BufferedMutator.ExceptionListener() { 
			@Override
			public void onException(RetriesExhaustedWithDetailsException e, BufferedMutator mutator) {
				for (int i = 0; i < e.getNumExceptions(); i++) { 
					logger.info("Failed to sent put: " + e.getRow(i));
				}
			}
		};
		BufferedMutatorParams params = new BufferedMutatorParams(htableName).listener(listener);
		params.writeBufferSize(1024 * 1024 * 10);
		mutator = getHBaseConnection().getBufferedMutator(params);
		admin = getHBaseConnection().getAdmin();
	}

	private Connection getHBaseConnection() {
		if (connection == null) {
			try {
				connection = ConnectionFactory.createConnection(config);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return connection;
	}

	public boolean check() throws IOException {
		// if (!admin.isMasterRunning()) {
		// throw new IllegalStateException("hbase master is not running!");
		// }
		if (!admin.tableExists(htableName)) {
			throw new IllegalStateException("hbase table " + Bytes.toString(htableName.getName()) + " is not existed!");
		}
		if (!admin.isTableAvailable(htableName)) {
			throw new IllegalStateException("hbase table " + Bytes.toString(htableName.getName()) + " is not available!");
		}
		if (!admin.isTableEnabled(htableName)) {
			throw new IllegalStateException("hbase table " + Bytes.toString(htableName.getName()) + " is disable!");
		}

		return true;
	}

	public void close() throws IOException {
		mutator.close();
	}

	public void deleteTable() throws IOException {

	}

	public void deleteTableRows(String startRow, String stopRow) throws IOException {

	}

	public void truncateTable() throws IOException {

	}

	public void flush() throws IOException {
		if (!buffer.isEmpty()) {
			mutator.mutate(buffer);
			buffer.clear();
		}
		mutator.flush();

	}

	public void prepare(byte[] rowKey) {
		this.p = new Put(rowKey);
		this.p.setDurability(Durability.SKIP_WAL);
	}

	public Put add(byte[] family, byte[] qualifier, long timeStamp, byte[] value) {
		return this.p.addColumn(family, qualifier, timeStamp, value);
	}

	public Put add(byte[] family, byte[] qualifier, byte[] value) {
		return this.p.addColumn(family, qualifier, value);
	}

	public void insert(String id) throws IOException {
		buffer.add(this.p);
		if (buffer.size() >= BUFFER_LINE) {
			// 多线程程序，需要即时写入hbase，防止get当前记录合并是出错
			mutator.mutate(buffer);
			buffer.clear();
		}

	}

	/**
	 * 读取以保存的聚合记录
	 * 
	 * @param key
	 * @param fields
	 * @param encode
	 * @return
	 */
	public AggregationRecord getRecord(String key, List<DataProcessField> fields, String encode) {
		Get get = new Get(key.getBytes());
		for (DataProcessField field : fields) {
			if (field.getFieldType() != ETLConstants.FIELD_TYPE_ORI) {
				get.addColumn(Bytes.toBytes(field.getFamilyName()),  Bytes.toBytes(field.getColumnName()));
			}
		}
		try {
			Result resu = htable.get(get);
			if (resu != null && !resu.isEmpty()) {
				AggregationRecord record = new AggregationRecord();
				record.setRowKey(key);
				for (DataProcessField field : fields) {
					if (field.getFieldType() != ETLConstants.FIELD_TYPE_ORI) {
						String vl = Bytes.toString(resu.getValue(Bytes.toBytes(field.getFamilyName()), Bytes.toBytes(field.getColumnName())));
						if (ETLStringUtils.isNotEmpty(vl)) {
							if (field.getCompress() == 1) {
								record.putValue(field.getColumnName(), ZipStrUtil.unCompress(vl));
							} else {
								record.putValue(field.getColumnName(), vl);
							}
						}
					}
				}
				return record;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Map<String, AggregationRecord> getRecords(Set<String> keySet, List<DataProcessField> fields, String encode) {
		List<Get> gets = new ArrayList<Get>();
		Map<String, AggregationRecord> records = new java.util.concurrent.ConcurrentHashMap<String, AggregationRecord>();
		for (String key : keySet) {
			Get get = new Get(key.getBytes());
			for (DataProcessField field : fields) {
				if (field.getFieldType() != ETLConstants.FIELD_TYPE_ORI) {
					get.addColumn(Bytes.toBytes(field.getFamilyName()),  Bytes.toBytes(field.getColumnName()));
				}
			}
			gets.add(get);
			if (gets.size() > this.BUFFER_LINE) {
				try {
					Result[] resus = htable.get(gets);
					for (Result resu : resus) {
						if (resu != null && !resu.isEmpty()) {
							AggregationRecord record = new AggregationRecord();
							record.setRowKey(Bytes.toString(resu.getRow()));
							for (DataProcessField field : fields) {
								if (field.getFieldType() != ETLConstants.FIELD_TYPE_ORI) {
									String vl = Bytes.toString(resu.getValue(Bytes.toBytes(field.getFamilyName()), Bytes.toBytes(field.getColumnName())));
									if (ETLStringUtils.isNotEmpty(vl)) {
										if (field.getCompress() == 1) {
											record.putValue(field.getColumnName(), ZipStrUtil.unCompress(vl));
										} else {
											record.putValue(field.getColumnName(), vl);
										}
									}
								}
							}
							records.put(record.getRowKey(), record);
						}
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
				gets.clear();
			}
		}
		if (gets.size() > 0) {
			try {
				Result[] resus = htable.get(gets);
				for (Result resu : resus) {
					if (resu != null && !resu.isEmpty()) {
						AggregationRecord record = new AggregationRecord();
						record.setRowKey(Bytes.toString(resu.getRow()));
						for (DataProcessField field : fields) {
							if (field.getFieldType() != ETLConstants.FIELD_TYPE_ORI) {
								String vl = Bytes.toString(resu.getValue(Bytes.toBytes(field.getFamilyName()), Bytes.toBytes(field.getColumnName())));
								if (ETLStringUtils.isNotEmpty(vl)) {
									if (field.getCompress() == 1) {
										record.putValue(field.getColumnName(), ZipStrUtil.unCompress(vl));
									} else {
										record.putValue(field.getColumnName(), vl);
									}
								}
							}
						}
						records.put(record.getRowKey(), record);
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			gets.clear();
		}
		return records;
	}
}
