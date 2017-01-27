package com.github.esadmin.meta.dao.impl;

import com.github.esadmin.meta.dao.DataSourceDao;
import com.github.esadmin.meta.model.DataSource;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
* 
* @ClassName: DataSource
* @Description: DataSourcedaoImpl
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Repository
public class DataSourceDaoImpl extends HibernateDao<DataSource,Long> implements DataSourceDao {

	@Transactional
	@Override
	public void save(DataSource datasource) {
		Session session = getSession();
		session.merge(datasource);
		session.flush();
	}

	@Override
	public DataSource getDataSource(Integer dbType, String schemaName) {
		Query query = getSession().createQuery("from DataSource where dbType="+dbType+" and schemaName='"+schemaName+"'");
		return (DataSource)query.uniqueResult();
	}
}
