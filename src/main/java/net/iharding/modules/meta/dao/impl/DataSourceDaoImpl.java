package net.iharding.modules.meta.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.meta.dao.DataSourceDao;
import net.iharding.modules.meta.model.DataSource;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: DataSource
* @Description: DataSourcedaoImpl
* @author renzp
* @date 2014-8-5 下午02:04:46
*
*/
@Repository
public class DataSourceDaoImpl extends HibernateDao<DataSource,Long> implements DataSourceDao {

}
