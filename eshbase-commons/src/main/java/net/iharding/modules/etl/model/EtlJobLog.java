package net.iharding.modules.etl.model;

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
 * 调度作业日志Entity
 * @author Joe.zhang
 * @version 2016-01-30
 */
@Entity
@Table(name = "etl_job_log")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class EtlJobLog extends IdEntity {

	/**
	 * 任务ID
	 */
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = EtlTask.class,fetch = FetchType.LAZY)
	@JoinColumn(name="task_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private EtlTask task;
	/**
	 * 记录时间
	 */
	@Column(name="log_time")
	private Date logTime;
	/**
	 * 日志内容
	 */
	@Column(name="log_content")
	private String logContent;
	/**
	 * 状态
	 */
	@Column(name="log_type")
	private Integer logType;
	/**
	 * 建立人
	 */
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = User.class,fetch = FetchType.LAZY)
	@JoinColumn(name="createby_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private User creater;
	
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = EtlJobExecution.class,fetch = FetchType.LAZY)
	@JoinColumn(name="execution_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private EtlJobExecution executionInfo;
	
	@Column(name="execution_id",insertable=false,updatable=false)
	private Long exectionId;
	
	

	public Long getExectionId() {
		return exectionId;
	}

	public void setExectionId(Long exectionId) {
		this.exectionId = exectionId;
	}

	public EtlJobExecution getExecutionInfo() {
		return executionInfo;
	}

	public void setExecutionInfo(EtlJobExecution executionInfo) {
		this.executionInfo = executionInfo;
	}

	public EtlTask getTask() {
		return task;
	}

	public void setTask(EtlTask task) {
		this.task = task;
	}

	public Date getLogTime() {
		return logTime;
	}

	public void setLogTime(Date logTime) {
		this.logTime = logTime;
	}
	
	public String getLogContent() {
		return logContent;
	}

	public void setLogContent(String logContent) {
		this.logContent = logContent;
	}
	
	public Integer getLogType() {
		return logType;
	}

	public void setLogType(Integer logType) {
		this.logType = logType;
	}

	public User getCreater() {
		return creater;
	}

	public void setCreater(User creater) {
		this.creater = creater;
	}
	
	
}
