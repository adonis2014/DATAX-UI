package com.github.eswrapper.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.guess.core.orm.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "es_black_request")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class BlackRequest extends IdEntity{
	
	
	@Column(name = "method")
	private String method;
	
	@Column(name = "url")
	private String url;
	
	@Column(name = "requestData")
	private String requestData;
	
	@Column(name = "isblack")
	private Integer isblack;
	
	@Column(name = "remark")
	private String remark;
	
	
	@Column(name = "cluster_name")
	private String clusterName;
	
	public String getClusterName() {
		return clusterName;
	}

	public void setClusterName(String clusterName) {
		this.clusterName = clusterName;
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

	public Integer getIsblack() {
		return isblack;
	}

	public void setIsblack(Integer isblack) {
		this.isblack = isblack;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
