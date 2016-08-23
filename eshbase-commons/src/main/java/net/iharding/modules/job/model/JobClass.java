package net.iharding.modules.job.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.guess.sys.model.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 作业类信息Entity
 * @author Joe.zhang
 * @version 2016-01-31
 */
@Entity
@Table(name = "job_jobclass")
@JsonIgnoreProperties(value = { "workers"})
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class JobClass extends IdEntity {

	/**
	 * 作业名
	 */
	@Column(name="name")
	private String name;
	/**
	 * 作业类型
	 */
	@Column(name="job_type")
	private Integer jobType;
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
	 * 作业产品ID
	 */
	@Column(name="method_name")
	private String methodName;
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
	
	@OneToMany(targetEntity=JobWorker.class,fetch = FetchType.LAZY,cascade=CascadeType.ALL,mappedBy="jobclass")
	@OrderBy("id ASC")
	private Set<JobWorker> workers;
	
	public Set<JobWorker> getWorkers() {
		return workers;
	}

	public void setWorkers(Set<JobWorker> workers) {
		this.workers = workers;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getJobType() {
		return jobType;
	}

	public void setJobType(Integer jobType) {
		this.jobType = jobType;
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
	
	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
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