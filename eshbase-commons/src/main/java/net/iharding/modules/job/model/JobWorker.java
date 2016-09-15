package net.iharding.modules.job.model;

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

import cn.uncode.schedule.core.TaskDefine;

/**
 * 作业执行定义Entity
 * @author Joe.zhang
 * @version 2016-01-31
 */
@Entity
@Table(name = "job_worker")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class JobWorker extends IdEntity {

	/**
	 * 名称
	 */
	private String name;
	/**
	 * 作业类
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="jobclass_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private JobClass jobclass;
	/**
	 * 逻辑名
	 */
	@Column(name="logic_name")
	private String logicName;
	/**
	 * 作业类名
	 */
	@Column(name="job_class")
	private String jobClassName;
	
	/**
	 * 方法名
	 */
	@Column(name="method_name")
	private String methodName;
	/**
	 * 作业分片总数
	 */
	@Column(name="sharding_total_count")
	private Integer shardingTotalCount;
	/**
	 * 作业启动时间的cron表达式
	 */
	private String cron;
	/**
	 * 分片序列号和个性化参数对照表
	 */
	@Column(name="sharding_item_parameters")
	private String shardingItemParameters;
	/**
	 * 作业自定义参数
	 */
	@Column(name="job_parameter")
	private String jobParameter;
	/**
	 * 监控作业执行时状态
	 */
	@Column(name="monitor_execution")
	private Integer monitorExecution;
	/**
	 * 统计作业处理数据数量的间隔时间
	 */
	@Column(name="process_count_interval")
	private Integer processCountInterval;
	/**
	 * 处理数据的并发线程数
	 */
	@Column(name="data_process_thread")
	private Integer dataProcessThread;
	/**
	 * 每次抓取的数据量
	 */
	@Column(name="fetch_data_count")
	private Integer fetchDataCount;
	/**
	 * 最大容忍的本机与注册中心的时间误差秒数
	 */
	@Column(name="maxtime_diff")
	private Integer maxtimeDiff;
	/**
	 * 是否开启失效转移
	 */
	private Integer failover;
	/**
	 * 是否开启misfire
	 */
	private Integer misfire;
	/**
	 * 作业分片策略实现类全路径
	 */
	@Column(name="sharding_strategy_class")
	private String shardingStrategyClass;
	/**
	 * 作业是否禁止启动
	 */
	private Integer disabled;
	
	@Column(name="next_exe_date")
	private Date nextExeDate;
	/**
	 * 本地配置是否可覆盖注册中心配置
	 */
	private Integer overwrite;
	/**
	 * 注册中心ID
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="reg_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private RegCenter regCenter;
	
	@Column(name="reg_id",insertable = false, updatable = false)
	private Long regId;
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
	
	public TaskDefine covertoTaskDefint(){
		TaskDefine td=new TaskDefine();
		td.setCronExpression(this.cron);
		td.setTargetBean(jobClassName);
		td.setTargetMethod(methodName);
		td.setParams(jobParameter);
		td.setStartTime(new Date());
		td.setWorkerId(id);
		return td;
	}
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
	
	public RegCenter getRegCenter() {
		return regCenter;
	}

	public void setRegCenter(RegCenter regCenter) {
		this.regCenter = regCenter;
	}

	public Long getRegId() {
		return regId;
	}

	public void setRegId(Long regId) {
		this.regId = regId;
	}
	/**
	 * 调度任务流程对象
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="flow_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private JobFlow jobflow;
	
	@Column(name="flow_id",insertable = false, updatable = false)
	private Long jobFlowId;
	
	public Long getJobFlowId() {
		return jobFlowId;
	}

	public void setJobFlowId(Long jobFlowId) {
		this.jobFlowId = jobFlowId;
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public JobFlow getJobflow() {
		return jobflow;
	}

	public void setJobflow(JobFlow jobflow) {
		this.jobflow = jobflow;
	}

	public String getName() {
		return name;
	}

	public Date getNextExeDate() {
		return nextExeDate;
	}

	public void setNextExeDate(Date nextExeDate) {
		this.nextExeDate = nextExeDate;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public JobClass getJobclass() {
		return jobclass;
	}

	public void setJobclass(JobClass jobclass) {
		this.jobclass = jobclass;
	}

	public String getLogicName() {
		return logicName;
	}

	public void setLogicName(String logicName) {
		this.logicName = logicName;
	}
	
	public String getJobClassName() {
		return jobClassName;
	}

	public void setJobClassName(String jobClassName) {
		this.jobClassName = jobClassName;
	}
	
	public Integer getShardingTotalCount() {
		return shardingTotalCount;
	}

	public void setShardingTotalCount(Integer shardingTotalCount) {
		this.shardingTotalCount = shardingTotalCount;
	}
	
	public String getCron() {
		return cron;
	}

	public void setCron(String cron) {
		this.cron = cron;
	}
	
	public String getShardingItemParameters() {
		return shardingItemParameters;
	}

	public void setShardingItemParameters(String shardingItemParameters) {
		this.shardingItemParameters = shardingItemParameters;
	}
	
	public String getJobParameter() {
		return jobParameter;
	}

	public void setJobParameter(String jobParameter) {
		this.jobParameter = jobParameter;
	}
	
	public Integer getMonitorExecution() {
		return monitorExecution;
	}

	public void setMonitorExecution(Integer monitorExecution) {
		this.monitorExecution = monitorExecution;
	}
	
	public Integer getProcessCountInterval() {
		return processCountInterval;
	}

	public void setProcessCountInterval(Integer processCountInterval) {
		this.processCountInterval = processCountInterval;
	}
	
	public Integer getDataProcessThread() {
		return dataProcessThread;
	}

	public void setDataProcessThread(Integer dataProcessThread) {
		this.dataProcessThread = dataProcessThread;
	}
	
	public Integer getFetchDataCount() {
		return fetchDataCount;
	}

	public void setFetchDataCount(Integer fetchDataCount) {
		this.fetchDataCount = fetchDataCount;
	}
	
	public Integer getMaxtimeDiff() {
		return maxtimeDiff;
	}

	public void setMaxtimeDiff(Integer maxtimeDiff) {
		this.maxtimeDiff = maxtimeDiff;
	}
	
	public Integer getFailover() {
		return failover;
	}

	public void setFailover(Integer failover) {
		this.failover = failover;
	}
	
	public Integer getMisfire() {
		return misfire;
	}

	public void setMisfire(Integer misfire) {
		this.misfire = misfire;
	}
	
	public String getShardingStrategyClass() {
		return shardingStrategyClass;
	}

	public void setShardingStrategyClass(String shardingStrategyClass) {
		this.shardingStrategyClass = shardingStrategyClass;
	}
	
	public Integer getDisabled() {
		return disabled;
	}

	public void setDisabled(Integer disabled) {
		this.disabled = disabled;
	}
	
	public Integer getOverwrite() {
		return overwrite;
	}

	public void setOverwrite(Integer overwrite) {
		this.overwrite = overwrite;
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
	
	
}