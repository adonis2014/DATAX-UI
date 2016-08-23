package net.iharding.modules.job.service;

import java.util.List;

import net.iharding.modules.job.model.JobTaskDefine;
import net.iharding.modules.job.model.JobWorker;
import net.iharding.modules.job.model.Machine;
import net.iharding.modules.job.model.RegCenter;

import org.guess.core.service.BaseService;


/**
 * 
 * @ClassName: RegCenter
 * @Description: RegCenterservice
 * @author Joe.zhang
 * @date 2014-8-5 下午02:04:46
 * 
 */
public interface RegCenterService extends BaseService<RegCenter, Long> {

	

	public List<Machine> getMachines(Long id);

	public List<JobWorker> getJobWorkers(Long id);

	public List<JobTaskDefine> getJobTaskDefines(Long id);

}
