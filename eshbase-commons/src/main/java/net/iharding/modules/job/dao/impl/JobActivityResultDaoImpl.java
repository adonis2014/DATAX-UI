package net.iharding.modules.job.dao.impl;

import net.iharding.modules.job.dao.JobActivityResultDao;
import net.iharding.modules.job.model.JobActivityResult;

import org.guess.core.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: JobActivityResult
* @Description: JobActivityResultdaoImpl
* @author Joe.zhang
* @date  2016-9-10 19:36:12
*
*/
@Repository
public class JobActivityResultDaoImpl extends HibernateDao<JobActivityResult,Long> implements JobActivityResultDao {

}
