package net.iharding.modules.etl.service;

import java.util.List;

import org.guess.core.service.BaseService;

import net.iharding.modules.etl.model.TaskColumn;

/**
* 
* @ClassName: TaskColumn
* @Description: TaskColumnservice
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
public interface TaskColumnService extends BaseService<TaskColumn, Long>{
	/**
	 * 获取任务的字段对应数据
	 * @param readTaskId
	 * @return
	 */
	public List<TaskColumn> getTaskColumns(Long readTaskId);
}
