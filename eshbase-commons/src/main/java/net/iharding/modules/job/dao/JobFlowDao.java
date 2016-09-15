package net.iharding.modules.job.dao;

import org.guess.core.orm.EntityDao;
import org.guess.core.orm.Page;

import net.iharding.modules.job.model.JobExecutionInfo;
import net.iharding.modules.job.model.JobFlow;

/**
* 
* @ClassName: JobFlow
* @Description: JobFlowdao
* @author Joe.zhang
* @date  2016-5-19 23:56:47
*
*/
public interface JobFlowDao extends EntityDao<JobFlow, Long>{

	public Page<JobExecutionInfo> findExecutionPage(Page<JobExecutionInfo> page, Long flowId);
	
}
