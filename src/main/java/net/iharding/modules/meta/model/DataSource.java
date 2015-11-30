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
 * @version 2015-11-29
 */
@Entity
@Table(name = "meta_dataSource")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class DataSource extends IdEntity {

	/**
	 * 数据源ID
	 */
	private Integer datasourceId;
	/**
	 * 项目编码
	 */
	private String projectCode;
	/**
	 * jdbc驱动class
	 */
	private String driverClassName;
	/**
	 * jdbc url
	 */
	private String jdbcUrl;
	/**
	 * jdbc User
	 */
	private String jdbcUser;
	/**
	 * jdbc password
	 */
	private String jdbcPassword;
	/**
	 * 数据库类型
	 */
	private Integer dbType;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 建立日期
	 */
	private Date createDate;
	/**
	 * 更新日期
	 */
	private Date updateDate;
	/**
	 * 建立者
	 */
	private Long createId;
	/**
	 * 更新人
	 */
	private Long updateId;
	
	public Integer getDatasourceId() {
		return datasourceId;
	}

	public void setDatasourceId(Integer datasourceId) {
		this.datasourceId = datasourceId;
	}
	
	public String getProjectCode() {
		return projectCode;
	}

	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
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
	
	public Integer getDbType() {
		return dbType;
	}

	public void setDbType(Integer dbType) {
		this.dbType = dbType;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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
	
	public Long getCreateId() {
		return createId;
	}

	public void setCreateId(Long createId) {
		this.createId = createId;
	}
	
	public Long getUpdateId() {
		return updateId;
	}

	public void setUpdateId(Long updateId) {
		this.updateId = updateId;
	}
	
	
}