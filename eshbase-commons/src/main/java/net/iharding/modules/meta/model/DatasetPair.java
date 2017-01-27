package net.iharding.modules.meta.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.guess.sys.model.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import net.iharding.core.orm.IdEntity;
@Entity
@Table(name = "meta_dataset_pair")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class DatasetPair  extends IdEntity{
	
	@Column(name = "source_dataset_id",insertable=false,updatable=false)
	private long sourceDatasetId;
	
	@ManyToOne(cascade =CascadeType.ALL,targetEntity = Dataset.class,fetch = FetchType.LAZY)
	@JoinColumn(name="source_dataset_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Dataset sourceDataset;
	
	@Column(name = "target_dataset_id",insertable=false,updatable=false)
	private long targetDatasetId;	
	
	@ManyToOne(cascade =CascadeType.ALL,targetEntity = Dataset.class,fetch = FetchType.LAZY)
	@JoinColumn(name="target_dataset_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Dataset targetDataset;
	
	@Column(name = "process_type")
	private Integer processType;
	
	@Column(name = "process_id")
	private long processId;
	
	@Column(name = "source_task_id")
	private long sourceTaskId;
	
	@Column(name = "target_task_id")
	private long targetTaskId;
	
	@Column(name = "create_date")
	private Date create_date;
	
	@Column(name = "update_date")
	private Date updateDate;
	
	@Column(name = "createby_id",insertable=false,updatable=false)
	private long createbyId;
	
	@Column(name = "updateby_id",insertable=false,updatable=false)
	private long updatebyId;
	
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
	
	@Column(name = "remark")
	private String remark;

	public long getSourceDatasetId() {
		return sourceDatasetId;
	}

	public void setSourceDatasetId(long sourceDatasetId) {
		this.sourceDatasetId = sourceDatasetId;
	}

	public Dataset getSourceDataset() {
		return sourceDataset;
	}

	public void setSourceDataset(Dataset sourceDataset) {
		this.sourceDataset = sourceDataset;
	}

	public long getTargetDatasetId() {
		return targetDatasetId;
	}

	public void setTargetDatasetId(long targetDatasetId) {
		this.targetDatasetId = targetDatasetId;
	}

	public Dataset getTargetDataset() {
		return targetDataset;
	}

	public void setTargetDataset(Dataset targetDataset) {
		this.targetDataset = targetDataset;
	}

	

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getProcessType() {
		return processType;
	}

	public void setProcessType(Integer processType) {
		this.processType = processType;
	}

	public long getProcessId() {
		return processId;
	}

	public void setProcessId(long processId) {
		this.processId = processId;
	}

	public long getSourceTaskId() {
		return sourceTaskId;
	}

	public void setSourceTaskId(long sourceTaskId) {
		this.sourceTaskId = sourceTaskId;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public long getCreatebyId() {
		return createbyId;
	}

	public void setCreatebyId(long createbyId) {
		this.createbyId = createbyId;
	}

	public long getUpdatebyId() {
		return updatebyId;
	}

	public void setUpdatebyId(long updatebyId) {
		this.updatebyId = updatebyId;
	}

	public long getTargetTaskId() {
		return targetTaskId;
	}

	public void setTargetTaskId(long targetTaskId) {
		this.targetTaskId = targetTaskId;
	}
	
}
