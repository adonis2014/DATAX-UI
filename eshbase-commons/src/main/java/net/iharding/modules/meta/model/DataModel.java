package net.iharding.modules.meta.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.guess.sys.model.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 * 数据模型
 * @author zhangxuhui
 *
 */
@Entity
@Table(name = "meta_data_model")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class DataModel extends IdEntity {
	
	@Column(name = "model_name")
	private String modelName;

	@Column(name = "fact_table")
	private String factTable;
	
	@Column(name = "fact_table_id",insertable=false,updatable=false)
	private long factTableId;
	
	@Column(name = "datasource_id")
	private Long datasourceId;
	
	@Column(name = "remark")
	private String remark;
	
	@Column(name = "json")
	private String json;
	
	@Column(name = "sql")
	private String sql;
	
	@Column(name = "dataset_id",insertable=false,updatable=false)
	private long dataset_id;
	
	@ManyToOne(cascade =CascadeType.ALL,targetEntity = Dataset.class,fetch = FetchType.LAZY)
	@JoinColumn(name="dataset_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Dataset dataset;
	
	@ManyToOne(cascade =CascadeType.ALL,targetEntity = Dataset.class,fetch = FetchType.LAZY)
	@JoinColumn(name="fact_table_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Dataset factTableDataset;
	
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
	
	public Integer getCheckLabel() {
		return checkLabel;
	}

	public void setCheckLabel(Integer checkLabel) {
		this.checkLabel = checkLabel;
	}

	public long getFactTableId() {
		return factTableId;
	}

	public void setFactTableId(long factTableId) {
		this.factTableId = factTableId;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public long getDataset_id() {
		return dataset_id;
	}

	public void setDataset_id(long dataset_id) {
		this.dataset_id = dataset_id;
	}

	public Dataset getDataset() {
		return dataset;
	}

	public void setDataset(Dataset dataset) {
		this.dataset = dataset;
	}

	public Dataset getFactTableDataset() {
		return factTableDataset;
	}

	public void setFactTableDataset(Dataset factTableDataset) {
		this.factTableDataset = factTableDataset;
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

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public String getFactTable() {
		return factTable;
	}

	public void setFactTable(String factTable) {
		this.factTable = factTable;
	}

	public Long getDatasourceId() {
		return datasourceId;
	}

	public void setDatasourceId(Long datasourceId) {
		this.datasourceId = datasourceId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}
	
	
}
