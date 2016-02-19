package net.iharding.modules.job.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.guess.sys.model.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 * 作业任务Entity
 * @author Joe.zhang
 * @version 2016-01-31
 */
@Entity
@Table(name = "job_task_define")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class JobTaskDefine extends IdEntity {

	/**
	 * 作业终端ID
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="machine_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Machine machine;
	
	@Column(name="machine_id",insertable = false, updatable = false)
	private Long machineId;
	/**
	 * 作业执行ID
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="worker_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private JobWorker worker;
	
	@Column(name="worker_id",insertable = false, updatable = false)
	private Long workerId;
	/**
	 * 注册中心ID
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="reg_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private RegCenter regCenter;
	
	@Column(name="reg_id",insertable = false, updatable = false)
	private Long regId;
	
	
	/**
	 * 状态
	 */
	private Integer status;
	/**
	 * 最后更新人
	 */
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = User.class,fetch = FetchType.LAZY)
	@JoinColumn(name="updateby_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private User updater;
	/**
	 * 建立人
	 */
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = User.class,fetch = FetchType.LAZY)
	@JoinColumn(name="createby_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private User creater;
	/**
	 * 建立时间
	 */
	@Column(name="create_date")
	private Date createDate;
	/**
	 * 更新时间
	 */
	@Column(name="update_date")
	private Date updateDate;
	/**
	 * 启用标记
	 */
	@Column(name="check_label")
	private Integer checkLabel;
	/**
	 * 备注
	 */
	private String remark;
	@Column(name="sharding")
	private String sharding;

	private Integer islead;
	
	private Integer isleadstop;
	
	@Column(name="process_failure_count")
	private Integer processFailureCount;
	
	@Column(name="process_success_count")
	private Integer processSuccessCount;
	
	
	
	public String getSharding() {
		return sharding;
	}

	public void setSharding(String sharding) {
		this.sharding = sharding;
	}

	public Integer getIslead() {
		return islead;
	}

	public void setIslead(Integer islead) {
		this.islead = islead;
	}

	public Integer getIsleadstop() {
		return isleadstop;
	}

	public void setIsleadstop(Integer isleadstop) {
		this.isleadstop = isleadstop;
	}

	public Integer getProcessFailureCount() {
		return processFailureCount;
	}

	public void setProcessFailureCount(Integer processFailureCount) {
		this.processFailureCount = processFailureCount;
	}

	public Integer getProcessSuccessCount() {
		return processSuccessCount;
	}

	public void setProcessSuccessCount(Integer processSuccessCount) {
		this.processSuccessCount = processSuccessCount;
	}
	
	public Long getMachineId() {
		return machineId;
	}

	public void setMachineId(Long machineId) {
		this.machineId = machineId;
	}

	public Long getWorkerId() {
		return workerId;
	}

	public void setWorkerId(Long workerId) {
		this.workerId = workerId;
	}

	public Long getRegId() {
		return regId;
	}

	public void setRegId(Long regId) {
		this.regId = regId;
	}

	public Machine getMachine() {
		return machine;
	}

	public void setMachine(Machine machine) {
		this.machine = machine;
	}

	public JobWorker getWorker() {
		return worker;
	}

	public void setWorker(JobWorker worker) {
		this.worker = worker;
	}

	public RegCenter getRegCenter() {
		return regCenter;
	}

	public void setRegCenter(RegCenter regCenter) {
		this.regCenter = regCenter;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	public User getUpdater() {
		return updater;
	}

	public void setUpdater(User updater) {
		this.updater = updater;
	}

	public User getCreater() {
		return creater;
	}

	public void setCreater(User creater) {
		this.creater = creater;
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