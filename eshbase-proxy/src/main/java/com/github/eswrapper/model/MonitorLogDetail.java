package com.github.eswrapper.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.guess.core.orm.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 监控记录明细Entity
 * @author Joe.zhang
 * @version 2016-08-05
 */
@Entity
@Table(name = "es_monitor_log_detail")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class MonitorLogDetail extends IdEntity {

	/**
	 * 集群名
	 */
	@Column(name = "cluster_name")
	private String clusterName;
	/**
	 * 接点
	 */
	@Column(name = "node")
	private String node;
	/**
	 * 成功次数
	 */
	@Column(name = "success_count")
	private Long successCount;
	/**
	 * 成功TPS
	 */
	@Column(name = "success_tps")
	private float successTps;
	/**
	 * 失败次数
	 */
	@Column(name = "failure_count")
	private Long failureCount;
	/**
	 * 失败Tps
	 */
	@Column(name = "failure_tps")
	private float failureTps;
	/**
	 * 线程池最小值
	 */
	@Column(name = "concurrent_min")
	private Long concurrentMin;
	/**
	 * 线程池平均值
	 */
	@Column(name = "concurrent_ave")
	private float concurrentAve;
	/**
	 * 线程池最大值
	 */
	@Column(name = "concurrent_max")
	private Long concurrentMax;
	/**
	 * logId
	 */
	@Column(name = "log_id",insertable=false,updatable=false)
	private Long logId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "log_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@JsonIgnoreProperties(value = { "creater","updater","logDetails"})
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private MonitorLog log;
	
	@Column(name = "elapsed_min")
	private Long elapsedMin;
	/**
	 * 耗时平均值
	 */
	@Column(name = "elapsed_ave")
	private float elapsedAve;
	/**
	 * 耗时最大值
	 */
	@Column(name = "elapsed_max")
	private Long elapsedMax;
	
	@Column(name = "writequeue_min")
	private Long writequeueMin;
	/**
	 * 写入队列平均值
	 */
	@Column(name = "writequeue_ave")
	private float writequeueAve;
	/**
	 * 写入队列最大值
	 */
	@Column(name = "writequeue_max")
	private Long writequeueMax;
	
	@Column(name = "writepool_min")
	private Long writepoolMin;
	/**
	 * 写入队列平均值
	 */
	@Column(name = "writepool_ave")
	private float writepoolAve;
	/**
	 * 写入队列最大值
	 */
	@Column(name = "writepool_max")
	private Long writepoolMax;
	
	@Column(name = "searchqueue_min")
	private Long searchqueueMin;
	/**
	 * 写入队列平均值
	 */
	@Column(name = "searchqueue_ave")
	private float searchqueueAve;
	/**
	 * 写入队列最大值
	 */
	@Column(name = "searchqueue_max")
	private Long searchqueueMax;
	
	@Column(name = "searchpool_min")
	private Long searchpoolMin;
	/**
	 * 写入队列平均值
	 */
	@Column(name = "searchpool_ave")
	private float searchpoolAve;
	/**
	 * 写入队列最大值
	 */
	@Column(name = "searchpool_max")
	private Long searchpoolMax;
	
	public MonitorLog getLog() {
		return log;
	}

	public void setLog(MonitorLog log) {
		this.log = log;
	}

	public String getClusterName() {
		return clusterName;
	}

	public void setClusterName(String clusterName) {
		this.clusterName = clusterName;
	}
	
	public Long getElapsedMin() {
		return elapsedMin;
	}

	public void setElapsedMin(Long elapsedMin) {
		this.elapsedMin = elapsedMin;
	}

	public float getElapsedAve() {
		return elapsedAve;
	}

	public void setElapsedAve(float elapsedAve) {
		this.elapsedAve = elapsedAve;
	}

	public Long getElapsedMax() {
		return elapsedMax;
	}

	public void setElapsedMax(Long elapsedMax) {
		this.elapsedMax = elapsedMax;
	}

	public Long getWritequeueMin() {
		return writequeueMin;
	}

	public void setWritequeueMin(Long writequeueMin) {
		this.writequeueMin = writequeueMin;
	}

	public float getWritequeueAve() {
		return writequeueAve;
	}

	public void setWritequeueAve(float writequeueAve) {
		this.writequeueAve = writequeueAve;
	}

	public Long getWritequeueMax() {
		return writequeueMax;
	}

	public void setWritequeueMax(Long writequeueMax) {
		this.writequeueMax = writequeueMax;
	}

	public Long getWritepoolMin() {
		return writepoolMin;
	}

	public void setWritepoolMin(Long writepoolMin) {
		this.writepoolMin = writepoolMin;
	}

	public float getWritepoolAve() {
		return writepoolAve;
	}

	public void setWritepoolAve(float writepoolAve) {
		this.writepoolAve = writepoolAve;
	}

	public Long getWritepoolMax() {
		return writepoolMax;
	}

	public void setWritepoolMax(Long writepoolMax) {
		this.writepoolMax = writepoolMax;
	}

	public Long getSearchqueueMin() {
		return searchqueueMin;
	}

	public void setSearchqueueMin(Long searchqueueMin) {
		this.searchqueueMin = searchqueueMin;
	}

	public float getSearchqueueAve() {
		return searchqueueAve;
	}

	public void setSearchqueueAve(float searchqueueAve) {
		this.searchqueueAve = searchqueueAve;
	}

	public Long getSearchqueueMax() {
		return searchqueueMax;
	}

	public void setSearchqueueMax(Long searchqueueMax) {
		this.searchqueueMax = searchqueueMax;
	}

	public Long getSearchpoolMin() {
		return searchpoolMin;
	}

	public void setSearchpoolMin(Long searchpoolMin) {
		this.searchpoolMin = searchpoolMin;
	}

	public float getSearchpoolAve() {
		return searchpoolAve;
	}

	public void setSearchpoolAve(float searchpoolAve) {
		this.searchpoolAve = searchpoolAve;
	}

	public Long getSearchpoolMax() {
		return searchpoolMax;
	}

	public void setSearchpoolMax(Long searchpoolMax) {
		this.searchpoolMax = searchpoolMax;
	}

	public String getNode() {
		return node;
	}

	public void setNode(String node) {
		this.node = node;
	}
	
	public Long getSuccessCount() {
		return successCount;
	}

	public void setSuccessCount(Long successCount) {
		this.successCount = successCount;
	}
	
	public float getSuccessTps() {
		return successTps;
	}

	public void setSuccessTps(float successTps) {
		this.successTps = successTps;
	}
	
	public Long getFailureCount() {
		return failureCount;
	}

	public void setFailureCount(Long failureCount) {
		this.failureCount = failureCount;
	}
	
	public float getFailureTps() {
		return failureTps;
	}

	public void setFailureTps(float failureTps) {
		this.failureTps = failureTps;
	}
	
	public Long getConcurrentMin() {
		return concurrentMin;
	}

	public void setConcurrentMin(Long concurrentMin) {
		this.concurrentMin = concurrentMin;
	}
	
	public float getConcurrentAve() {
		return concurrentAve;
	}

	public void setConcurrentAve(float concurrentAve) {
		this.concurrentAve = concurrentAve;
	}
	
	public Long getConcurrentMax() {
		return concurrentMax;
	}

	public void setConcurrentMax(Long concurrentMax) {
		this.concurrentMax = concurrentMax;
	}
	
	public Long getLogId() {
		return logId;
	}

	public void setLogId(Long logId) {
		this.logId = logId;
	}
	
	
}