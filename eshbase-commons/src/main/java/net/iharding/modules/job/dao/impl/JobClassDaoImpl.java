package net.iharding.modules.job.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.job.dao.JobClassDao;
import net.iharding.modules.job.model.JobClass;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: JobClass
* @Description: JobClassdaoImpl
* @author Joe.zhang
* @date  2016-1-31 16:56:20
*
*/
@Repository
public class JobClassDaoImpl extends HibernateDao<JobClass,Long> implements JobClassDao {

}
