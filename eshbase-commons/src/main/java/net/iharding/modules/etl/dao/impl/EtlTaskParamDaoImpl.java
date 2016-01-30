package net.iharding.modules.etl.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.etl.dao.EtlTaskParamDao;
import net.iharding.modules.etl.model.EtlTaskParam;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: EtlTaskParam
* @Description: EtlTaskParamdaoImpl
* @author Joe.zhang
* @date  2016-1-30 17:38:18
*
*/
@Repository
public class EtlTaskParamDaoImpl extends HibernateDao<EtlTaskParam,Long> implements EtlTaskParamDao {

}
