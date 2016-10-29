package net.iharding.modules.etl.dao.impl;

import java.util.List;

import net.iharding.modules.etl.dao.JobColumnPairDao;
import net.iharding.modules.etl.model.EtlTask;
import net.iharding.modules.etl.model.JobColumnPair;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: TaskColumn
* @Description: TaskColumndaoImpl
* @author Joe.zhang
* @date  2016-4-3 23:30:55
*
*/
@Repository
public class JobColumnPairDaoImpl extends HibernateDao<JobColumnPair,Long> implements JobColumnPairDao {

	@Override
	public List<JobColumnPair> getJobColumnPairs(Long readTaskId){
		return this.findBy("readTaskId", readTaskId);
	}
	
	@Override
	public void save(JobColumnPair columnPair) {
		Session session = getSession();
		session.merge(columnPair);
	}

}
