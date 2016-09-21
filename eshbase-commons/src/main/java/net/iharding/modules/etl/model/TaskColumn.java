package net.iharding.modules.etl.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 数据字段转换定义Entity
 * @author Joe.zhang
 * @version 2016-04-03
 */
@Entity
@Table(name = "etl_task_column")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class TaskColumn extends IdEntity {

	@Column(name="job_id")
	private Integer jobId;
	
	@Column(name="read_task_id")
	private Integer readTaskId;
	
	@Column(name="read_column_id")	
	private Integer readColumnId;
	
	@Column(name="read_column_name")
	private String readColumnName;
	
	@Column(name="write_task_id")	
	private Integer writeTaskId;
	
	@Column(name="write_column_id")
	private Integer writeColumnId;
	
	@Column(name="write_column_name")
	private String writeColumnName;
	
	/**
	 * 原数据类别
	 */
	@Column(name="field_source_type")
	private Integer fieldSourceType;
	/**
	 * 字段类别
	 */
	@Column(name="field_type")
	private Integer fieldType;
	/**
	 * 字段数据处理函数
	 */
	@Column(name="function_name")
	private String functionName	;
	/**
	 * 关键字字段数据处理函数
	 */
	@Column(name="pk_function_name")
	private String pkFunctionName;
	/**
	 * 字段处理脚本
	 */
	@Column(name="script")
	private String script;
	/**
	 * 脚本类别
	 */
	@Column(name="script_type")
	private String scriptType;
	/**
	 * 自定义类名
	 */
	@Column(name="process_class_name")
	private String class_name;
	/**
	 * 字段排序值
	 */
	@Column(name="sort_id")
	private Integer sortId;
	/**
	 * 备注
	 */
	private String remark;
	
	
	
	public Integer getJobId() {
		return jobId;
	}

	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}

	public Integer getReadTaskId() {
		return readTaskId;
	}

	public void setReadTaskId(Integer readTaskId) {
		this.readTaskId = readTaskId;
	}

	public Integer getReadColumnId() {
		return readColumnId;
	}

	public void setReadColumnId(Integer readColumnId) {
		this.readColumnId = readColumnId;
	}

	public String getReadColumnName() {
		return readColumnName;
	}

	public void setReadColumnName(String readColumnName) {
		this.readColumnName = readColumnName;
	}

	public Integer getWriteTaskId() {
		return writeTaskId;
	}

	public void setWriteTaskId(Integer writeTaskId) {
		this.writeTaskId = writeTaskId;
	}

	public Integer getWriteColumnId() {
		return writeColumnId;
	}

	public void setWriteColumnId(Integer writeColumnId) {
		this.writeColumnId = writeColumnId;
	}

	public String getWriteColumnName() {
		return writeColumnName;
	}

	public void setWriteColumnName(String writeColumnName) {
		this.writeColumnName = writeColumnName;
	}

	public String getScriptType() {
		return scriptType;
	}

	public void setScriptType(String scriptType) {
		this.scriptType = scriptType;
	}

	public Integer getSortId() {
		return sortId;
	}

	public void setSortId(Integer sortId) {
		this.sortId = sortId;
	}

	public Integer getFieldSourceType() {
		return fieldSourceType;
	}

	public void setFieldSourceType(Integer fieldSourceType) {
		this.fieldSourceType = fieldSourceType;
	}
	
	public Integer getFieldType() {
		return fieldType;
	}

	public void setFieldType(Integer fieldType) {
		this.fieldType = fieldType;
	}
	
	public String getFunctionName	() {
		return functionName	;
	}

	public void setFunctionName	(String functionName	) {
		this.functionName	 = functionName	;
	}
	
	public String getPkFunctionName() {
		return pkFunctionName;
	}

	public void setPkFunctionName(String pkFunctionName) {
		this.pkFunctionName = pkFunctionName;
	}
	
	public String getScript() {
		return script;
	}

	public void setScript(String script) {
		this.script = script;
	}
	
	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}