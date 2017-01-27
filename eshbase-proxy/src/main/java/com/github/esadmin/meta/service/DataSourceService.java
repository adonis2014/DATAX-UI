package com.github.esadmin.meta.service;

import java.util.List;

import org.guess.core.service.BaseService;

import com.github.esadmin.meta.model.DataSource;
import com.github.esadmin.meta.model.DataSourceWrapper;
import com.github.esadmin.meta.model.MetaProperty;

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
	 * 获取包含参数设置的数据源设置
	 * 
	 * @param id
	 * @return
	 */
	public DataSourceWrapper getWrapper(Long id);
	
	
	/**
	 * 更加类型和schema获取数据源配置
	 * @param dbType
	 * @param schemaName
	 * @return
	 */
	public DataSourceWrapper getWrapper(Integer dbType,String schemaName);
	
	/**
	 * 获取导入元数据，并返回数据源和库表结构数据
	 * 
	 * @param id
	 * @return
	 */
	public DataSource monitor(Long id);

	/**
	 * 保存数据源对象和相关参数设置
	 * 
	 * @param obj
	 */
	public void saveSetup(DataSource obj, List<MetaProperty> properties);

	/**
	 * 获取指定数据源的所有参数设置
	 * 
	 * @param id
	 * @return
	 */
	public List<MetaProperty> getProperties(Integer dbtype,Long id);

}
