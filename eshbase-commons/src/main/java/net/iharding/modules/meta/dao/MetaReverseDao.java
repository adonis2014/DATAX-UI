package net.iharding.modules.meta.dao;

import java.util.List;

import net.iharding.modules.meta.model.Dataset;
import net.iharding.modules.meta.model.DataSource;
import net.iharding.modules.meta.model.Database;
import net.iharding.modules.meta.model.MetaProperty;

import org.guess.sys.model.User;



public interface MetaReverseDao {
	/**
	 * 根据ds设置获取该数据源的元数据信息
	 * 
	 * @param ds
	 * @return
	 */
	public DataSource reverseMeta(DataSource datasource, List<MetaProperty> mproes,User cuser) ;
	
	/**
	 * 反转获取指定数据库元数据
	 * @param datasource
	 * @param mproes
	 * @param cuser
	 * @param dbName
	 * @return
	 * @throws Exception
	 */
	public Database reverseDatabaseMeta(DataSource datasource, List<MetaProperty> mproes,User cuser,String dbName) ;
	/**
	 * 反转获取指定表元数据
	 * @param datasource
	 * @param mproes
	 * @param cuser
	 * @param dbName
	 * @param tableName
	 * @return
	 * @throws Exception
	 */
	public Dataset reverseTableMeta(DataSource datasource, List<MetaProperty> mproes,User cuser,String dbName,String tableName) ;

}
