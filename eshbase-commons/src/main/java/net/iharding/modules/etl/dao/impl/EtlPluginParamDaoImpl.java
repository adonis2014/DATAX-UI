package net.iharding.modules.etl.dao.impl;

import java.util.List;

import org.guess.core.orm.hibernate.HibernateDao;

import net.iharding.modules.etl.dao.EtlPluginParamDao;
import net.iharding.modules.etl.model.EtlPluginParam;

import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: EtlPluginParam
* @Description: EtlPluginParamdaoImpl
* @author Joe.zhang
* @date  2016-1-30 17:35:16
*
*/
@Repository
public class EtlPluginParamDaoImpl extends HibernateDao<EtlPluginParam,Long> implements EtlPluginParamDao {

	@Override
	public List<EtlPluginParam> getPluginParams(long pluginId) {
		return this.findBy("plugin",pluginId);
	}

}
