package net.iharding.modules.job.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;

import net.iharding.modules.job.dao.JobWorkerDao;
import net.iharding.modules.job.model.JobWorker;

import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: JobWorker
* @Description: JobWorkerdaoImpl
* @author Joe.zhang
* @date  2016-1-31 17:34:42
*
*/
@Repository
public class JobWorkerDaoImpl extends HibernateDao<JobWorker,Long> implements JobWorkerDao {

	@Override
	public JobWorker get(String jobName) {
		return this.findUniqueBy("name",jobName);
	}

}
