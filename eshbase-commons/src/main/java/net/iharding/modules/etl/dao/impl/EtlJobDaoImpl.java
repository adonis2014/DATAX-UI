package net.iharding.modules.etl.dao.impl;

import net.iharding.modules.etl.dao.EtlJobDao;
import net.iharding.modules.etl.model.EtlJob;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: EtlJob
* @Description: EtlJobdaoImpl
* @author Joe.zhang
* @date  2016-1-30 12:11:47
*
*/
@Repository
public class EtlJobDaoImpl extends HibernateDao<EtlJob,Long> implements EtlJobDao {

	@Override
	public void save(EtlJob etljob) {
		Session session = getSession();
		if (etljob.getId()==null || etljob.getId()==0){
			session.save(etljob);
		}else{
			session.merge(etljob);
		}
	}

	@Override
	public void saveOrUpdate(EtlJob etljob) {
		Session session = getSession();
		session.saveOrUpdate(etljob);
		session.flush();
	}
	
}
