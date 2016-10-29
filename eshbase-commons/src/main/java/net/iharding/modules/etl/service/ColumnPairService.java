package net.iharding.modules.etl.service;

import java.util.List;

import net.iharding.modules.etl.model.JobColumnPair;

import org.guess.core.service.BaseService;

/**
* 
* @ClassName: TaskColumn
* @Description: TaskColumnservice
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
public interface ColumnPairService extends BaseService<JobColumnPair, Long>{
	/**
	 * 获取任务的字段对应数据
	 * @param readTaskId
	 * @return
	 */
	public List<JobColumnPair> getJobColumnPairs(Long readTaskId);
}
