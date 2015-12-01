package net.iharding.modules.meta.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.guess.core.orm.IdEntity;
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
	private String projectCode;
	/**
	 * 项目名
	 */
	private String projectName;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 最后更新人
	 */
	private Long updatebyId;
	/**
	 * 建立人
	 */
	private Long createbyId;
	/**
	 * 最后更新时间
	 */
	private Date updateDate;
	/**
	 * 建立时间
	 */
	private Date createDate;
	
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
	
	
}