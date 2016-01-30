package net.iharding.modules.etl.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.etl.dao.EtlTaskDao;
import net.iharding.modules.etl.model.EtlTask;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: EtlTask
* @Description: EtlTaskdaoImpl
* @author Joe.zhang
* @date  2016-1-30 10:07:54
*
*/
@Repository
public class EtlTaskDaoImpl extends HibernateDao<EtlTask,Long> implements EtlTaskDao {

}
