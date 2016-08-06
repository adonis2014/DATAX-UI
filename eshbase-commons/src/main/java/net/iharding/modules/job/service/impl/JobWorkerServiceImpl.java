package net.iharding.modules.job.service.impl;

import org.guess.core.service.BaseServiceImpl;

import net.iharding.modules.job.dao.JobFlowDao;
import net.iharding.modules.job.dao.JobWorkerDao;
import net.iharding.modules.job.model.JobFlowWrapper;
import net.iharding.modules.job.model.JobWorker;
import net.iharding.modules.job.service.JobWorkerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: JobWorker
* @Description: JobWorkerserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class JobWorkerServiceImpl extends BaseServiceImpl<JobWorker, Long> implements JobWorkerService {
	@Autowired
	private JobFlowDao jobFlowDao;
	
	@Autowired
	private JobWorkerDao jobWorkerDao;
	@Override
	public JobWorker schedleJob(JobFlowWrapper object, String cronString) {
		JobWorker jworker=new JobWorker();
		jworker.setJobclass(object.getJobclass());
//		jworker.set
		return null;
	}

}
