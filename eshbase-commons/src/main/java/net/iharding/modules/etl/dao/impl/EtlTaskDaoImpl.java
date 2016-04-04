package net.iharding.modules.etl.dao.impl;

import net.iharding.modules.etl.dao.EtlTaskDao;
import net.iharding.modules.etl.model.EtlTask;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;
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
	@Override
	public void save(EtlTask etlTask) {
		Session session = getSession();
		session.merge(etlTask);
	}
}
