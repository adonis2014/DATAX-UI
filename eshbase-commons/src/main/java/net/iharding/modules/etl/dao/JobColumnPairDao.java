package net.iharding.modules.etl.dao;

import java.util.List;

import net.iharding.modules.etl.model.JobColumnPair;

import org.guess.core.orm.EntityDao;

/**
* 
* @ClassName: TaskColumn
* @Description: TaskColumndao
* @author Joe.zhang
* @date  2016-4-3 23:30:55
*
*/
public interface JobColumnPairDao extends EntityDao<JobColumnPair, Long>{
	/**
	 * 获取任务的字段对应数据
	 * @param readTaskId
	 * @return
	 */
	public List<JobColumnPair> getJobColumnPairs(Long readTaskId);
}
