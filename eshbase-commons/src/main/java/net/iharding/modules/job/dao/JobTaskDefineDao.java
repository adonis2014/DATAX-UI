package net.iharding.modules.job.dao;

import org.guess.core.orm.EntityDao;

import net.iharding.modules.job.model.JobTaskDefine;

/**
* 
* @ClassName: JobTaskDefine
* @Description: JobTaskDefinedao
* @author Joe.zhang
* @date  2016-1-31 17:39:36
*
*/
public interface JobTaskDefineDao extends EntityDao<JobTaskDefine, Long>{

/**
 * 根据机器，jobworker,注册中心获取任务定义
 * @param machineId
 * @param jobWprkerId
 * @param regCenterId
 * @return
 */
	public JobTaskDefine get(Long machineId, Long jobWprkerId, Long regCenterId);
	
}
