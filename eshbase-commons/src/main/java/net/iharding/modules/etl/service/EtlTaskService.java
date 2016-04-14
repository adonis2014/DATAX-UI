package net.iharding.modules.etl.service;

import org.guess.core.service.BaseService;

import net.iharding.modules.etl.model.EtlTask;

/**
 * 
 * @ClassName: EtlTask
 * @Description: EtlTaskservice
 * @author Joe.zhang
 * @date 2014-8-5 下午02:04:46
 *
 */
public interface EtlTaskService extends BaseService<EtlTask, Long> {
	/**
	 * 根据任务选择的taskId自动生成参数列表
	 * 
	 * @param taskId
	 * @return
	 */
	public EtlTask generateParams(Long taskId);

}
