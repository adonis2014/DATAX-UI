package com.github.esadmin.meta.dao.impl;

import com.github.esadmin.meta.dao.DBIndexDao;
import com.github.esadmin.meta.model.DBIndex;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: DBIndex
* @Description: DBIndexdaoImpl
* @author Joe.zhang
* @date  2015-12-8 12:00:37
*
*/
@Repository
public class DBIndexDaoImpl extends HibernateDao<DBIndex,Long> implements DBIndexDao {

	@Override
	public void save(DBIndex dbindex) {
		Session session = getSession();
		session.merge(dbindex);
	}
	
}
