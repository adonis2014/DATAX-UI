package net.iharding.modules.etl.service;

import java.util.List;

import net.iharding.modules.etl.model.EtlPlugin;
import net.iharding.modules.etl.model.EtlPluginParam;

import org.guess.core.service.BaseService;

/**
 * 
 * @ClassName: EtlPlugin
 * @Description: EtlPluginservice
 * @author Joe.zhang
 * @date 2014-8-5 下午02:04:46
 * 
 */
public interface EtlPluginService extends BaseService<EtlPlugin, Long> {
	
	/**
	 * 获取指定插件的所有参数
	 * 
	 * @return
	 */
	public List<EtlPluginParam> getPluginParams(long pluginId);
}
