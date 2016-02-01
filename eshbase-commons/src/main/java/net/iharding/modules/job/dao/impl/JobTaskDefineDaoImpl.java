package net.iharding.modules.job.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.job.dao.JobTaskDefineDao;
import net.iharding.modules.job.model.JobTaskDefine;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: JobTaskDefine
* @Description: JobTaskDefinedaoImpl
* @author Joe.zhang
* @date  2016-1-31 17:39:36
*
*/
@Repository
public class JobTaskDefineDaoImpl extends HibernateDao<JobTaskDefine,Long> implements JobTaskDefineDao {

}
