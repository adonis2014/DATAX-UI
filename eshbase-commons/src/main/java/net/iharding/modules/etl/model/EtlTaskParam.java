package net.iharding.modules.etl.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 任务参数Entity
 * @author Joe.zhang
 * @version 2016-01-30
 */
@Entity
@Table(name = "etl_etlTaskParam")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class EtlTaskParam extends IdEntity {

	/**
	 * 任务ID
	 */
	private Long taskId;
	/**
	 * 插件参数ID
	 */
	private Long pluginParamId;
	/**
	 * 参数Key
	 */
	private String paramKey;
	/**
	 * 参数值
	 */
	private String paramValue;
	/**
	 * 备注
	 */
	private String remark;
	
	public Long getTaskId() {
		return taskId;
	}

	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}
	
	public Long getPluginParamId() {
		return pluginParamId;
	}

	public void setPluginParamId(Long pluginParamId) {
		this.pluginParamId = pluginParamId;
	}
	
	public String getParamKey() {
		return paramKey;
	}

	public void setParamKey(String paramKey) {
		this.paramKey = paramKey;
	}
	
	public String getParamValue() {
		return paramValue;
	}

	public void setParamValue(String paramValue) {
		this.paramValue = paramValue;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
