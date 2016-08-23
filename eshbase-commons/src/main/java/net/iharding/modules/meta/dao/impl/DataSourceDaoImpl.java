package net.iharding.modules.meta.dao.impl;

import java.util.List;

import net.iharding.modules.meta.dao.DataSourceDao;
import net.iharding.modules.meta.model.DataSource;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

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

	
	@Override
	public void save(DataSource datasource) {
		Session session = getSession();
		session.merge(datasource);
	}

	@Override
	public List<DataSource> getCDataSources() {
		return this.findBy("checkLabel", 1);
	}
}
