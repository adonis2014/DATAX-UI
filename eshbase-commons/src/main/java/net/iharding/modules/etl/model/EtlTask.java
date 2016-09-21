package net.iharding.modules.etl.model;

import java.util.Date;
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
import net.iharding.modules.meta.model.DataSource;

import org.guess.sys.model.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * ETL任务Entity
 * @author Joe.zhang
 * @version 2016-01-30
 */
@Entity
@Table(name = "etl_task")
@JsonIgnoreProperties(value = { "taskParams","job"})
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class EtlTask extends IdEntity {

	/**
	 * 任务名
	 */
	@Column(name="task_name")
	private String taskName;
	/**
	 * 调度id
	 */
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = EtlJob.class,fetch = FetchType.LAZY)
	@JoinColumn(name="job_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private EtlJob job;
	/**
	 * 插件id
	 */
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = EtlPlugin.class,fetch = FetchType.LAZY)
	@JoinColumn(name="plugin_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private EtlPlugin plugin;
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
	 * 建立时间
	 */
	@Column(name="create_date")
	private Date createDate;
	/**
	 * 更新时间
	 */
	@Column(name="update_date")
	private Date updateDate;
	/**
	 * 备注
	 */
	private String remark;
	
	/**
	 * 启用标记
	 */
	@Column(name="check_label")
	private Integer checkLabel;
	
	@OneToMany(targetEntity=EtlTaskParam.class,fetch = FetchType.LAZY,cascade=CascadeType.ALL,mappedBy="task")
	@OrderBy("id ASC")
	private Set<EtlTaskParam> taskParams;
	
	@Column(name="datasource_id",insertable=false,updatable=false)
	private long datasourceId;
	
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = DataSource.class,fetch = FetchType.LAZY)
	@JoinColumn(name="datasource_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private DataSource dataSource;
	
	public long getDatasourceId() {
		return datasourceId;
	}

	public void setDatasourceId(long datasourceId) {
		this.datasourceId = datasourceId;
	}

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public Set<EtlTaskParam> getTaskParams() {
		return taskParams;
	}

	public void setTaskParams(Set<EtlTaskParam> taskParams) {
		this.taskParams = taskParams;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	
	public Integer getCheckLabel() {
		return checkLabel;
	}

	public void setCheckLabel(Integer checkLabel) {
		this.checkLabel = checkLabel;
	}

	public EtlJob getJob() {
		return job;
	}

	public void setJob(EtlJob job) {
		this.job = job;
	}
	
	public EtlPlugin getPlugin() {
		return plugin;
	}

	public void setPlugin(EtlPlugin plugin) {
		this.plugin = plugin;
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
	
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder(1024);
		sb.append(String.format("\nname:%s id %s, updatedate(%d) ",
				this.getTaskName(), this.getId(), 
				this.getUpdateDate()));
		String s = "";
		for (EtlTaskParam param : taskParams) {
			if ("password".equalsIgnoreCase(param.getParamKey())){
				s += String.format("\n\t%25s=[%-30s]", param.getParamKey(), "******");
			}else{
				s += String.format("\n\t%25s=[%-30s]", param.getParamKey(), param.getParamValue());
			}
		}
		sb.append(String.format("\nparams:%s", s));
		return sb.toString();
	}
	
	
}
