package net.iharding.modules.meta.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.meta.dao.DBTableDao;
import net.iharding.modules.meta.model.DBTable;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: DBTable
* @Description: DBTabledaoImpl
* @author renzp
* @date 2014-8-5 下午02:04:46
*
*/
@Repository
public class DBTableDaoImpl extends HibernateDao<DBTable,Long> implements DBTableDao {

}
