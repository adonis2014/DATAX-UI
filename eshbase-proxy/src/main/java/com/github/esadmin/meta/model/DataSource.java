package com.github.esadmin.meta.model;

import java.util.Date;
import java.util.HashSet;
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

import org.guess.core.orm.IdEntity;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 数据源Entity
 * @author Joe.zhang
 * @version 2015-12-01
 */
@Entity
@Table(name = "meta_datasource")
@JsonIgnoreProperties(value = { "databases"})
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class DataSource extends IdEntity {

	@OneToMany(targetEntity=Database.class,fetch = FetchType.LAZY,cascade=CascadeType.ALL,mappedBy="datasource")
	@OrderBy("id ASC")
	private Set<Database> databases;
	
	
	@Column(name="ds_name")
	private String dsName;
	
	@Column(name="schema_name")
	private String schemaName;
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
	 * 最后更新时间
	 */
	@Column(name="update_date")
	private Date updateDate;
	/**
	 * 建立时间
	 */
	@Column(name="create_date")
	private Date createDate;

	
	@Column(name="check_label")
	private Integer checkLabel;
	
	public Set<Database> getDatabases() {
		return databases;
	}

	public void setDatabases(Set<Database> databases) {
		this.databases = databases;
	}

	public String getDsName() {
		return dsName;
	}

	public void setDsName(String dsName) {
		this.dsName = dsName;
	}

	public Integer getCheckLabel() {
		return checkLabel;
	}

	public void setCheckLabel(Integer checkLabel) {
		this.checkLabel = checkLabel;
	}


	public String getSchemaName() {
		return schemaName;
	}

	public void setSchemaName(String schemaName) {
		this.schemaName = schemaName;
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
	
	public void addDatabase(Database db) {
		if (databases==null){
			databases=new HashSet<Database>();
		}
		databases.add(db);
	}
	
	public Database getDatabase(String dbname){
		if (databases!=null){
			for(Database tdb:databases){
				if (tdb.getDatasource().id==this.id && tdb.getDbname().equalsIgnoreCase(dbname)){
					return tdb;
				}
			}
		}
		Database db=new Database();
		db.setCreateDate(new Date());
		User cuser = UserUtil.getCurrentUser();
		db.setCreater(cuser);
		return db;
	}
	/**
	 * 将状态设置为未启用
	 */
	public void setCheckLabelFalse(){
		for (Database db:databases){
			db.setCheckLabel(0);
			for(DBTable table:db.getTables()){
				table.setCheckLabel(0);
				for(DbColumn column:table.getColumns()){
					column.setCheckLabel(0);
				}
			}
		}
	}
}