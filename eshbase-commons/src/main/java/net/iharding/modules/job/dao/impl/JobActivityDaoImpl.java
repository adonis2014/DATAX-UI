package net.iharding.modules.job.dao.impl;

import net.iharding.modules.job.dao.JobActivityDao;
import net.iharding.modules.job.model.JobActivity;

import org.guess.core.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: JobActivity
* @Description: JobActivitydaoImpl
* @author Joe.zhang
* @date  2016-9-10 19:09:22
*
*/
@Repository
public class JobActivityDaoImpl extends HibernateDao<JobActivity,Long> implements JobActivityDao {

}
