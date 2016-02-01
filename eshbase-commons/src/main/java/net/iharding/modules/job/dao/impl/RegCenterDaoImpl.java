package net.iharding.modules.job.dao.impl;

import net.iharding.modules.job.dao.RegCenterDao;
import net.iharding.modules.job.model.RegCenter;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: RegCenter
* @Description: RegCenterdaoImpl
* @author Joe.zhang
* @date  2016-1-31 17:15:41
*
*/
@Repository
public class RegCenterDaoImpl extends HibernateDao<RegCenter,Long> implements RegCenterDao {

	@Override
	public void save(RegCenter regCenter) {
		Session session = getSession();
		session.merge(regCenter);
	}
}
