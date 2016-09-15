package net.iharding.modules.job.service;

import net.iharding.modules.job.model.JobExecutionInfo;
import net.iharding.modules.job.model.JobFlow;
import net.iharding.modules.job.model.JobFlowWrapper;

import org.guess.core.orm.Page;
import org.guess.core.service.BaseService;

/**
* 
* @ClassName: JobFlow
* @Description: JobFlowservice
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
public interface JobFlowService extends BaseService<JobFlow, Long>{
	
	public JobFlowWrapper getJobFlowWrapper(long flowId);
/**
 * 设置启动调度工作流程
 * @param id
 * @return
 */
	public JobFlowWrapper CheckJobFlow(Long id);
	/**
	 * 查询
	 * @param page
	 * @param buildFromHttpRequest
	 * @return
	 */
public Page<JobExecutionInfo> findExecutionPage(Page<JobExecutionInfo> page,Long  flowId);

}
