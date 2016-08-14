package com.taobao.datax.plugins.reader.hbasereader;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.HConstants;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;

public class HBaseFindProxy {
	
	private static final int BUFFER_LINE = 1024;
	
	private List<Delete> deleteBuffer = new ArrayList<Delete>(BUFFER_LINE);
	
	private Configuration config;

	private HTable htable;

	private HTable ftable;

	
	private HBaseFindProxy(String hbase_conf, String tableName, String findTableName) throws IOException {
		Configuration conf = new Configuration();
		conf.addResource(new Path(hbase_conf));
		config = new Configuration(conf);
		config.setLong(HConstants.HBASE_CLIENT_SCANNER_TIMEOUT_PERIOD, 240000);
		htable = new HTable(config, tableName);
		ftable = new HTable(config, findTableName);
	}
	
	public static HBaseFindProxy newProxy(String hbase_conf, String tableName, String findTableName)throws IOException {
		return new HBaseFindProxy(hbase_conf, tableName,findTableName);
	}
	
	public void close() throws IOException {
		htable.close();
		ftable.close();
	}
	
	public boolean getRow(byte[] rowid) throws IOException{
		Get get=new Get(rowid);
		Result res=ftable.get(get);
		if (res!=null && !res.isEmpty()){
			return true;
		}else{
			return false;
		}
	}

	public void delete(byte[] rowid) throws IOException {
		Delete del=new Delete(rowid); 
		deleteBuffer.add(del);
		if (deleteBuffer.size() >= BUFFER_LINE) {
			htable.delete(deleteBuffer);
			deleteBuffer.clear();
		}
	}
	
	public void flush() throws IOException {
		if (!deleteBuffer.isEmpty()) {
			htable.delete(deleteBuffer);
			deleteBuffer.clear();
		}
		htable.flushCommits();
	}
}
