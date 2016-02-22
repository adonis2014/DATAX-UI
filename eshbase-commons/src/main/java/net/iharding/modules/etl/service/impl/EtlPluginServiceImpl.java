package net.iharding.modules.etl.service.impl;

import java.util.List;

import org.guess.core.service.BaseServiceImpl;

import net.iharding.modules.etl.dao.EtlPluginParamDao;
import net.iharding.modules.etl.model.EtlPlugin;
import net.iharding.modules.etl.model.EtlPluginParam;
import net.iharding.modules.etl.service.EtlPluginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: EtlPlugin
* @Description: EtlPluginserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class EtlPluginServiceImpl extends BaseServiceImpl<EtlPlugin, Long> implements EtlPluginService {
	
	@Autowired
	private EtlPluginParamDao pluginParamDao;



	@Override
	public List<EtlPluginParam> getPluginParams(long pluginId) {
		return pluginParamDao.getPluginParams(pluginId);
	}
	
	
}
