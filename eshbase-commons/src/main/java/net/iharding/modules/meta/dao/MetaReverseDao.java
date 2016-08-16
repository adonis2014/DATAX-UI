package net.iharding.modules.meta.dao;

import java.util.List;

import net.iharding.modules.meta.model.DataSource;
import net.iharding.modules.meta.model.MetaProperty;



public interface MetaReverseDao {
	/**
	 * 根据ds设置获取该数据源的元数据信息
	 * 
	 * @param ds
	 * @return
	 */
	public DataSource reverseMeta(DataSource datasource, List<MetaProperty> mproes) throws Exception;

}
