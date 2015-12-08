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
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 * 表对象Entity
 * 
 * @author Joe.zhang
 * @version 2015-12-01
 */
@Entity
@Table(name = "meta_table")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class DBTable extends IdEntity {

	/**
	 * 数据源ID
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "datasource_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private DataSource datasource;
	/**
	 * 类名
	 */
	@Column(name = "class_name")
	private String className;
	/**
	 * 表名
	 */
	@Column(name = "table_name")
	private String tableName;
	
	/**
	 * 逻辑名
	 */
	@Column(name = "table_pname")
	private String tablePname;
	/**
	 * 表类别
	 */
	@Column(name = "table_type")
	private Integer tableType;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 最后更新人
	 */
	@Column(name = "updateby_id")
	private Long updatebyId;
	/**
	 * 建立人
	 */
	@Column(name = "createby_id")
	private Long createbyId;
	/**
	 * 最后更新时间
	 */
	@Column(name = "update_date")
	private Date updateDate;
	/**
	 * 建立时间
	 */
	@Column(name = "create_date")
	private Date createDate;

	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE }, targetEntity = Module.class)
	@JoinTable(name = "meta_module_table", joinColumns = { @JoinColumn(name = "table_id") }, inverseJoinColumns = { @JoinColumn(name = "module_id") })
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Set<Module> modules = new HashSet<Module>(0);

	@OneToMany(targetEntity = DbColumn.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@OrderBy("id ASC")
	private Set<DbColumn> columns;

	public Set<DbColumn> getColumns() {
		return columns;
	}

	public void setColumns(Set<DbColumn> columns) {
		this.columns = columns;
	}

	public DataSource getDatasource() {
		return datasource;
	}

	public void setDatasource(DataSource datasource) {
		this.datasource = datasource;
	}

	public Set<Module> getModules() {
		return modules;
	}

	public void setModules(Set<Module> modules) {
		this.modules = modules;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getTablePname() {
		return tablePname;
	}

	public void setTablePname(String tablePname) {
		this.tablePname = tablePname;
	}

	public Integer getTableType() {
		return tableType;
	}

	public void setTableType(Integer tableType) {
		this.tableType = tableType;
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

	public void addColumn(DbColumn col) {
		if (columns == null) {
			columns = new HashSet<DbColumn>();
		}
		columns.add(col);
	}

}