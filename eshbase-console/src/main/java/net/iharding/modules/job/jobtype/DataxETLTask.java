package net.iharding.modules.job.jobtype;

import org.springframework.stereotype.Component;

/**
 * 执行单个datax engine任务
 * 
 * @author Joe.zhang
 *
 */
@Component("DataxETLTask")
public class DataxETLTask  extends AbstractTask{
	
	/**
	 * 执行 datax etl job
	 * 
	 * @param jobId
	 */
	public String execute(String jobId) {
		return jobId;
	}

}
