package com.github.esadmin.meta.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.github.esadmin.meta.dao.DBTableDao;
import com.github.esadmin.meta.model.DBTable;

/**
 * 
 * @ClassName: DBTable
 * @Description: DBTabledaoImpl
 * @author zhangxuhui
 * @date 2014-8-5 下午02:04:46
 * 
 */
@Repository
public class DBTableDaoImpl extends HibernateDao<DBTable, Long> implements DBTableDao {
	@Override
	public void save(DBTable dbtable) {
		Session session = getSession();
		if (dbtable.getId()==null){
			session.merge(dbtable);
			if (dbtable.getId()==null){
				session.saveOrUpdate(dbtable);
			}else{
				session.update(dbtable);
			}
		}else{
			session.saveOrUpdate(dbtable);
		}
		
	}
	
}
