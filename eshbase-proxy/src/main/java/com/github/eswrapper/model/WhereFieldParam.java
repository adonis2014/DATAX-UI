package com.github.eswrapper.model;


public class WhereFieldParam {

	private String fieldName;

	private String paramValue;

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getParamValue() {
		return paramValue;
	}

	public void setParamValue(String paramValue) {
		this.paramValue = paramValue;
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

	// 字段类型 0-字符串 1-数字 2-日期
	private int type = 0;

	// 格式定义
	private String format="";
}
