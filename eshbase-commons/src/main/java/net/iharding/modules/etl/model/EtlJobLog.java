package net.iharding.modules.etl.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 调度作业日志Entity
 * @author Joe.zhang
 * @version 2016-01-30
 */
@Entity
@Table(name = "etl_etlJobLog")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class EtlJobLog extends IdEntity {

	/**
	 * 任务ID
	 */
	private Long taskId;
	/**
	 * 记录时间
	 */
	private Date logTime;
	/**
	 * 日志内容
	 */
	private String logContent;
	/**
	 * 状态
	 */
	private Integer logType;
	/**
	 * 建立者
	 */
	private Long createbyId;
	
	public Long getTaskId() {
		return taskId;
	}

	public void setTaskId(Long taskId) {
		this.taskId = taskId;
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
	
	public Long getCreatebyId() {
		return createbyId;
	}

	public void setCreatebyId(Long createbyId) {
		this.createbyId = createbyId;
	}
	
	
}