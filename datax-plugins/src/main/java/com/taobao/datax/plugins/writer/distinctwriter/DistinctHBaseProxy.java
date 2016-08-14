package com.taobao.datax.plugins.writer.distinctwriter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.collections.map.LRUMap;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.client.Durability;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.log4j.Logger;


public class DistinctHBaseProxy {

	private Configuration config;

	private HTable htable;
	
	private HTable readtable;
	
	private static final int BUFFER_LINE = 64;
	
	private List<Put> buffer = new ArrayList<Put>(BUFFER_LINE);
	private List<Get> getBuffer = new ArrayList<Get>(BUFFER_LINE);
	private Map<String,List<Put>> putMap = new ConcurrentHashMap<String,List<Put>>();

	private Put p;
	private Get g;
	private String[] readColumnNames;
	private String[] readFamilies = null;
	
	private Logger logger = Logger.getLogger(DistinctHBaseProxy.class);

	private String[] readQualifiers = null;
	private LRUMap map=new LRUMap(64);

	public static DistinctHBaseProxy newProxy(String hbase_conf, String table,String readtablename,String[] readColumnNames) 
			throws IOException {
		return new DistinctHBaseProxy(hbase_conf, table,readtablename,readColumnNames);
	}
	
	@SuppressWarnings("deprecation")
	private DistinctHBaseProxy(String hbase_conf, String tableName,String readtablename,String[] readColumnNames)
			throws IOException {
		Configuration conf = new Configuration();
		conf.addResource(new Path(hbase_conf));
		config = new Configuration(conf);
		htable = new HTable(config, tableName);
		htable.setAutoFlush(false, false);
		htable.setWriteBufferSize(1024*1024*10);
		readtable=new HTable(config,readtablename);
		readtable.setAutoFlush(false, false);
		readtable.setWriteBufferSize(1024*1024*10);
		this.readColumnNames=readColumnNames;
		readQualifiers = new String[readColumnNames.length];
		readFamilies = new String[readColumnNames.length];
		for (int i = 0; i < readColumnNames.length; i++) {
			if (!readColumnNames[i].contains(":")) {
				throw new IllegalArgumentException(String.format("Column %s must be like 'family:qualifier'", readColumnNames[i]));
			}
			String[] tmps = readColumnNames[i].split(":");
			readFamilies[i] = tmps[0].trim();
			readQualifiers[i] = tmps[1].trim();
		}
	}

	public void setBufferSize(int bufferSize) throws IOException {
		this.htable.setWriteBufferSize(bufferSize);
	}
	
	@SuppressWarnings("deprecation")
	public void setHTable(String tableName) throws IOException {
		this.htable = new HTable(config, tableName);
	}

	@SuppressWarnings("deprecation")
	public void setAutoFlush(boolean autoflush) {
		this.htable.setAutoFlush(autoflush);
	}

	public boolean check() throws IOException {
		return true;
	}

	public void close() throws IOException {
		htable.close();
	}

	

	public void flush() throws IOException {
		if (!buffer.isEmpty()) {
			htable.put(buffer);
			buffer.clear();
		}
		htable.flushCommits();
	}

	@SuppressWarnings("unchecked")
	public void prepare(byte[] rowKey,byte[] getRowKey) {
		this.p = new Put(rowKey);
		this.p.setDurability(Durability.SKIP_WAL);
		if (this.map.containsKey(Bytes.toString(getRowKey))){//已经包含
			Map<String,String> currRow=(Map<String,String>)map.get(Bytes.toString(getRowKey));
			for(int i = 0; i < readColumnNames.length; i++){
				this.p.addColumn(readFamilies[i].getBytes(), readQualifiers[i].getBytes(), currRow.get(readColumnNames[i]).getBytes());
			}
		}else{
			this.g=new Get(getRowKey);
			for(int i = 0; i < readColumnNames.length; i++){
				this.g.addColumn(readFamilies[i].getBytes(), readQualifiers[i].getBytes());
			}
			getBuffer.add(g);
		}
		
	}
	
//	private boolean 
	
	public Put add(byte[] family, byte[] qualifier,long timeStamp, byte[] value) {
		return this.p.addColumn(family, qualifier,timeStamp, value);
	}
	
	public Put add(byte[] family, byte[] qualifier, byte[] value) {
		return this.p.addColumn(family, qualifier, value);
	}
	
	public void insert() throws IOException {
		if (this.map.containsKey(Bytes.toString(g.getRow()))){//已经包含
			buffer.add(this.p);
		}else{//未包含，保存入集合
			if(putMap.get(Bytes.toString(g.getRow()))==null){//未保存过
				List<Put> puts=new ArrayList<Put>();
				puts.add(this.p);
				putMap.put(Bytes.toString(g.getRow()),puts);
			}else{
				List<Put> puts=putMap.get(Bytes.toString(g.getRow()));
				puts.add(this.p);
			}
		}
		if (getBuffer.size() >= BUFFER_LINE) {
			//批量获取get数据，设置puts
			long currtime=System.currentTimeMillis();
			Result[] rs = readtable.get(getBuffer);
			logger.info("get "+getBuffer.size()+" lines  consuming:"+(System.currentTimeMillis()-currtime));
			currtime=System.currentTimeMillis();
			byte[] fv = null;
			for (Result ur : rs) {
				if (ur != null && !ur.isEmpty()) {
					Map<String,String> currRow=new ConcurrentHashMap<String,String>();
					List<Put> puts=putMap.get(Bytes.toString(ur.getRow()));
					for(int i = 0; i < readColumnNames.length; i++){
						fv=ur.getValue(Bytes.toBytes(readFamilies[i]),Bytes.toBytes(readQualifiers[i]));
						//增加put
						if (puts!=null){
							for(Put put:puts){
								put.addColumn(readFamilies[i].getBytes(), readQualifiers[i].getBytes(), fv);
							}
						}
						currRow.put(readColumnNames[i],Bytes.toString(fv));
					}
					buffer.addAll(puts);
					map.put(Bytes.toString(ur.getRow()), currRow);
				}
			}
			htable.put(buffer);
			htable.flushCommits();
			logger.info("put "+buffer.size()+" lines  consuming:"+(System.currentTimeMillis()-currtime));
			buffer.clear();
			getBuffer.clear();
			putMap.clear();
			
		}
	}

}
