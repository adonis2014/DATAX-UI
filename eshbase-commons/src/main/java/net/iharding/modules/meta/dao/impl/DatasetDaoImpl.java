package net.iharding.modules.meta.dao.impl;

import net.iharding.modules.meta.dao.DatasetDao;
import net.iharding.modules.meta.model.Dataset;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

/**
 * 
 * @ClassName: DBTable
 * @Description: DBTabledaoImpl
 * @author zhangxuhui
 * @date 2014-8-5 下午02:04:46
 * 
 */
@Repository
public class DatasetDaoImpl extends HibernateDao<Dataset, Long> implements DatasetDao {
	
	@Override
	public void save(Dataset dbtable) {
		Session session = getSession();
		session.merge(dbtable);
	}
	
}
