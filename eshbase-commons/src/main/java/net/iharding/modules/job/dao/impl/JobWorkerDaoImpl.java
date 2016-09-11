package net.iharding.modules.job.dao.impl;

import java.util.List;

import net.iharding.modules.job.dao.JobWorkerDao;
import net.iharding.modules.job.model.JobWorker;

import org.guess.core.orm.hibernate.NativeSqlQueryHibernateDao;
import org.guess.sys.dao.UserDao;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 
 * @ClassName: JobWorker
 * @Description: JobWorkerdaoImpl
 * @author Joe.zhang
 * @date 2016-1-31 17:34:42
 * 
 */
@Repository
public class JobWorkerDaoImpl extends NativeSqlQueryHibernateDao<JobWorker, Long> implements JobWorkerDao {

	@Autowired
	private UserDao userDao;
	
	@Override
	public JobWorker get(String jobName) {
		return this.findUniqueBy("name", jobName);
	}
	@Override
	public void save(JobWorker worker) {
		Session session = getSession();
		session.merge(worker);
	}
	
	@Override
	public List<JobWorker> findByRegCenter(Long regId) {
		return this.findBy("regId", regId);
	}
	
	@Override
	public void update(JobWorker worker) {
		Session session = getSession();
		session.update(worker);
		session.flush();
	}
	
	@Override
	public JobWorker saveOrUpdate(JobWorker worker) {
		Session session = getSession();
		session.merge(worker);
		return worker;
	}
	@Override
	public JobWorker getByKey(String jobClassName, String methodName, String jobParameter) {
		return this.findUnique("from JobWorker where jobClassName=? and methodName=? and jobParameter=?", jobClassName,methodName,jobParameter);
	}

}
