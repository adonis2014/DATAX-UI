package com.taobao.datax.common.model;

import java.io.Serializable;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
/**
 * 聚合记录
 * @author admin
 *
 */
public class AggregationRecord implements Serializable {

	private static final long serialVersionUID = 3341763603735574621L;

	/**
	 * 系统设置的座位rowid的字段组合而成
	 */
	private String rowKey;
	//聚合的有效记录数，不包括清洗的记录
	private int aggRowNum=0;
	//聚合的记录数
	private int rowNum=0;
	/**
	 * 字段对应的值
	 */
	private Map<String, Object> filedVal = new ConcurrentHashMap<String, Object>();

	public String getRowKey() {
		return rowKey;
	}

	public void setRowKey(String rowKey) {
		this.rowKey = rowKey;
	}

	public Map<String, Object> getFiledVal() {
		return filedVal;
	}
	
	public void putValue(String key,Object value){
		filedVal.put(key, value);
	}
	
	public Object getValue(String key){
		return filedVal.get(key);
	}

	public void setFiledVal(Map<String, Object> filedVal) {
		this.filedVal = filedVal;
	}
	
	public int getAggRowNum() {
		return aggRowNum;
	}

	public void setAggRowNum(int aggRowNum) {
		this.aggRowNum = aggRowNum;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public void clear(){
		rowKey=null;
		filedVal.clear();
	}

}
