package net.iharding.modules.job.dao;

import java.util.List;

import net.iharding.modules.job.model.JobWorker;

import org.guess.core.orm.EntityDao;

/**
* 
* @ClassName: JobWorker
* @Description: JobWorkerdao
* @author Joe.zhang
* @date  2016-1-31 17:34:42
*
*/
public interface JobWorkerDao extends EntityDao<JobWorker, Long>{

	public JobWorker get(String jobName);

	public List<JobWorker> findByRegCenter(Long regId);
	
	public void update(JobWorker worker);
	/**
	 * 保存并放回JobWorker对象
	 * @param worker
	 * @return
	 */
	public JobWorker saveOrUpdate(JobWorker worker);
/**
 * 根据stringkey获取worker
 * @param jobClassName
 * @param methodName
 * @param jobParameter
 * @return
 */
	public JobWorker getByKey(String jobClassName, String methodName, String jobParameter);
}
