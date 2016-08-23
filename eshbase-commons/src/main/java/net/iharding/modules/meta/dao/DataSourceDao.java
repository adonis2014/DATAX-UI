package net.iharding.modules.meta.dao;

import java.util.List;

import net.iharding.modules.meta.model.DataSource;

import org.guess.core.orm.EntityDao;

/**
* 
* @ClassName: DataSource
* @Description: DataSourcedao
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
public interface DataSourceDao extends EntityDao<DataSource, Long>{
	/**
	 * 获取数据源
	 * @return
	 */
	public List<DataSource> getCDataSources();
}
