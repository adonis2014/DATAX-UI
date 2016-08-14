package com.taobao.datax.common.util;

import java.io.IOException;
import java.util.Map;

import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;


public class HBaseKeyManager extends IncrementNumber {

	Map<String,Integer> keyMap=new java.util.concurrent.ConcurrentHashMap<String,Integer>();
	private Table keyTable = null;
	
	public HBaseKeyManager(String tableName,String dictName){
		this.tableName=tableName;
		this.dictName=dictName;
	}
	
	public static void main(String[] args){
//		HBaseKeyManager km=new HBaseKeyManager("RPB_ACTIVEUSER","2015-01-01");
//		for(int i=0;i<999;i++){
//			System.out.println(km.cal());
//		}
		System.out.println(Integer.MAX_VALUE);
	}
	
	
	
	@Override
	public long initStartNum()  {
		try {
			if (keyTable==null){
				keyTable = HBaseUtils.getTable(ETLConstants.ENNIU_SYS_TABLE_INCREMENT_ENTITY_CODE);
			}
			Get get = new Get(Bytes.toBytes(this.tableName+"-"+this.dictName));
			// 根据rowkey查询
			Result ur = keyTable.get(get);
			byte[] family=Bytes.toBytes(ETLConstants.DEFAULT_COLUMN_FAMILY);
			if (ur != null) {
				return ETLStringUtils.getIntValueFromResult(ur,family,ETLConstants.ENNIU_SYSINCREMENT_FIELD_MAXID);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return 1;
	}

	@Override
	public void updateStartNum(long intervalMax)  {
		try {
			if (keyTable==null){
				keyTable = HBaseUtils.getTable(ETLConstants.ENNIU_SYS_TABLE_INCREMENT_ENTITY_CODE);
			}
			Put p=new Put(Bytes.toBytes(this.tableName+"-"+this.dictName));
			p.addColumn(Bytes.toBytes(ETLConstants.DEFAULT_COLUMN_FAMILY), Bytes.toBytes(ETLConstants.ENNIU_SYSINCREMENT_FIELD_MAXID), Bytes.toBytes(String.valueOf(intervalMax)));
			keyTable.put(p);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
