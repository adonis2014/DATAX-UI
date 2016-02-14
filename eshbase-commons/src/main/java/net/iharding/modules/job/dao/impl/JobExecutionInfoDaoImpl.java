package net.iharding.modules.job.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.job.dao.JobExecutionInfoDao;
import net.iharding.modules.job.model.JobExecutionInfo;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: JobExecutionInfo
* @Description: JobExecutionInfodaoImpl
* @author Joe.zhang
* @date  2016-2-11 12:11:47
*
*/
@Repository
public class JobExecutionInfoDaoImpl extends HibernateDao<JobExecutionInfo,Long> implements JobExecutionInfoDao {

}
