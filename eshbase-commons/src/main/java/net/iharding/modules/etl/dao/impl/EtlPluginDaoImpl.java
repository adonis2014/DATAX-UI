package net.iharding.modules.etl.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.etl.dao.EtlPluginDao;
import net.iharding.modules.etl.model.EtlPlugin;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: EtlPlugin
* @Description: EtlPlugindaoImpl
* @author Joe.zhang
* @date  2016-1-29 22:25:15
*
*/
@Repository
public class EtlPluginDaoImpl extends HibernateDao<EtlPlugin,Long> implements EtlPluginDao {

}
