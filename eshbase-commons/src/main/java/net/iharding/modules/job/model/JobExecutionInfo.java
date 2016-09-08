package net.iharding.modules.job.model;

import java.util.Date;

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
 * 作业任务日志Entity
 * @author Joe.zhang
 * @version 2016-02-11
 */
@Entity
@Table(name = "job_execution_info")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class JobExecutionInfo extends IdEntity {

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
	 * 执行结果
	 */
	@Column(name="exe_result")
	private String exeResult;
	/**
	 * 日志
	 */
	@Column(name="log")
	private String log;
	
	/**
	 * 分片项
	 */
	private Integer item;
	/**
	 * 失败跳转
	 */
	@Column(name="failover_ip")
	private Integer failoverIp;
	/**
	 * 状态
	 */
	private String status;
	/**
	 * 最后启动时间
	 */
	@Column(name="last_begin_time")
	private Date lastBeginTime;
	/**
	 * 下次触发时间
	 */
	@Column(name="next_fire_time")
	private Date nextFireTime;
	/**
	 * 最后完成时间
	 */
	@Column(name="last_complete_time")
	private Date lastCompleteTime;
	
	
	
	
	
	public String getExeResult() {
		return exeResult;
	}

	public void setExeResult(String exeResult) {
		this.exeResult = exeResult;
	}

	public String getLog() {
		return log;
	}

	public void setLog(String log) {
		this.log = log;
	}

	public Machine getMachine() {
		return machine;
	}

	public void setMachine(Machine machine) {
		this.machine = machine;
	}

	public Long getMachineId() {
		return machineId;
	}

	public void setMachineId(Long machineId) {
		this.machineId = machineId;
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

	public Long getRegId() {
		return regId;
	}

	public void setRegId(Long regId) {
		this.regId = regId;
	}

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
	
	
	
	
}