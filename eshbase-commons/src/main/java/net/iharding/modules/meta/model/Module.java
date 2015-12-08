package net.iharding.modules.meta.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

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
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="project_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Project project;
	
	/**
	 * 数据源ID
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="datasource_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private DataSource datasource;
	/**
	 * 模块编码
	 */
	@Column(name="module_code")
	private String moduleCode;
	/**
	 * 模块名
	 */
	@Column(name="module_name")
	private String moduleName;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 包名
	 */
	@Column(name="package_name")
	private String packageName;
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
	
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE }, targetEntity = DBTable.class)
	@JoinTable(name = "meta_module_table", joinColumns = { @JoinColumn(name = "module_id") }, inverseJoinColumns = { @JoinColumn(name = "table_id") })
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Set<DBTable> tables = new HashSet<DBTable>(0);
	
	public String getPackageName() {
		return packageName;
	}

	public DataSource getDatasource() {
		return datasource;
	}

	public void setDatasource(DataSource datasource) {
		this.datasource = datasource;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Set<DBTable> getTables() {
		return tables;
	}

	public void setTables(Set<DBTable> tables) {
		this.tables = tables;
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