package net.iharding.modules.meta.service;

import java.util.List;

import org.guess.core.service.BaseService;

import net.iharding.modules.meta.model.DataSource;
import net.iharding.modules.meta.model.DataSourceWrapper;
import net.iharding.modules.meta.model.MetaProperty;

/**
 * 
 * @ClassName: DataSource
 * @Description: DataSourceservice
 * @author zhangxuhui
 * @date 2014-8-5 下午02:04:46
 *
 */
public interface DataSourceService extends BaseService<DataSource, Long> {
	/**
	 * 查询获取数据源信息
	 * 
	 * @param id
	 * @return
	 */
	public DataSourceWrapper getDataSourceWrapper(Long id);

	/**
	 * 保存数据源参数配置信息
	 * 
	 * @param obj
	 * @param properties
	 */
	public void saveSetupParam(DataSource obj, List<MetaProperty> properties);

	/**
	 * 导入数据源元数据
	 * 
	 * @param id
	 * @return
	 */
	public DataSource importMeta(Long id);
	
	public List<MetaProperty> getProperties(Integer dbtype,Long id);

}
