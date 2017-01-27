package com.github.eswrapper.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.guess.core.orm.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "es_slow_log")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class SlowLog extends IdEntity {
	
	@Column(name = "elapsed")
	private Integer elapsed;
	
	@Column(name = "sourceIp")
	private String sourceIp;
	
	@Column(name = "hostname")
	private String hostname;
	
	@Column(name = "port")
	private String port;
	
	@Column(name = "method")
	private String method;
	
	@Column(name = "url")
	private String url;
	
	@Column(name = "requestData")
	private String requestData;
	
	@Column(name = "response")
	private String response;
	
	@Column(name = "log_time")
	private Date log_time;
	
	@Column(name = "start_time")
	private Date start_time;
	
	@Column(name = "status")
	private Integer status;
	
	@Column(name = "cluster_name")
	private String clusterName;
	
	public String getClusterName() {
		return clusterName;
	}

	public void setClusterName(String clusterName) {
		this.clusterName = clusterName;
	}

	public Integer getElapsed() {
		return elapsed;
	}

	public void setElapsed(Integer elapsed) {
		this.elapsed = elapsed;
	}

	public String getSourceIp() {
		return sourceIp;
	}

	public void setSourceIp(String sourceIp) {
		this.sourceIp = sourceIp;
	}

	public String getHostname() {
		return hostname;
	}

	public void setHostname(String hostname) {
		this.hostname = hostname;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getRequestData() {
		return requestData;
	}

	public void setRequestData(String requestData) {
		this.requestData = requestData;
	}

	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	public Date getLog_time() {
		return log_time;
	}

	public void setLog_time(Date log_time) {
		this.log_time = log_time;
	}

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
}
