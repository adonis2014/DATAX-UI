package net.iharding.modules.meta.model;

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

import net.iharding.core.orm.IdEntity;
import net.iharding.modules.job.model.JobExecutionInfo;

import org.guess.sys.model.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 * 数据库定义Entity
 * @author Joe.zhang
 * @version 2016-05-18
 */
@Entity
@Table(name = "meta_database")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Database extends IdEntity {

	/**
	 * 数据源ID
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="datasource_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private DataSource datasource;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="job_exe_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private JobExecutionInfo executionInfo;
	/**
	 * 数据库名
	 */
	@Column(name="db_name")
	private String dbname;
	/**
	 * schema名
	 */
	@Column(name="schema_name")
	private String schemaName;
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
	/**
	 * 备注
	 */
	private String remark;
	
	@OneToMany(targetEntity=DBTable.class,fetch = FetchType.LAZY,cascade=CascadeType.ALL,mappedBy="database")
	@OrderBy("id ASC")
	private Set<DBTable> tables;
	
	
	
	public String getDbname() {
		return dbname;
	}

	public void setDbname(String dbname) {
		this.dbname = dbname;
	}
	
	public String getSchemaName() {
		return schemaName;
	}

	public void setSchemaName(String schemaName) {
		this.schemaName = schemaName;
	}
	
	public DataSource getDatasource() {
		return datasource;
	}

	public void setDatasource(DataSource datasource) {
		this.datasource = datasource;
	}

	public JobExecutionInfo getExecutionInfo() {
		return executionInfo;
	}

	public void setExecutionInfo(JobExecutionInfo executionInfo) {
		this.executionInfo = executionInfo;
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

	public Set<DBTable> getTables() {
		return tables;
	}

	public void setTables(Set<DBTable> tables) {
		this.tables = tables;
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
	
	public void addTable(DBTable table) {
		if (tables == null) {
			tables = new HashSet<DBTable>();
		}
		tables.add(table);
	}

	public DBTable getDBTable(String tableName,User cuser) {
		if (tables!=null){
			for(DBTable tdb:tables){
				if ( tdb.getTableName().equalsIgnoreCase(tableName)){
					tdb.setUpdater(cuser);
					tdb.setUpdateDate(new Date());
					return tdb;
				}
			}
		}
		DBTable table=new DBTable();
		table.setCreateDate(new Date());
		try{
			table.setCreater(cuser);
		}catch(Exception ex){}
		return table;
	}
	
	@Override  
    public boolean equals(Object obj) {  
        if(obj == null) return false;  
        if(this == obj) return true;  
        if(obj instanceof Database){   
        	Database db =(Database)obj;  
            if( db.getDbname().equals(this.dbname)) return true;  
        }  
        return false;  
    }  
  
  
  
    /** 
     * 重写hashcode 方法，返回的hashCode 不一样才认定为不同的对象 
     */  
    @Override  
    public int hashCode() {  
        return dbname.hashCode();  
    }  
}