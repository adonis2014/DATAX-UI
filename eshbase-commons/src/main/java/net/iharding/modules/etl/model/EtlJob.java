package net.iharding.modules.etl.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
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
import net.iharding.modules.meta.model.DbColumn;
import net.iharding.utils.ETLConstants;

import org.guess.sys.model.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonView;

/**
 * ETL调度作业Entity
 * @author Joe.zhang
 * @version 2016-01-30
 */
@Entity
@Table(name = "etl_job")
@JsonIgnoreProperties(value = { "tasks"})
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class EtlJob  {
	
	@Id  
	@SequenceGenerator(name = "seq_etl_job", allocationSize = 1, initialValue = 1, sequenceName = "seq_etl_job")  
	@GeneratedValue(generator = "seq_etl_job", strategy = GenerationType.SEQUENCE)  
	@JsonView(IdView.class)
	private long id;  

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	/**
	 * 调度作业名
	 */
	@Column(name="job_name")
	private String jobName;
	
	
	/**
	 * 状态
	 */
	private Integer status;
	/**
	 * ETL类型
	 */
	@Column(name="etl_type")
	private Integer etlType;
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
	 * 启用标记
	 */
	@Column(name="check_label")
	private Integer checkLabel;
	/**
	 * 备注
	 */
	private String remark;
	
	@OneToMany(targetEntity=EtlTask.class,cascade=CascadeType.REFRESH,mappedBy="job")
	@OrderBy("id ASC")
	private Set<EtlTask> tasks;
	
	@OneToMany(targetEntity=JobColumnPair.class,cascade=CascadeType.REFRESH,mappedBy="job")
	@OrderBy("id ASC")
	private Set<JobColumnPair> columnPairs;
	
	public Set<JobColumnPair> getColumnPairs() {
		return columnPairs;
	}

	public void setColumnPairs(Set<JobColumnPair> columnPairs) {
		this.columnPairs = columnPairs;
	}

	public void addColumnPair(JobColumnPair column){
		if (columnPairs==null){
			columnPairs=new HashSet<JobColumnPair>();
		}
		columnPairs.add(column);
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	
	public Integer getEtlType() {
		return etlType;
	}

	public void setEtlType(Integer etlType) {
		this.etlType = etlType;
	}

	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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

	public Set<EtlTask> getTasks() {
		return tasks;
	}

	public void setTasks(Set<EtlTask> tasks) {
		this.tasks = tasks;
	}
	
	public void addTask(EtlTask task){
		if (this.tasks==null){
			this.tasks=new HashSet<EtlTask>();
		}
		this.tasks.add(task);
	}
	
	public EtlTask getReaderTask(){
		if (tasks==null)return null;
		for (EtlTask dpc : tasks) {
			if (dpc.getPlugin()!=null && dpc.getPlugin().getPluginType()==1){
				return dpc;
			}
		}
		return null;
	}
	
	public EtlTask getWriterTask(){
		if (tasks==null)return null;
		for (EtlTask dpc : tasks) {
			if (dpc.getPlugin()!=null && dpc.getPlugin().getPluginType()==2){
				return dpc;
			}
		}
		return null;
	}
	
	/**
	 * 检查配置是否错误
	 * @return
	 */
	public boolean checkSetError(){
		
		return true;
	}
	
	/**
	 * 将ETL调度任务配置转换为字符串输出
	 */
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder(300);
		sb.append(String.format("\njob:%s", this.getId()));
		sb.append("\nReader task conf:");
		sb.append(this.getReaderTask().toString());
		sb.append(String.format("\n\nWriter task [num %d]:", this.tasks.size()-1));
		for (EtlTask dpc : tasks) {
			if (dpc.getPlugin().getPluginType()==2){
				sb.append(dpc.toString());
			}
		}
		return sb.toString();
	}

	public List<EtlTask> getWriterTasks() {
		List<EtlTask> wtasks=new ArrayList<EtlTask>(); 
		for(EtlTask task:tasks){
			if (task.getPlugin()!=null && task.getPlugin().getPluginType()==2){
				wtasks.add(task);
			}
		}
		return wtasks;
	}

	public void setTasksParams() {
		for(EtlTask task:tasks){
			task.convertParams();
		}
	}
	
	public void setTasksColumns(){
		EtlTask readerTask=this.getReaderTask();
		EtlTask writerTask=this.getWriterTask();
		if (readerTask!=null && readerTask.getDataset()!=null){
			Set<DbColumn> columns=readerTask.getDataset().getColumns();
			int i=1;
			for(DbColumn column:columns){
				JobColumnPair tcolumn=new JobColumnPair();
				tcolumn.setJob(this);
				tcolumn.setReadColumnId(column.getId());
				tcolumn.setReadColumnName(column.getColumnName());
				tcolumn.setReadtask(readerTask);
				tcolumn.setReaderFieldType(ETLConstants.FIELD_SOURCETYPE_INITVALUE);
				tcolumn.setWriterFieldType(ETLConstants.FIELD_TYPE_ORI);
				tcolumn.setReadTaskId(readerTask.getId());
				if (writerTask!=null){
					DbColumn writecolumn=getTaskColumn(tcolumn.getReadColumnName(),writerTask);
					if (writecolumn!=null){
						tcolumn.setWriteColumnId(writecolumn.getId());
						tcolumn.setWriteColumnName(writecolumn.getColumnName());
						tcolumn.setRemark(column.getColumnPname()+"->"+writecolumn.getColumnPname());
					}else{
						tcolumn.setWriteColumnName(column.getColumnName());
						tcolumn.setRemark(column.getColumnPname()+"->"+column.getColumnName()+"[无对应字段]");
					}
					tcolumn.setWritetask(writerTask);
					tcolumn.setWriteTaskId(writerTask.getId());
				}
				tcolumn.setSortId(i);
				i++;
				addColumnPair(tcolumn);
			}
		}
	}
	
	private DbColumn getTaskColumn(String columnName,EtlTask task){
		if (task.getDataset()==null)return null;
		for(DbColumn column:task.getDataset().getColumns()){
			if (column.getColumnName().equalsIgnoreCase(columnName)){
				return column;
			}
		}
		return null;
	}

	public void setTaskColumns(List<JobColumnPair> tcols) {
		if (columnPairs==null){
			columnPairs=new HashSet<JobColumnPair>();
		}
		this.columnPairs.addAll(tcols);
	}

	public void setTask(EtlTask readerTask,Integer pluginType) {
		if (tasks!=null){
			for (EtlTask dpc : tasks) {
				if (dpc.getPlugin().getPluginType()==pluginType){
					tasks.remove(dpc);
					break;
				}
			}
		}
		addTask(readerTask);
	}
	
}
