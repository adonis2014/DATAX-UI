package net.iharding.modules.meta.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.meta.dao.ColumnDao;
import net.iharding.modules.meta.model.Column;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: Column
* @Description: ColumndaoImpl
* @author Joe.zhang
* @date  2015-11-29 23:01:51
*
*/
@Repository
public class ColumnDaoImpl extends HibernateDao<Column,Long> implements ColumnDao {

}
