package net.iharding.modules.meta.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.guess.core.orm.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 模块对象Entity
 * @author Joe.zhang
 * @version 2015-12-01
 */
@Entity
@Table(name = "meta_module")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Module extends IdEntity {

	/**
	 * 项目ID
	 */
	private Long projectId;
	/**
	 * 模块编码
	 */
	private String moduleCode;
	/**
	 * 模块名
	 */
	private String moduleName;
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
	
	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}
	
	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}
	
	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
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