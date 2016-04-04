package net.iharding.modules.etl.model;

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
@Table(name = "etl_taskColumn")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class TaskColumn extends IdEntity {

	/**
	 * 数据源定义ID
	 */
	private Long dsDefineId;
	/**
	 * 字段ID
	 */
	private Integer columnIdx;
	/**
	 * 列族名
	 */
	private String familyName;
	/**
	 * 列名
	 */
	private String column_name;
	/**
	 * 原数据类别
	 */
	private Integer fieldSourceType;
	/**
	 * 字段类别
	 */
	private Integer fieldType;
	/**
	 * 字段数据处理函数
	 */
	private String functionName	;
	/**
	 * 关键字字段数据处理函数
	 */
	private String pkFunctionName;
	/**
	 * 字段处理脚本
	 */
	private String script;
	/**
	 * 脚本类别
	 */
	private String script_type;
	/**
	 * 自定义类名
	 */
	private String class_name;
	/**
	 * 字段排序值
	 */
	private Integer sort_id;
	/**
	 * 备注
	 */
	private String remark;
	
	public Long getDsDefineId() {
		return dsDefineId;
	}

	public void setDsDefineId(Long dsDefineId) {
		this.dsDefineId = dsDefineId;
	}
	
	public Integer getColumnIdx() {
		return columnIdx;
	}

	public void setColumnIdx(Integer columnIdx) {
		this.columnIdx = columnIdx;
	}
	
	public String getFamilyName() {
		return familyName;
	}

	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}
	
	public String getColumn_name() {
		return column_name;
	}

	public void setColumn_name(String column_name) {
		this.column_name = column_name;
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
	
	public String getScript_type() {
		return script_type;
	}

	public void setScript_type(String script_type) {
		this.script_type = script_type;
	}
	
	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	
	public Integer getSort_id() {
		return sort_id;
	}

	public void setSort_id(Integer sort_id) {
		this.sort_id = sort_id;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}