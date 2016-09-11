package net.iharding.modules.job.dao.impl;

import net.iharding.modules.job.dao.JobActivityClassDao;
import net.iharding.modules.job.model.JobActivityClass;

import org.guess.core.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: JobActivityClass
* @Description: JobActivityClassdaoImpl
* @author Joe.zhang
* @date  2016-9-10 19:12:08
*
*/
@Repository
public class JobActivityClassDaoImpl extends HibernateDao<JobActivityClass,Long> implements JobActivityClassDao {

}
