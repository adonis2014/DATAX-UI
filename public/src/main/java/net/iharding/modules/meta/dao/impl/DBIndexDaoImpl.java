package net.iharding.modules.meta.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.meta.dao.DBIndexDao;
import net.iharding.modules.meta.model.DBIndex;
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

}
