package net.iharding.modules.job.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.guess.sys.model.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 * 作业任务Entity
 * @author Joe.zhang
 * @version 2016-01-31
 */
@Entity
@Table(name = "job_task_define")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class JobTaskDefine extends IdEntity {

	/**
	 * 作业终端ID
	 */
	@Column(name="machine_id")
	private Long machineId;
	/**
	 * 作业执行ID
	 */
	@Column(name="worker_id")
	private Long workerId;
	/**
	 * 注册中心ID
	 */
	@Column(name="reg_id")
	private Long regId;
	/**
	 * 状态
	 */
	private Integer status;
	/**
	 * 最后更新人
	 */
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = User.class,fetch = FetchType.LAZY)
	@JoinColumn(name="updateby_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private User updater;
	/**
	 * 建立人
	 */
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = User.class,fetch = FetchType.LAZY)
	@JoinColumn(name="createby_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private User creater;
	/**
	 * 建立时间
	 */
	@Column(name="create_date")
	private Date createDate;
	/**
	 * 更新时间
	 */
	@Column(name="update_date")
	private Date updateDate;
	/**
	 * 启用标记
	 */
	@Column(name="check_label")
	private Integer checkLabel;
	/**
	 * 备注
	 */
	private String remark;
	
	public Long getMachineId() {
		return machineId;
	}

	public void setMachineId(Long machineId) {
		this.machineId = machineId;
	}
	
	public Long getWorkerId() {
		return workerId;
	}

	public void setWorkerId(Long workerId) {
		this.workerId = workerId;
	}
	
	public Long getRegId() {
		return regId;
	}

	public void setRegId(Long regId) {
		this.regId = regId;
	}
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	public User getUpdater() {
		return updater;
	}

	public void setUpdater(User updater) {
		this.updater = updater;
	}

	public User getCreater() {
		return creater;
	}

	public void setCreater(User creater) {
		this.creater = creater;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	public Integer getCheckLabel() {
		return checkLabel;
	}

	public void setCheckLabel(Integer checkLabel) {
		this.checkLabel = checkLabel;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}