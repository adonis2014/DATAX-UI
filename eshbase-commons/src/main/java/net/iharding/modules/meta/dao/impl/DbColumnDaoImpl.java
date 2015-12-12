package net.iharding.modules.meta.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.meta.dao.DbColumnDao;
import net.iharding.modules.meta.model.DbColumn;
import org.springframework.stereotype.Repository;

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

}
