package net.iharding.modules.etl.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * ETL插件Entity
 * @author Joe.zhang
 * @version 2016-01-29
 */
@Entity
@Table(name = "etl_plugin")
@JsonIgnoreProperties(value = { "tasks"})
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class EtlPlugin extends IdEntity {

	/**
	 * 插件名
	 */
	@Column(name="plugin_name")
	private String pluginName;
	/**
	 * 插件类别
	 */
	@Column(name="plugin_type")
	private Integer pluginType;
	/**
	 * 类名
	 */
	@Column(name="class_name")
	private String className;
	/**
	 * 版本
	 */
	private String version;
	/**
	 * 数据源目标
	 */
	private String target;
	/**
	 * jar包名
	 */
	@Column(name="jar_name")
	private String jarName;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 线程数
	 */
	@Column(name="maxthreadnum")
	private Integer maxThreadNum;
	/**
	 * 启用标记
	 */
	@Column(name="check_label")
	private Integer checkLabel;
	
	@OneToMany(targetEntity=EtlTask.class,fetch = FetchType.LAZY,cascade=CascadeType.ALL,mappedBy="plugin")
	@OrderBy("id ASC")
	private Set<EtlTask> tasks;
	
	@OneToMany(targetEntity=EtlPluginParam.class,fetch = FetchType.LAZY,cascade=CascadeType.ALL,mappedBy="plugin")
	@OrderBy("id ASC")
	private Set<EtlPluginParam> pluginParams;
	
	
	
	public Set<EtlTask> getTasks() {
		return tasks;
	}

	public void setTasks(Set<EtlTask> tasks) {
		this.tasks = tasks;
	}

	public Set<EtlPluginParam> getPluginParams() {
		return pluginParams;
	}

	public void setPluginParams(Set<EtlPluginParam> pluginParams) {
		this.pluginParams = pluginParams;
	}

	public String getPluginName() {
		return pluginName;
	}

	public void setPluginName(String pluginName) {
		this.pluginName = pluginName;
	}
	
	public Integer getPluginType() {
		return pluginType;
	}

	public void setPluginType(Integer pluginType) {
		this.pluginType = pluginType;
	}
	
	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}
	
	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}
	
	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}
	
	public String getJarName() {
		return jarName;
	}

	public void setJarName(String jarName) {
		this.jarName = jarName;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Integer getMaxThreadNum() {
		return maxThreadNum;
	}

	public void setMaxThreadNum(Integer maxThreadNum) {
		this.maxThreadNum = maxThreadNum;
	}
	
	public Integer getCheckLabel() {
		return checkLabel;
	}

	public void setCheckLabel(Integer checkLabel) {
		this.checkLabel = checkLabel;
	}
	
	
}
