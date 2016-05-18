package net.iharding.modules.meta.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
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

}
