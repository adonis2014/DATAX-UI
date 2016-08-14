package com.taobao.datax.common.model;

import java.util.List;
/**
 * 集合条件
 * @author admin
 *
 */
public class WhereListParam {

	private String fieldName;
	
	private List<String> paramValues;
	
	//字段类型  0-字符串 1-数字 2-日期
	private int type;
	//是否范围表示，使用/间隔范围值
	private int isRange;
	
	//格式定义
	private String format="";
	
	public int getIsRange() {
		return isRange;
	}

	public void setIsRange(int isRange) {
		this.isRange = isRange;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public List<String> getParamValues() {
		return paramValues;
	}

	public void setParamValues(List<String> paramValues) {
		this.paramValues = paramValues;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
	
}
