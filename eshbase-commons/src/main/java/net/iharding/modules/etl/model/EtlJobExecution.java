package net.iharding.modules.etl.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;
import net.iharding.modules.job.model.JobExecutionInfo;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
/**
 * etl执行记录
 * @author admin
 *
 */
@Entity
@Table(name = "etl_job_execution")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class EtlJobExecution extends IdEntity {
	
	@Column(name="exe_time")
	private Date exeTime;
	
	@Column(name="job_id",insertable=false,updatable=false)
	private long jobId;
	
	@Column(name="job_exe_id",insertable=false,updatable=false)
	private long jobExeId;
	
	@Column(name="remark")
	private String remark;
	
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = EtlJob.class,fetch = FetchType.LAZY)
	@JoinColumn(name="job_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private EtlJob etlJob;
	
	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = JobExecutionInfo.class,fetch = FetchType.LAZY)
	@JoinColumn(name="job_exe_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private JobExecutionInfo executionInfo;

	public Date getExeTime() {
		return exeTime;
	}

	public void setExeTime(Date exeTime) {
		this.exeTime = exeTime;
	}

	public long getJobId() {
		return jobId;
	}

	public void setJobId(long jobId) {
		this.jobId = jobId;
	}

	public long getJobExeId() {
		return jobExeId;
	}

	public void setJobExeId(long jobExeId) {
		this.jobExeId = jobExeId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public EtlJob getEtlJob() {
		return etlJob;
	}

	public void setEtlJob(EtlJob etlJob) {
		this.etlJob = etlJob;
	}

	public JobExecutionInfo getExecutionInfo() {
		return executionInfo;
	}

	public void setExecutionInfo(JobExecutionInfo executionInfo) {
		this.executionInfo = executionInfo;
	}
	
	
}
