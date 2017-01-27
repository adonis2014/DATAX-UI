package com.github.esadmin.meta.dao;

import java.util.List;

import com.github.esadmin.meta.model.DataSource;
import com.github.esadmin.meta.model.MetaProperty;

/**
 * 元数据读取接口
 * 
 * @author admin
 *
 */
public interface MetaReverseDao {
	
	/**
	 * 根据ds设置获取该数据源的元数据信息
	 * 
	 * @param ds
	 * @return
	 */
	public DataSource reverseMeta(DataSource datasource, List<MetaProperty> mproes) throws Exception;
}
