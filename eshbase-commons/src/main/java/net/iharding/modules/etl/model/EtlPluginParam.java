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
 * 插件参数Entity
 * @author Joe.zhang
 * @version 2016-01-30
 */
@Entity
@Table(name = "etl_plugin_param")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class EtlPluginParam extends IdEntity {

	/**
	 * 插件ID
	 */
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = EtlPlugin.class,fetch = FetchType.LAZY)
	@JoinColumn(name="plugin_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private EtlPlugin plugin;
	
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
	@Column(name="default")
	private String defaultValue;
	/**
	 * 是否列
	 */
	@Column(name="is_column")
	private Integer isColumn;
	/**
	 * 备注
	 */
	private String description;
	
	public EtlPlugin getPlugin() {
		return plugin;
	}

	public void setPlugin(EtlPlugin plugin) {
		this.plugin = plugin;
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
