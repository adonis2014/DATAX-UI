package net.iharding.modules.etl.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 任务数据定义Entity
 * @author Joe.zhang
 * @version 2016-04-03
 */
@Entity
@Table(name = "etl_taskDsDefine")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class TaskDsDefine extends IdEntity {

	/**
	 * 任务ID
	 */
	private Long taskId;
	/**
	 * 数据分隔符
	 */
	private String fileSplit;
	/**
	 * 数据类型
	 */
	private Integer dataType;
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
	
	public String getFileSplit() {
		return fileSplit;
	}

	public void setFileSplit(String fileSplit) {
		this.fileSplit = fileSplit;
	}
	
	public Integer getDataType() {
		return dataType;
	}

	public void setDataType(Integer dataType) {
		this.dataType = dataType;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}