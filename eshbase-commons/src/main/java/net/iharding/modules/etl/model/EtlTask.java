package net.iharding.modules.etl.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * ETL任务Entity
 * @author Joe.zhang
 * @version 2016-01-30
 */
@Entity
@Table(name = "etl_etlTask")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class EtlTask extends IdEntity {

	/**
	 * 任务名
	 */
	private String taskName;
	/**
	 * 调度id
	 */
	private Integer jobId;
	/**
	 * 插件id
	 */
	private Integer pluginId;
	/**
	 * 建立者
	 */
	private Long createbyId;
	/**
	 * 更新者
	 */
	private Long updatebyId;
	/**
	 * 建立时间
	 */
	private Date createDate;
	/**
	 * 更新时间
	 */
	private Date updateDate;
	/**
	 * 备注
	 */
	private String remark;
	
	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	
	public Integer getJobId() {
		return jobId;
	}

	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}
	
	public Integer getPluginId() {
		return pluginId;
	}

	public void setPluginId(Integer pluginId) {
		this.pluginId = pluginId;
	}
	
	public Long getCreatebyId() {
		return createbyId;
	}

	public void setCreatebyId(Long createbyId) {
		this.createbyId = createbyId;
	}
	
	public Long getUpdatebyId() {
		return updatebyId;
	}

	public void setUpdatebyId(Long updatebyId) {
		this.updatebyId = updatebyId;
	}
	
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}