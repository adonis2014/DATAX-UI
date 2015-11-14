package com.taobao.datax.common.model;

import java.util.List;
import java.util.Map;
/**
 * 数据处理的结果集记录
 * @author admin
 *
 */
public class DataProcessEntity implements java.io.Serializable {


	private static final long serialVersionUID = 3545932893525581317L;
	private String name;
	private String processClassName;//行处理前需要进行的运算，包括join的其他表数据
	private String validatorClassName;//验证是否清洗改行
	private List<DataProcessField> fields;
	private Map<String,String> params;
	
	public String getValidatorClassName() {
		return validatorClassName;
	}
	public void setValidatorClassName(String validatorClassName) {
		this.validatorClassName = validatorClassName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProcessClassName() {
		return processClassName;
	}
	public void setProcessClassName(String processClassName) {
		this.processClassName = processClassName;
	}
	public List<DataProcessField> getFields() {
		return fields;
	}
	public void setFields(List<DataProcessField> fields) {
		this.fields = fields;
	}
	public Map<String, String> getParams() {
		return params;
	}
	public void setParams(Map<String, String> params) {
		this.params = params;
	}
	
	
}
