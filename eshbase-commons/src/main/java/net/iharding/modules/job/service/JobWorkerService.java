package net.iharding.modules.job.service;

import org.guess.core.service.BaseService;

import net.iharding.modules.job.model.JobFlowWrapper;
import net.iharding.modules.job.model.JobWorker;

/**
 * 
 * @ClassName: JobWorker
 * @Description: JobWorkerservice
 * @author Joe.zhang
 * @date 2014-8-5 下午02:04:46
 *
 */
public interface JobWorkerService extends BaseService<JobWorker, Long> {
	/**
	 * 调度安排任务
	 * 
	 * @param object
	 * @param cronString
	 * @return
	 */
	public JobWorker schedleJob(JobFlowWrapper object, String cronString);

	/**
	 * 保存并提交任务到调度系统
	 * 
	 * @param object
	 * @param start
	 */
	public void save(JobWorker object, String start) throws Exception;

}
