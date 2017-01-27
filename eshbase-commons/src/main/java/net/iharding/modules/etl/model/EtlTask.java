package net.iharding.modules.etl.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import net.iharding.core.jsonview.IdView;
import net.iharding.modules.meta.model.Dataset;

import org.guess.sys.model.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonView;

/**
 * ETL任务Entity
 * @author Joe.zhang
 * @version 2016-01-30
 */
@Entity
@Table(name = "etl_task")
@JsonIgnoreProperties(value = { "taskParams","job"})
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class EtlTask  {

	@Id  
	@SequenceGenerator(name = "seq_etl_task", allocationSize = 1, initialValue = 1, sequenceName = "seq_etl_task")  
	@GeneratedValue(generator = "seq_etl_task", strategy = GenerationType.SEQUENCE)  
	@JsonView(IdView.class)
	private long id;  

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	/**
	 * 任务名
	 */
	@Column(name="task_name")
	private String taskName;
	/**
	 * 调度id
	 */
	@ManyToOne(cascade =CascadeType.ALL,targetEntity = EtlJob.class,fetch = FetchType.LAZY)
	@JoinColumn(name="job_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private EtlJob job;
	
	@Column(name="job_id",insertable=false,updatable=false)
	private Long jobId;
	
	/**
	 * 插件id
	 */
	@ManyToOne(cascade = CascadeType.ALL,targetEntity = EtlPlugin.class,fetch = FetchType.LAZY)
	@JoinColumn(name="plugin_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private EtlPlugin plugin;
	/**
	 * 最后更新人
	 */
	@ManyToOne(cascade = CascadeType.REFRESH,targetEntity = User.class,fetch = FetchType.LAZY)
	@JoinColumn(name="updateby_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private User updater;
	/**
	 * 建立人
	 */
	@ManyToOne(cascade =CascadeType.REFRESH,targetEntity = User.class,fetch = FetchType.LAZY)
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
	//主键key处理函数，默认是字段组合，_分隔
	@Column(name="pk_function_name")
	private String pkFunctionName;
	
	/**
	 * 启用标记
	 */
	@Column(name="check_label")
	private Integer checkLabel;
	
	@OneToMany(targetEntity=EtlTaskParam.class,fetch = FetchType.LAZY,cascade=CascadeType.ALL,mappedBy = "task")
	@OrderBy("id ASC")
	private Set<EtlTaskParam> taskParams;
	
	@Column(name="dataset_id",insertable=false,updatable=false)
	private Long datasetId;
	
	@ManyToOne(cascade =CascadeType.REFRESH,targetEntity = Dataset.class,fetch = FetchType.LAZY)
	@JoinColumn(name="dataset_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Dataset dataset;
	
	public Long getJobId() {
		return jobId;
	}

	public void setJobId(Long jobId) {
		this.jobId = jobId;
	}

	public Long getDatasetId() {
		return datasetId;
	}
	/**
	 * 判断参数是否存在
	 * @param key
	 * @return
	 */
	private boolean existParam(String key){
		if (taskParams==null){
			taskParams=new HashSet<EtlTaskParam>();
			return false;
		}
		for(EtlTaskParam tparam:taskParams){
			if (key.equalsIgnoreCase(tparam.getParamKey())){
				return true;
			}
		}
		return false;
	}
	
	public void convertParams(){
		for(EtlPluginParam param:plugin.getPluginParams()){
			if (!existParam(param.getName())){
				EtlTaskParam tparam=new EtlTaskParam();
				tparam.setIsColumn(param.getIsColumn());
				tparam.setParamKey(param.getName());
				tparam.setParamValue(param.getDefaultValue());
				tparam.setPluginParamId(param.getId());
				tparam.setRemark(param.getDescription());
				tparam.setTask(this);
				tparam.setTaskId(this.id);
				taskParams.add(tparam);
			}
		}
	}

	public String getPkFunctionName() {
		return pkFunctionName;
	}

	public void setPkFunctionName(String pkFunctionName) {
		this.pkFunctionName = pkFunctionName;
	}

	public void setDatasetId(Long datasetId) {
		this.datasetId = datasetId;
	}

	public Dataset getDataset() {
		return dataset;
	}

	public void setDataset(Dataset dataset) {
		this.dataset = dataset;
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
