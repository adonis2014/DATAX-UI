package net.iharding.modules.job.dao.impl;

import net.iharding.modules.job.dao.JobFlowDao;
import net.iharding.modules.job.model.JobFlow;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: JobFlow
* @Description: JobFlowdaoImpl
* @author Joe.zhang
* @date  2016-5-19 23:56:47
*
*/
@Repository
public class JobFlowDaoImpl extends HibernateDao<JobFlow,Long> implements JobFlowDao {

	@Override
	public void save(JobFlow jobFlow) {
		Session session = getSession();
		session.merge(jobFlow);
	}
}
