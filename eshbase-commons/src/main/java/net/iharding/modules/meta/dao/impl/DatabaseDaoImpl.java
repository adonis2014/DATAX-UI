package net.iharding.modules.meta.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.meta.dao.DatabaseDao;
import net.iharding.modules.meta.model.Database;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: Database
* @Description: DatabasedaoImpl
* @author Joe.zhang
* @date  2016-5-18 14:08:46
*
*/
@Repository
public class DatabaseDaoImpl extends HibernateDao<Database,Long> implements DatabaseDao {

}
