package com.taobao.datax.plugins.writer.pipehbasehdfswriter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.taobao.datax.common.model.AggregationRecord;
import com.taobao.datax.common.model.DataProcessField;
import com.taobao.datax.common.util.ETLConstants;
import com.taobao.datax.common.util.ETLStringUtils;
import com.taobao.datax.common.util.ZipStrUtil;

public class PipeHBaseHdfsProxy {

	private Configuration config;

	private Connection connection;

	private Table htable;

	private Admin admin;

	private int BUFFER_LINE=4096;

	private List<Put> buffer = new ArrayList<Put>();

	private Put p;

	ObjectMapper mapper = new ObjectMapper();

	public static PipeHBaseHdfsProxy newProxy(String hbase_conf, String table, int bulksize) throws IOException {
		return new PipeHBaseHdfsProxy(hbase_conf, table, bulksize);
	}

	private PipeHBaseHdfsProxy(String hbase_conf, String tableName, int bulksize) throws IOException {
		Configuration conf = new Configuration();
		conf.addResource(new Path(hbase_conf));
		config = new Configuration(conf);
		htable = getTable(tableName);
		admin = getHBaseConnection().getAdmin();
		this.BUFFER_LINE=bulksize;
	}

	public Table getTable(String tableName) throws IOException {
		return getHBaseConnection().getTable(TableName.valueOf(tableName));
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

	public void setBufferSize(int bufferSize) throws IOException {
		this.htable.setWriteBufferSize(bufferSize);
	}

	public void setHTable(String tableName) throws IOException {
		this.htable = getTable(tableName);
	}

	public void setAutoFlush(boolean autoflush) {
		// this.htable.setAutoFlush(autoflush);
	}

	public boolean check() throws IOException {
		// if (!admin.isMasterRunning()) {
		// throw new IllegalStateException("hbase master is not running!");
		// }
		if (!admin.tableExists(htable.getName())) {
			throw new IllegalStateException("hbase table " + Bytes.toString(htable.getName().getName()) + " is not existed!");
		}
		if (!admin.isTableAvailable(htable.getName())) {
			throw new IllegalStateException("hbase table " + Bytes.toString(htable.getName().getName()) + " is not available!");
		}
		if (!admin.isTableEnabled(htable.getName())) {
			throw new IllegalStateException("hbase table " + Bytes.toString(htable.getName().getName()) + " is disable!");
		}

		return true;
	}

	public void close() throws IOException {
		htable.close();
	}

	public void deleteTable() throws IOException {
		
	}
	
	public void deleteTableRows(String startRow,String stopRow) throws IOException {
		
	}

	public void truncateTable() throws IOException {

	}

	public void flush() throws IOException {
		if (!buffer.isEmpty()) {
			htable.put(buffer);
			buffer.clear();
		}
		admin.flush(htable.getName());
		
	}


	public void prepare(byte[] rowKey) {
		this.p = new Put(rowKey);
	}

	public Put add(byte[] family, byte[] qualifier, long timeStamp, byte[] value) {
		return this.p.addColumn(family, qualifier, timeStamp, value);
	}

	public Put add(byte[] family, byte[] qualifier, byte[] value) {
		return this.p.addColumn(family, qualifier, value);
	}

	@SuppressWarnings("rawtypes")
	public void insert(String id, Map map) throws IOException {
		buffer.add(this.p);
		if (buffer.size() >= BUFFER_LINE) {
		//多线程程序，需要即时写入hbase，防止get当前记录合并是出错
			htable.put(buffer);
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
		try {
			Result resu = htable.get(get);
			if (resu != null && !resu.isEmpty()) {
				AggregationRecord record = new AggregationRecord();
				record.setRowKey(key);
				for (DataProcessField field : fields) {
					if (field.getFieldType() != ETLConstants.FIELD_TYPE_ORI) {
						String vl= Bytes.toString(resu.getValue(Bytes.toBytes(field.getFamilyName()), Bytes.toBytes(field.getColumnName())));
						if (ETLStringUtils.isNotEmpty(vl)){
							if (field.getCompress()==1){
								record.putValue(field.getColumnName(),ZipStrUtil.unCompress(vl));
							}else{
								record.putValue(field.getColumnName(),vl);
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
		List<Get> gets=new ArrayList<Get>();
		for(String key:keySet){
			Get get = new Get(key.getBytes());
			gets.add(get);
		}
		Map<String, AggregationRecord> records=new java.util.concurrent.ConcurrentHashMap<String, AggregationRecord>();
		try {
			Result[] resus = htable.get(gets);
			for(Result resu:resus){
				if (resu != null && !resu.isEmpty()) {
					AggregationRecord record = new AggregationRecord();
					record.setRowKey(Bytes.toString(resu.getRow()));
					for (DataProcessField field : fields) {
						if (field.getFieldType() != ETLConstants.FIELD_TYPE_ORI) {
							String vl= Bytes.toString(resu.getValue(Bytes.toBytes(field.getFamilyName()), Bytes.toBytes(field.getColumnName())));
							if (ETLStringUtils.isNotEmpty(vl)){
								if (field.getCompress()==1){
									record.putValue(field.getColumnName(),ZipStrUtil.unCompress(vl));
								}else{
									record.putValue(field.getColumnName(),vl);
								}
							}
						}
					}
					records.put(record.getRowKey(),record);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return records;
	}
}
