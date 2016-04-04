package net.iharding.modules.etl.model;

import javax.persistence.CascadeType;
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
 * 任务参数Entity
 * @author Joe.zhang
 * @version 2016-01-30
 */
@Entity
@Table(name = "etl_task_param")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class EtlTaskParam extends IdEntity {

	/**
	 * 任务ID
	 */
	@Column(name="task_id")
	private Long taskId;
	
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = EtlTask.class,fetch = FetchType.LAZY)
	@JoinColumn(name="task_id",insertable = false, updatable = false)
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private EtlTask task;
	/**
	 * 插件参数ID
	 */
	@Column(name="plugin_param_id")
	private Long pluginParamId;
	/**
	 * 参数Key
	 */
	@Column(name="param_key")
	private String paramKey;
	/**
	 * 参数值
	 */
	@Column(name="param_value")
	private String paramValue;
	/**
	 * 备注
	 */
	private String remark;
	
	public EtlTask getTask() {
		return task;
	}

	public void setTask(EtlTask task) {
		this.task = task;
	}

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
