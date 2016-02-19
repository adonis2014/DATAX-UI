package net.iharding.modules.job.dao;

import java.util.List;

import org.guess.core.orm.EntityDao;

import net.iharding.modules.job.model.JobWorker;

/**
* 
* @ClassName: JobWorker
* @Description: JobWorkerdao
* @author Joe.zhang
* @date  2016-1-31 17:34:42
*
*/
public interface JobWorkerDao extends EntityDao<JobWorker, Long>{

	public JobWorker get(String jobName);

	public List<JobWorker> findByRegCenter(Long regId);
	
}
