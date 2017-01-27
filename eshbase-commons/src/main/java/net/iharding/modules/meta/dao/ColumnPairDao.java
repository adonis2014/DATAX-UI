package net.iharding.modules.meta.dao;

import java.util.List;

import net.iharding.modules.meta.model.ColumnPair;

import org.guess.core.orm.EntityDao;

/**
* 
* @ClassName: TaskColumn
* @Description: TaskColumndao
* @author Joe.zhang
* @date  2016-4-3 23:30:55
*
*/
public interface ColumnPairDao extends EntityDao<ColumnPair, Long>{
	/**
	 * 获取任务的字段对应数据
	 * @param readTaskId
	 * @return
	 */
	public List<ColumnPair> getJobColumnPairs(Long readTaskId);
}
