package net.iharding.datax.engine;

import java.util.List;
import java.util.Map;

import net.iharding.modules.job.dao.JobWorkerDao;
import net.iharding.modules.job.jobtype.DataxETLTask;
import net.iharding.modules.job.model.JobWorker;
import net.iharding.utils.PropertyUtils;

import org.springframework.beans.factory.annotation.Autowired;


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
//	private static Map<String, JobScheduler> schedulers = new java.util.concurrent.ConcurrentHashMap<String, JobScheduler>();

	// private final JobConfiguration jobConfig1 = new JobConfiguration("simpleElasticDemoJob", DataxCommonJob.class, 10, "0/5 * * * * ?");

	@Autowired
	private JobWorkerDao jobWorkerDao;


	@Override
	public void addJob(long jobId) {
		JobWorker job = jobWorkerDao.get(jobId);
		
	}

	@Override
	public void overWriteJob(long jobId) {
		JobWorker job = jobWorkerDao.get(jobId);
		//todo
		jobWorkerDao.save(job);
	}

	@Override
	public void addAllJobs() {
		List<JobWorker> jobs=jobWorkerDao.getAll();
		
	}

	@Override
	public void shutdownJob(long jobId) {
		JobWorker job = jobWorkerDao.get(jobId);
		
	}

	@Override
	public void shutdownAllJobs() {
		List<JobWorker> jobs=jobWorkerDao.getAll();
		
	}

}
