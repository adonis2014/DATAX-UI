package net.iharding.modules.etl.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.etl.dao.EtlJobLogDao;
import net.iharding.modules.etl.model.EtlJobLog;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: EtlJobLog
* @Description: EtlJobLogdaoImpl
* @author Joe.zhang
* @date  2016-1-30 17:26:11
*
*/
@Repository
public class EtlJobLogDaoImpl extends HibernateDao<EtlJobLog,Long> implements EtlJobLogDao {

}
