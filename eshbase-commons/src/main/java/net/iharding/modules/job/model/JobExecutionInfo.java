package net.iharding.modules.job.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 作业任务日志Entity
 * @author Joe.zhang
 * @version 2016-02-11
 */
@Entity
@Table(name = "job_jobExecutionInfo")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class JobExecutionInfo extends IdEntity {

	/**
	 * 作业执行ID
	 */
	private Long workerId;
	/**
	 * 分片项
	 */
	private Integer item;
	/**
	 * 失败跳转
	 */
	private Integer failoverIp;
	/**
	 * 状态
	 */
	private String status;
	/**
	 * 最后启动时间
	 */
	private Date lastBeginTime;
	/**
	 * 下次触发时间
	 */
	private Date nextFireTime;
	/**
	 * 最后完成时间
	 */
	private Date lastCompleteTime;
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
	
	public Long getWorkerId() {
		return workerId;
	}

	public void setWorkerId(Long workerId) {
		this.workerId = workerId;
	}
	
	public Integer getItem() {
		return item;
	}

	public void setItem(Integer item) {
		this.item = item;
	}
	
	public Integer getFailoverIp() {
		return failoverIp;
	}

	public void setFailoverIp(Integer failoverIp) {
		this.failoverIp = failoverIp;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public Date getLastBeginTime() {
		return lastBeginTime;
	}

	public void setLastBeginTime(Date lastBeginTime) {
		this.lastBeginTime = lastBeginTime;
	}
	
	public Date getNextFireTime() {
		return nextFireTime;
	}

	public void setNextFireTime(Date nextFireTime) {
		this.nextFireTime = nextFireTime;
	}
	
	public Date getLastCompleteTime() {
		return lastCompleteTime;
	}

	public void setLastCompleteTime(Date lastCompleteTime) {
		this.lastCompleteTime = lastCompleteTime;
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