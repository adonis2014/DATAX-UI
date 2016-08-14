package com.taobao.datax.common.model;


/**
 * 字段定义
 * 
 * @author admin
 * 
 */
public class FieldItem {
	// hbase字段名
	private String fieldName;
	// 列族名
	private String familyName;
	// es索引定义字段名
	private String esFieldName;
	//字段类型  0-字符串 1-数字 2-日期
	private int type;
	//格式
	private String format="";
	//显示标题
	private String title;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public String getFamilyName() {
		return familyName;
	}
	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}
	public String getEsFieldName() {
		return esFieldName;
	}
	public void setEsFieldName(String esFieldName) {
		this.esFieldName = esFieldName;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}
	
	
}
