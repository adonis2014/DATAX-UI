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

import org.guess.sys.model.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 索引对象Entity
 * @author Joe.zhang
 * @version 2015-12-08
 */
@Entity
@Table(name = "meta_dbindex")
@JsonIgnoreProperties(value = {"hibernateLazyInitializer","handler", "columns"})
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class DBIndex extends IdEntity {

	/**
	 * 数据表
	 */
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE }, targetEntity = Dataset.class)
	@JoinTable(name = "meta_table_index", joinColumns = { @JoinColumn(name = "index_id") }, inverseJoinColumns = { @JoinColumn(name = "table_id") })
	@JsonIgnoreProperties(value = { "hibernateLazyInitializer","handler","datasource"})
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Set<Dataset> tables = new HashSet<Dataset>(0);
	/**
	 * 索引库名
	 */
	@Column(name="index_name")
	private String index_name;
	
	/**
	 * 索引表名
	 */
	@Column(name="type_name")
	private String type_name;
	/**
	 * 索引类别
	 */
	@Column(name="index_type")
	private Integer indexType;
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
	 * 建立世间
	 */
	@Column(name="create_date")
	private Date createDate;
	/**
	 * 更新世间
	 */
	@Column(name="update_date")
	private Date updateDate;
	/**
	 * 备注
	 */
	@Column(name="remark")
	private String remark;
	
	@OneToMany(targetEntity = DbColumn.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL,mappedBy="dbindex")
	@OrderBy("id ASC")
	private Set<DbColumn> columns;
	
	@Column(name="check_label")
	private Integer checkLabel;
	
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

	public Integer getCheckLabel() {
		return checkLabel;
	}

	public void setCheckLabel(Integer checkLabel) {
		this.checkLabel = checkLabel;
	}
	
	public Set<Dataset> getTables() {
		return tables;
	}

	public void setTables(Set<Dataset> tables) {
		this.tables = tables;
	}

	public String getIndex_name() {
		return index_name;
	}

	public void setIndex_name(String index_name) {
		this.index_name = index_name;
	}
	
	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	
	public Integer getIndexType() {
		return indexType;
	}

	public void setIndexType(Integer indexType) {
		this.indexType = indexType;
	}
	
	public Set<DbColumn> getColumns() {
		return columns;
	}

	public void setColumns(Set<DbColumn> columns) {
		this.columns = columns;
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
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}