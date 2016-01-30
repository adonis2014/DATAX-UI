package net.iharding.modules.etl.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * ETL插件Entity
 * @author Joe.zhang
 * @version 2016-01-29
 */
@Entity
@Table(name = "etl_etlPlugin")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class EtlPlugin extends IdEntity {

	/**
	 * 插件名
	 */
	private String pluginName;
	/**
	 * 插件类别
	 */
	private Integer pluginType;
	/**
	 * 类名
	 */
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
	private String jarName;
	/**
	 * 备注
	 */
	private Integer remark;
	/**
	 * 线程数
	 */
	private Integer maxThreadNum;
	/**
	 * 启用标记
	 */
	private Integer checkLabel;
	
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
	
	public Integer getRemark() {
		return remark;
	}

	public void setRemark(Integer remark) {
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