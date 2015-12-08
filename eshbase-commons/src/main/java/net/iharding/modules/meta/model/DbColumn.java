package net.iharding.modules.meta.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 * 字段(属性)对象Entity
 * @author Joe.zhang
 * @version 2015-12-03
 */
@Entity
@Table(name = "meta_column")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class DbColumn extends IdEntity {

	/**
	 * 表对象
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="table_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private DBTable table;
	
	/**
	 * 字段属性编码
	 */
	@Column(name="field_code")
	private String fieldCode;
	/**
	 * 字段名
	 */
	@Column(name="column_name")
	private String columnName;
	/**
	 * 逻辑名
	 */
	@Column(name="column_pname")
	private String columnPname;
	/**
	 * 列族名
	 */
	@Column(name="family_name")
	private String familyName;
	/**
	 * 索引库对象
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="index_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private DBIndex dbindex;
	
	/**
	 * 字段类别
	 */
	private String type;
	/**
	 * 是否存储
	 */
	private String store="false";
	/**
	 * es doc类型
	 */
	private String doc_values="true";
	/**
	 * 是否索引
	 */
	private String index="true";
	/**
	 * 是否必须
	 */
	private String required="false";
	/**
	 * 格式
	 */
	private String format;
	/**
	 * 备注
	 */
	private String remark;
	
	public DBTable getTable() {
		return table;
	}

	public void setTable(DBTable table) {
		this.table = table;
	}
	
	public String getFieldCode() {
		return fieldCode;
	}

	public void setFieldCode(String fieldCode) {
		this.fieldCode = fieldCode;
	}
	
	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	
	public String getColumnPname() {
		return columnPname;
	}

	public void setColumnPname(String columnPname) {
		this.columnPname = columnPname;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}
	
	public String getDoc_values() {
		return doc_values;
	}

	public void setDoc_values(String doc_values) {
		this.doc_values = doc_values;
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
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}