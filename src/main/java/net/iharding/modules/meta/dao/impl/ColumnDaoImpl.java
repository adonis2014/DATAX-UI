package net.iharding.modules.meta.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.meta.dao.ColumnDao;
import net.iharding.modules.meta.model.Column;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: Column
* @Description: ColumndaoImpl
* @author renzp
* @date 2014-8-5 下午02:04:46
*
*/
@Repository
public class ColumnDaoImpl extends HibernateDao<Column,Long> implements ColumnDao {

}
