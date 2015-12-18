package net.iharding.modules.meta.model;

import java.util.Date;
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

/**
 * 数据源Entity
 * @author Joe.zhang
 * @version 2015-12-01
 */
@Entity
@Table(name = "meta_project")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Project extends IdEntity {

	/**
	 * 项目编码
	 */
	@Column(name="project_code")
	private String projectCode;
	/**
	 * 项目名
	 */
	@Column(name="project_name")
	private String projectName;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 最后更新人
	 */
	@Column(name="updateby_id")
	private Long updatebyId;
	/**
	 * 建立人
	 */
	@Column(name="createby_id")
	private Long createbyId;
	/**
	 * 最后更新时间
	 */
	@Column(name="update_date")
	private Date updateDate;
	/**
	 * 建立时间
	 */
	@Column(name="create_date")
	private Date createDate;
	/**
	 * 项目模块
	 */
	@OneToMany(targetEntity=Module.class,fetch = FetchType.LAZY,cascade=CascadeType.ALL,mappedBy="project")
	@OrderBy("id ASC")
	private Set<Module> modules;
	/**
	 * 项目数据源
	 */
	@OneToMany(targetEntity=DataSource.class,fetch = FetchType.LAZY,cascade=CascadeType.ALL,mappedBy="project")
	@OrderBy("id ASC")
	private Set<DataSource> dataSources;
	
	public String getProjectCode() {
		return projectCode;
	}

	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}
	
	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Long getUpdatebyId() {
		return updatebyId;
	}

	public void setUpdatebyId(Long updatebyId) {
		this.updatebyId = updatebyId;
	}
	
	public Long getCreatebyId() {
		return createbyId;
	}

	public void setCreatebyId(Long createbyId) {
		this.createbyId = createbyId;
	}
	
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Set<Module> getModules() {
		return modules;
	}

	public void setModules(Set<Module> modules) {
		this.modules = modules;
	}

	public Set<DataSource> getDataSources() {
		return dataSources;
	}

	public void setDataSources(Set<DataSource> dataSources) {
		this.dataSources = dataSources;
	}
	
	
}