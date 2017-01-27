package net.iharding.modules.meta.model;

import javax.persistence.CascadeType;
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
 * 数据字段转换定义Entity
 * @author Joe.zhang
 * @version 2016-04-03
 */
@Entity
@Table(name = "meta_column_pair")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ColumnPair extends IdEntity {

	@Column(name="dataset_pair_id",insertable=false,updatable=false)
	private Long datasetPairId;
	
	@ManyToOne(cascade =CascadeType.ALL,targetEntity = DatasetPair.class,fetch = FetchType.LAZY)
	@JoinColumn(name="dataset_pair_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private DatasetPair datasetPair;
	
	@Column(name="read_column_id")	
	private Long readColumnId;
	
	@Column(name="read_column_name")
	private String readColumnName;
	
	@Column(name="write_column_id")
	private Long writeColumnId;
	
	@Column(name="write_column_name")
	private String writeColumnName;
	
	/**
	 * 原数据类别
	 */
	@Column(name="reader_field_type")
	private Integer readerFieldType;
	/**
	 * 字段类别
	 */
	@Column(name="writer_field_type")
	private Integer writerFieldType;
	/**
	 * 字段数据处理函数
	 */
	@Column(name="function_name")
	private String functionName	;
	
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
	
	
	public Long getDatasetPairId() {
		return datasetPairId;
	}

	public void setDatasetPairId(Long datasetPairId) {
		this.datasetPairId = datasetPairId;
	}

	public DatasetPair getDatasetPair() {
		return datasetPair;
	}

	public void setDatasetPair(DatasetPair datasetPair) {
		this.datasetPair = datasetPair;
	}

	public Long getReadColumnId() {
		return readColumnId;
	}

	public void setReadColumnId(Long readColumnId) {
		this.readColumnId = readColumnId;
	}

	public String getReadColumnName() {
		return readColumnName;
	}

	public void setReadColumnName(String readColumnName) {
		this.readColumnName = readColumnName;
	}
	
	public Long getWriteColumnId() {
		return writeColumnId;
	}

	public void setWriteColumnId(Long writeColumnId) {
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
	
	public Integer getReaderFieldType() {
		return readerFieldType;
	}

	public void setReaderFieldType(Integer readerFieldType) {
		this.readerFieldType = readerFieldType;
	}

	public Integer getWriterFieldType() {
		return writerFieldType;
	}

	public void setWriterFieldType(Integer writerFieldType) {
		this.writerFieldType = writerFieldType;
	}

	public String getFunctionName	() {
		return functionName	;
	}

	public void setFunctionName	(String functionName	) {
		this.functionName	 = functionName	;
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