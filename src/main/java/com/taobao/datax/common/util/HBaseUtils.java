package com.taobao.datax.common.util;


import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.client.coprocessor.AggregationClient;



public class HBaseUtils {
	private static Configuration config =getConfiguration();
	private static HBaseAdmin admin;
	
	public static Connection connection =null; 

	/**
	 * 从连接池获取HTable对象
	 * 
	 * @param tableName
	 * @return
	 * @throws IOException
	 */
	public static Table getTable(String tableName) throws IOException {
		return getHBaseConnection().getTable(TableName.valueOf(tableName));
	}
	
	public static Connection getHBaseConnection(){
		if (connection==null){
			try {
				connection=ConnectionFactory.createConnection(config);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return connection;
	}
	
	/**
	 * 获取HBase配置
	 * @author zhangxuhui 2013-7-26 下午05:20:44
	 * @return
	 */
	public static Configuration getConfiguration() {
		Configuration conf = HBaseConfiguration.create();
		conf.addResource(conf.getClass().getResourceAsStream("/hbase-site.xml"));
		System.setProperty("HADOOP_USER_NAME", "hdfs");
		return conf;
	}


	/**
	 * 获取HAdmin对象，建表等操作
	 * 
	 * @param tableName
	 * @return
	 * @throws IOException
	 */
	public static HBaseAdmin getHBaseAdmin() throws IOException {
		if (admin == null) {
			admin = new HBaseAdmin(config);
		}
		return admin;
	}

	
	/**
	 * 释放HTable对象
	 * @param table
	 * @throws IOException
	 */
	public static void doReleaseTable(Table table) {
		if (table == null) {
			return;
		}
		try {
//			table.flushCommits();
			table.close();
			table=null;
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	public static void doCloseTable(Table table) {
		if (table == null) {
			return;
		}
		try {
			table.close();
			table=null;
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}

	public static AggregationClient getAggregationClient() {
		return new AggregationClient(config);
	}
}
