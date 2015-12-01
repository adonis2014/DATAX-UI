package net.iharding.modules.meta.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.guess.core.orm.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 表字段Entity
 * @author Joe.zhang
 * @version 2015-12-01
 */
@Entity
@Table(name = "meta_column")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Column extends IdEntity {

	/**
	 * 表ID
	 */
	private Long tableId;
	/**
	 * 字段名
	 */
	private String columnName;
	/**
	 * 字段中文名
	 */
	private String columnPName;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 类别
	 */
	private Integer type;
	/**
	 * 是否存储
	 */
	private String store;
	/**
	 * docValues
	 */
	private String docValues;
	/**
	 * 是否索引
	 */
	private String index;
	/**
	 * 是否必须
	 */
	private String required;
	/**
	 * 格式
	 */
	private String format;
	
	public Long getTableId() {
		return tableId;
	}

	public void setTableId(Long tableId) {
		this.tableId = tableId;
	}
	
	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	
	public String getColumnPName() {
		return columnPName;
	}

	public void setColumnPName(String columnPName) {
		this.columnPName = columnPName;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}
	
	public String getDocValues() {
		return docValues;
	}

	public void setDocValues(String docValues) {
		this.docValues = docValues;
	}
	
	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
	}
	
	public String getRequired() {
		return required;
	}

	public void setRequired(String required) {
		this.required = required;
	}
	
	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}
	
	
}