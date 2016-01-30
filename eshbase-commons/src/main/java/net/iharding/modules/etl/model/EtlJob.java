package net.iharding.modules.etl.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * ETL调度作业Entity
 * @author Joe.zhang
 * @version 2016-01-30
 */
@Entity
@Table(name = "etl_etlJob")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class EtlJob extends IdEntity {

	/**
	 * 调度作业名
	 */
	private String jobName;
	/**
	 * 下次执行时间
	 */
	private Date nextExeDate;
	/**
	 * 调度设置
	 */
	private String cronTrigger;
	/**
	 * 状态
	 */
	private Integer status;
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
	 * 启用标记
	 */
	private Integer checkLabel;
	/**
	 * 备注
	 */
	private String remark;
	
	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	
	public Date getNextExeDate() {
		return nextExeDate;
	}

	public void setNextExeDate(Date nextExeDate) {
		this.nextExeDate = nextExeDate;
	}
	
	public String getCronTrigger() {
		return cronTrigger;
	}

	public void setCronTrigger(String cronTrigger) {
		this.cronTrigger = cronTrigger;
	}
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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
	
	public Integer getCheckLabel() {
		return checkLabel;
	}

	public void setCheckLabel(Integer checkLabel) {
		this.checkLabel = checkLabel;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}