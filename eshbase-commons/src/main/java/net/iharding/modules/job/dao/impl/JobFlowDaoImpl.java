package net.iharding.modules.job.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.job.dao.JobFlowDao;
import net.iharding.modules.job.model.JobFlow;
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

}
