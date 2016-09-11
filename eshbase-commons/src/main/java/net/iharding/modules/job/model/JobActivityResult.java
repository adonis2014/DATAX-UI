package net.iharding.modules.job.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 流程输出配置Entity
 * @author Joe.zhang
 * @version 2016-09-10
 */
@Entity
@Table(name = "job_jobActivityResult")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class JobActivityResult extends IdEntity {

	/**
	 * 节点ID
	 */
	private Long activityId;
	/**
	 * 结果值
	 */
	private String resultValue;
	/**
	 * 下一处理节点ID
	 */
	private String processTo;
	
	public Long getActivityId() {
		return activityId;
	}

	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}
	
	public String getResultValue() {
		return resultValue;
	}

	public void setResultValue(String resultValue) {
		this.resultValue = resultValue;
	}
	
	public String getProcessTo() {
		return processTo;
	}

	public void setProcessTo(String processTo) {
		this.processTo = processTo;
	}
	
	
}