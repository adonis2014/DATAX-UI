package com.github.esadmin.meta.dao;

import org.guess.core.orm.EntityDao;

import com.github.esadmin.meta.model.DataSource;

/**
 * 
 * @ClassName: DataSource
 * @Description: DataSourcedao
 * @author zhangxuhui
 * @date 2014-8-5 下午02:04:46
 *
 */
public interface DataSourceDao extends EntityDao<DataSource, Long> {
	
	/**
	 * 更加类型和schema获取数据源配置
	 * @param dbType
	 * @param schemaName
	 * @return
	 */
	public DataSource getDataSource(Integer dbType,String schemaName);

}
