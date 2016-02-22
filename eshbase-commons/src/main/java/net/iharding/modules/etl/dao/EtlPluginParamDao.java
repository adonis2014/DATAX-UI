package net.iharding.modules.etl.dao;

import java.util.List;

import org.guess.core.orm.EntityDao;

import net.iharding.modules.etl.model.EtlPluginParam;

/**
 * 
 * @ClassName: EtlPluginParam
 * @Description: EtlPluginParamdao
 * @author Joe.zhang
 * @date 2016-1-30 17:35:16
 * 
 */
public interface EtlPluginParamDao extends EntityDao<EtlPluginParam, Long> {
	/**
	 * 获取指定插件的所有参数
	 * 
	 * @param pluginId
	 * @return
	 */
	public List<EtlPluginParam> getPluginParams(long pluginId);

}
