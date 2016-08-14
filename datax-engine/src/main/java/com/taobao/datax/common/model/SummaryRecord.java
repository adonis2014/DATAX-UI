package com.taobao.datax.common.model;


import java.io.Serializable;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 预统计记录对象
 * @author zhangxuhui
 * 
 */
public class SummaryRecord implements Serializable {

	/**
	 * 统计用key value值
	 */
	private static final long serialVersionUID = -8420557508102208473L;
	/**
	 * 系统设置的座位rowid的字段组合而成
	 */	
	private String keyVal;
	
	/**
	 * 预统计的值
	 * 基本结构是，rowid的字段和需要统计的值，以及明细统计的json
	*/
	private Map<String,String> filedVal=new ConcurrentHashMap<String,String>();
	
	public static String JSON_ROWS_KEY = "rows";
	/**
	 * 预统计记录集，从JSon转换过来
	 */
	private Map<String,Map<String, String>> rows=new ConcurrentHashMap<String,Map<String, String>>();
	
	public Map<String, Map<String, String>> getRows() {
		return rows;
	}

	public void setRows(Map<String, Map<String, String>> rows) {
		this.rows = rows;
	}

	public String getKeyVal() {
		return keyVal;
	}

	public void setKeyVal(String keyVal) {
		this.keyVal = keyVal;
	}

	public Map<String,String> getFiledVal() {
		return filedVal;
	}

	public void setFiledVal(Map<String,String> filedVal) {
		this.filedVal = filedVal;
	}

	public void clear(){
		keyVal=null;
		filedVal.clear();
		Map<String,String> row=null;
		if (rows!=null){
			Iterator<Map<String, String>> iter=rows.values().iterator();
			while(iter.hasNext()){
				row=iter.next();
				row.clear();
			}
			rows.clear();	
			row=null;
			rows=null;
		}	
	}
}
