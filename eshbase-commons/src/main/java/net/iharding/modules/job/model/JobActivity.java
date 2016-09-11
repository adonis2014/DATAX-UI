package net.iharding.modules.job.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 流程接点Entity
 * @author Joe.zhang
 * @version 2016-09-10
 */
@Entity
@Table(name = "job_jobActivity")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class JobActivity extends IdEntity {

	/**
	 * 节点类ID
	 */
	private Long actClassId;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 参数
	 */
	private String params;
	/**
	 * 图标
	 */
	private String icon;
	/**
	 * 风格
	 */
	private String style;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 节点类ID
	 */
	private Long flowId;
	/**
	 * 节点类别
	 */
	private Long activityType;
	
	public Long getActClassId() {
		return actClassId;
	}

	public void setActClassId(Long actClassId) {
		this.actClassId = actClassId;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}
	
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Long getFlowId() {
		return flowId;
	}

	public void setFlowId(Long flowId) {
		this.flowId = flowId;
	}
	
	public Long getActivityType() {
		return activityType;
	}

	public void setActivityType(Long activityType) {
		this.activityType = activityType;
	}
	
	
}