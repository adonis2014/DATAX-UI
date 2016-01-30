package net.iharding.modules.etl.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 列对应参数Entity
 * @author Joe.zhang
 * @version 2016-01-30
 */
@Entity
@Table(name = "etl_param_column")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class EtlParamColumn extends IdEntity {

	/**
	 * 任务ID
	 */
	@Column(name="task_id")
	private Long taskId;
	/**
	 * 任务参数ID
	 */
	@Column(name="task_param_id")
	private Long taskParamId;
	/**
	 * 列名
	 */
	@Column(name="column_name")
	private String columnName;
	/**
	 * 列序列
	 */
	@Column(name="column_value_index")
	private String columnValueIndex;
	/**
	 * 备注
	 */
	private String remark;
	
	public Long getTaskId() {
		return taskId;
	}

	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}
	
	public Long getTaskParamId() {
		return taskParamId;
	}

	public void setTaskParamId(Long taskParamId) {
		this.taskParamId = taskParamId;
	}
	
	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	
	public String getColumnValueIndex() {
		return columnValueIndex;
	}

	public void setColumnValueIndex(String columnValueIndex) {
		this.columnValueIndex = columnValueIndex;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
