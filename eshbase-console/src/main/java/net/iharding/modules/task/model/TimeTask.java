package net.iharding.modules.task.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 调度任务Entity
 * @author zhangxuhui
 * @version 2015-10-26
 */
@Entity
@Table(name = "sys_timeTask")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class TimeTask extends IdEntity {

	/**
	 * 任务ID
	 */
	private String taskId;
	/**
	 * 任务描述
	 */
	private String taskDescribe;
	/**
	 * 触发脚本
	 */
	private String cronExpression;
	/**
	 * 是否生效
	 */
	private String isEffect;
	/**
	 * 是否运行
	 */
	private String isStart;
	/**
	 * 建立时间
	 */
	private Date createDate;
	/**
	 * 建立人
	 */
	private String createBy;
	/**
	 * 建立人
	 */
	private String createName;
	/**
	 * 建立时间
	 */
	private Date updateDate;
	/**
	 * 更新人
	 */
	private String updateBy;
	/**
	 * 更新人姓名
	 */
	private String updateName;
	
	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	
	public String getTaskDescribe() {
		return taskDescribe;
	}

	public void setTaskDescribe(String taskDescribe) {
		this.taskDescribe = taskDescribe;
	}
	
	public String getCronExpression() {
		return cronExpression;
	}

	public void setCronExpression(String cronExpression) {
		this.cronExpression = cronExpression;
	}
	
	public String getIsEffect() {
		return isEffect;
	}

	public void setIsEffect(String isEffect) {
		this.isEffect = isEffect;
	}
	
	public String getIsStart() {
		return isStart;
	}

	public void setIsStart(String isStart) {
		this.isStart = isStart;
	}
	
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	
	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}
	
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	
	public String getUpdateName() {
		return updateName;
	}

	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}
	
	
}