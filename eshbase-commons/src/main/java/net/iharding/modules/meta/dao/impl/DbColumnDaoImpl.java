package net.iharding.modules.meta.dao.impl;

import net.iharding.modules.meta.dao.DbColumnDao;
import net.iharding.modules.meta.model.DbColumn;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
* 
* @ClassName: DbColumn
* @Description: DbColumndaoImpl
* @author Joe.zhang
* @date  2015-12-3 16:35:17
*
*/
@Repository
public class DbColumnDaoImpl extends HibernateDao<DbColumn,Long> implements DbColumnDao {
	@Override
	@Transactional
	public void save(DbColumn dbcolumn) {
		Session session = getSession();
		session.merge(dbcolumn);
		session.flush();
	}
}
