package net.iharding.modules.job.jobtype;

import org.springframework.stereotype.Component;

/**
 * 执行多个datax任务组成的流程job
 * 
 * @author Joe.zhang
 *
 */
@Component("DataxFlowTask")
public class DataxFlowTask  extends AbstractTask{
	
	/**
	 * 执行多个datax任务的etl 流程
	 */
	public String execute(String flowId) {
		return flowId;

	}

}
