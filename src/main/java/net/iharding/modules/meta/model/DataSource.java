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
@Table(name = "meta_dataSource")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class DataSource extends IdEntity {

	/**
	 * 项目ID
	 */
	private Long projectId;
	/**
	 * jdbc驱动
	 */
	private String driverClassName;
	/**
	 * jdbc URL
	 */
	private String jdbcUrl;
	/**
	 * jdbc用户
	 */
	private String jdbcUser;
	/**
	 * jdbc用户
	 */
	private String jdbcPassword;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 类别
	 */
	private Integer dbType;
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
	
	public String getDriverClassName() {
		return driverClassName;
	}

	public void setDriverClassName(String driverClassName) {
		this.driverClassName = driverClassName;
	}
	
	public String getJdbcUrl() {
		return jdbcUrl;
	}

	public void setJdbcUrl(String jdbcUrl) {
		this.jdbcUrl = jdbcUrl;
	}
	
	public String getJdbcUser() {
		return jdbcUser;
	}

	public void setJdbcUser(String jdbcUser) {
		this.jdbcUser = jdbcUser;
	}
	
	public String getJdbcPassword() {
		return jdbcPassword;
	}

	public void setJdbcPassword(String jdbcPassword) {
		this.jdbcPassword = jdbcPassword;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Integer getDbType() {
		return dbType;
	}

	public void setDbType(Integer dbType) {
		this.dbType = dbType;
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