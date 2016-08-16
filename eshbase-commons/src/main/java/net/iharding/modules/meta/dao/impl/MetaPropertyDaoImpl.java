package net.iharding.modules.meta.dao.impl;

import java.util.List;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;

import net.iharding.modules.meta.dao.MetaPropertyDao;
import net.iharding.modules.meta.model.MetaProperty;

import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: MetaProperty
* @Description: MetaPropertydaoImpl
* @author Joe.zhang
* @date  2016-5-18 14:20:22
*
*/
@Repository
public class MetaPropertyDaoImpl extends HibernateDao<MetaProperty,Long> implements MetaPropertyDao {

	@Override
	public List<MetaProperty> getProperties(int refType, long refId) {
		return this.find("from MetaProperty where refType=? and refId=? order by group,sortId ", refType,refId);
	}

	@Override
	public void save(MetaProperty datasource) {
		Session session = getSession();
		session.merge(datasource);
		session.flush();
	}
}
