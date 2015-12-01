package net.iharding.modules.meta.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Column;

import org.guess.core.orm.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 数据源Entity
 * @author Joe.zhang
 * @version 2015-12-01
 */
@Entity
@Table(name = "meta_datasource")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class DataSource extends IdEntity {

	/**
	 * 项目ID
	 */
	@Column(name="project_id")
	private Long projectId;
	/**
	 * jdbc驱动
	 */
	@Column(name="driver_class_name")
	private String driverClassName;
	/**
	 * jdbc URL
	 */
	@Column(name="jdbc_url")
	private String jdbcUrl;
	/**
	 * jdbc用户
	 */
	@Column(name="jdbc_user")
	private String jdbcUser;
	/**
	 * jdbc用户
	 */
	@Column(name="jdbc_password")
	private String jdbcPassword;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 类别
	 */
	@Column(name="db_type")
	private Integer dbType;
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
	
	@Column(name="project_id")
	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}
	
	@Column(name="driver_class_name")
	public String getDriverClassName() {
		return driverClassName;
	}

	public void setDriverClassName(String driverClassName) {
		this.driverClassName = driverClassName;
	}
	
	@Column(name="jdbc_url")
	public String getJdbcUrl() {
		return jdbcUrl;
	}

	public void setJdbcUrl(String jdbcUrl) {
		this.jdbcUrl = jdbcUrl;
	}
	
	@Column(name="jdbc_user")
	public String getJdbcUser() {
		return jdbcUser;
	}

	public void setJdbcUser(String jdbcUser) {
		this.jdbcUser = jdbcUser;
	}
	
	@Column(name="jdbc_password")
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
	
	@Column(name="db_type")
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
	
	@Column(name="createby_id")
	public Long getCreatebyId() {
		return createbyId;
	}

	public void setCreatebyId(Long createbyId) {
		this.createbyId = createbyId;
	}
	
	@Column(name="update_date")
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	@Column(name="create_date")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}