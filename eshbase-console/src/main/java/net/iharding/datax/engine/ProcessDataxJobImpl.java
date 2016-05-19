package net.iharding.datax.engine;

import java.util.List;
import java.util.Map;

import net.iharding.modules.job.dao.JobWorkerDao;
import net.iharding.modules.job.jobtype.DataxETLJob;
import net.iharding.modules.job.model.JobWorker;
import net.iharding.utils.PropertyUtils;

import org.springframework.beans.factory.annotation.Autowired;

import com.dangdang.ddframe.job.api.JobConfiguration;
import com.dangdang.ddframe.job.api.JobScheduler;
import com.dangdang.ddframe.reg.base.CoordinatorRegistryCenter;
import com.dangdang.ddframe.reg.zookeeper.ZookeeperConfiguration;
import com.dangdang.ddframe.reg.zookeeper.ZookeeperRegistryCenter;

/**
 * 调度任务实现
 * 
 * @author admin
 *
 */
public class ProcessDataxJobImpl implements ProcessDataxJob {
	/**
	 * 内存中保存调度任务的安排数据
	 */
	private static Map<String, JobScheduler> schedulers = new java.util.concurrent.ConcurrentHashMap<String, JobScheduler>();

	private ZookeeperConfiguration zkConfig = null;

	private CoordinatorRegistryCenter regCenter = null;

	// private final JobConfiguration jobConfig1 = new JobConfiguration("simpleElasticDemoJob", DataxCommonJob.class, 10, "0/5 * * * * ?");

	@Autowired
	private JobWorkerDao jobWorkerDao;

	/**
	 * 获取调度任务注册中心对象
	 * 
	 * @return
	 */
	private CoordinatorRegistryCenter getRegCenter() {
		if (zkConfig == null) {
			String zkCenter=PropertyUtils.getValue("zk.server");
			String nameSpace=PropertyUtils.getValue("job.namespace");
			zkConfig = new ZookeeperConfiguration(zkCenter, nameSpace, 1000, 3000, 3);
		}
		if (regCenter == null) {
			regCenter = new ZookeeperRegistryCenter(zkConfig);
			regCenter.init();
		}
		return regCenter;
	}

	@Override
	public void addJob(long jobId) {
		JobWorker job = jobWorkerDao.get(jobId);
		if (schedulers.get(job.getName())==null){
			JobConfiguration jobConfig = new JobConfiguration(job.getName(), DataxETLJob.class, 1, job.getCron());
			jobConfig.setJobParameter(job.getId().toString());
			JobScheduler js= new JobScheduler(getRegCenter(), jobConfig);
			js.init();
			schedulers.put(job.getName(),js);
			job.setNextExeDate(js.getNextFireTime());
			jobWorkerDao.save(job);
		}
	}

	@Override
	public void overWriteJob(long jobId) {
		JobWorker job = jobWorkerDao.get(jobId);
		JobScheduler js=null;
		if (schedulers.get(job.getName())==null){
			JobConfiguration jobConfig = new JobConfiguration(job.getName(), DataxETLJob.class, 1, job.getCron());
			jobConfig.setJobParameter(job.getId().toString());
			js= new JobScheduler(getRegCenter(), jobConfig);
			js.init();
			schedulers.put(job.getName(),js);
		}else{
			js=schedulers.get(job.getName());
			js.rescheduleJob(job.getCron());
		}
		job.setNextExeDate(js.getNextFireTime());
		jobWorkerDao.save(job);
	}

	@Override
	public void addAllJobs() {
		List<JobWorker> jobs=jobWorkerDao.getAll();
		JobScheduler js=null;
		for(JobWorker job:jobs){
			if (schedulers.get(job.getName())==null){
				JobConfiguration jobConfig = new JobConfiguration(job.getName(), DataxETLJob.class, 1, job.getCron());
				jobConfig.setJobParameter(job.getId().toString());
				js= new JobScheduler(getRegCenter(), jobConfig);
				js.init();
				schedulers.put(job.getName(),js);
			}else{
				js=schedulers.get(job.getName());
				js.rescheduleJob(job.getCron());
			}
			job.setNextExeDate(js.getNextFireTime());
			jobWorkerDao.save(job);
		}
	}

	@Override
	public void shutdownJob(long jobId) {
		JobWorker job = jobWorkerDao.get(jobId);
		JobScheduler js=null;
		if (schedulers.get(job.getName())!=null){
			js=schedulers.get(job.getName());
			js.shutdown();
			job.setNextExeDate(null);
			jobWorkerDao.save(job);
		}
	}

	@Override
	public void shutdownAllJobs() {
		List<JobWorker> jobs=jobWorkerDao.getAll();
		JobScheduler js=null;
		for(JobWorker job:jobs){
			if (schedulers.get(job.getName())!=null){
				js=schedulers.get(job.getName());
				js.shutdown();
				job.setNextExeDate(null);
				jobWorkerDao.save(job);
			}
		}
	}

}
