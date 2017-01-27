package com.github.eswrapper.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.guess.core.orm.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 资源监控记录Entity
 * @author Joe.zhang
 * @version 2016-08-05
 */
@Entity
@Table(name = "es_monitor_log")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class MonitorLog extends IdEntity {

	/**
	 * 记录时间
	 */
	@Column(name = "log_time")
	private Date logTime;
	/**
	 * 状态
	 */
	@Column(name = "check_label")
	private Integer checkLabel;
	
	@OneToMany(targetEntity=MonitorLogDetail.class,fetch = FetchType.LAZY,cascade=CascadeType.ALL,mappedBy="log")
	@OrderBy("id ASC")
	private Set<MonitorLogDetail> logDetails;
	
	
	
	public Set<MonitorLogDetail> getLogDetails() {
		return logDetails;
	}

	public void setLogDetails(Set<MonitorLogDetail> logDetails) {
		this.logDetails = logDetails;
	}

	public Date getLogTime() {
		return logTime;
	}

	public void setLogTime(Date logTime) {
		this.logTime = logTime;
	}
	
	public Integer getCheckLabel() {
		return checkLabel;
	}

	public void setCheckLabel(Integer checkLabel) {
		this.checkLabel = checkLabel;
	}
	
	
}