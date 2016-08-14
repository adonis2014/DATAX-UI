package com.taobao.datax.common.model;
/**
 * 数据处理字段定义
 * @author admin
 *
 */
public class DataProcessField {
	// 对应接收到数据的id
	private int id;
	// 字段名，唯一
	private String columnName;
	// 预统计函数名
	private String functionName;
	//主键处理函数名
	private String pkFunctionName;
	// 列族名
	private String familyName;
	// velocity脚本
	private String script;
	// 自定义实现接口的类
	private String className;
	
	// 字段类别
	private int fieldSourceType;//0-read源数据 1-根据read从接口获取数据字段
	
	// 字段类别
	private int fieldType;// 1-仅取值字段，仅hbase字段 2-主键组合字段 3-统计字段 

	private int sortId;// 排序序号
	
	private int compress=0;//是否压缩，0-不压缩，1=压缩
	
	private int escape=0;//是否转义，0-不转义 1-转义

	private String remark;// 备注
	
	
	
	public String getPkFunctionName() {
		return pkFunctionName;
	}

	public void setPkFunctionName(String pkFunctionName) {
		this.pkFunctionName = pkFunctionName;
	}

	public int getEscape() {
		return escape;
	}

	public void setEscape(int escape) {
		this.escape = escape;
	}

	public int getCompress() {
		return compress;
	}

	public void setCompress(int compress) {
		this.compress = compress;
	}

	public int getFieldSourceType() {
		return fieldSourceType;
	}

	public void setFieldSourceType(int fieldSourceType) {
		this.fieldSourceType = fieldSourceType;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public int getSortId() {
		return sortId;
	}

	public void setSortId(int sortId) {
		this.sortId = sortId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getFieldType() {
		return fieldType;
	}

	public void setFieldType(int fieldType) {
		this.fieldType = fieldType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	public String getFamilyName() {
		return familyName;
	}

	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}

	public String getScript() {
		return script;
	}

	public void setScript(String script) {
		this.script = script;
	}

}
