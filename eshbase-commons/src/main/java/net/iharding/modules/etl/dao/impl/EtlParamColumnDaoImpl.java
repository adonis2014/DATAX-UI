package net.iharding.modules.etl.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.etl.dao.EtlParamColumnDao;
import net.iharding.modules.etl.model.EtlParamColumn;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: EtlParamColumn
* @Description: EtlParamColumndaoImpl
* @author Joe.zhang
* @date  2016-1-30 17:29:38
*
*/
@Repository
public class EtlParamColumnDaoImpl extends HibernateDao<EtlParamColumn,Long> implements EtlParamColumnDao {

}
