package net.iharding.modules.job.dao.impl;

import net.iharding.modules.job.dao.JobClassDao;
import net.iharding.modules.job.model.JobClass;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

/**
 * 
 * @ClassName: JobClass
 * @Description: JobClassdaoImpl
 * @author Joe.zhang
 * @date 2016-1-31 16:56:20
 * 
 */
@Repository
public class JobClassDaoImpl extends HibernateDao<JobClass, Long> implements JobClassDao {

	@Override
	public void save(JobClass jobClass) {
		Session session = getSession();
		session.merge(jobClass);
	}

	@Override
	public JobClass get(String jobClass) {
		return this.findUniqueBy("className", jobClass);
	}
}
