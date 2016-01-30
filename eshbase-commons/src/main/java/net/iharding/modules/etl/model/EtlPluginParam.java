package net.iharding.modules.etl.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 插件参数Entity
 * @author Joe.zhang
 * @version 2016-01-30
 */
@Entity
@Table(name = "etl_etlPluginParam")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class EtlPluginParam extends IdEntity {

	/**
	 * 插件ID
	 */
	private Long pluginId;
	/**
	 * 任务参数ID
	 */
	private Long taskParamId;
	/**
	 * 插件名
	 */
	private String name;
	/**
	 * 是否必须
	 */
	private Integer mandatory;
	/**
	 * 默认值
	 */
	private String defaultValue;
	/**
	 * 是否列
	 */
	private Integer isColumn;
	/**
	 * 备注
	 */
	private String description;
	
	public Long getPluginId() {
		return pluginId;
	}

	public void setPluginId(Long pluginId) {
		this.pluginId = pluginId;
	}
	
	public Long getTaskParamId() {
		return taskParamId;
	}

	public void setTaskParamId(Long taskParamId) {
		this.taskParamId = taskParamId;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getMandatory() {
		return mandatory;
	}

	public void setMandatory(Integer mandatory) {
		this.mandatory = mandatory;
	}
	
	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}
	
	public Integer getIsColumn() {
		return isColumn;
	}

	public void setIsColumn(Integer isColumn) {
		this.isColumn = isColumn;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
}