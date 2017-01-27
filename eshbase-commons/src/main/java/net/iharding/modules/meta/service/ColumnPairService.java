package net.iharding.modules.meta.service;

import java.util.List;

import net.iharding.modules.meta.model.ColumnPair;

import org.guess.core.service.BaseService;

/**
* 
* @ClassName: ColumnPair
* @Description: ColumnPairService
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
public interface ColumnPairService extends BaseService<ColumnPair, Long>{
	/**
	 * 获取任务的字段对应数据
	 * @param readTaskId
	 * @return
	 */
	public List<ColumnPair> getJobColumnPairs(Long readTaskId);
}
