package net.iharding.modules.job.service;

import java.util.List;

import net.iharding.modules.job.model.JobTaskDefine;
import net.iharding.modules.job.model.JobWorker;
import net.iharding.modules.job.model.Machine;
import net.iharding.modules.job.model.RegCenter;

import org.guess.core.service.BaseService;

import com.dangdang.ddframe.job.console.domain.RegistryCenterClient;

/**
 * 
 * @ClassName: RegCenter
 * @Description: RegCenterservice
 * @author Joe.zhang
 * @date 2014-8-5 下午02:04:46
 * 
 */
public interface RegCenterService extends BaseService<RegCenter, Long> {

	/**
	 * 连接注册中心，更新作业终端和作业任务状态信息
	 * 
	 * @param name
	 * @return
	 */
	public RegistryCenterClient connect(String name);

	/**
	 * 连接注册中心，更新作业终端和作业任务状态信息
	 * 
	 * @param rc
	 * @return
	 */
	public RegistryCenterClient connect(RegCenter rc);

	/**
	 * 连接注册中心，更新作业终端和作业任务状态信息
	 * 
	 * @param id
	 * @return
	 */
	public RegistryCenterClient connect(Long id);

	public List<Machine> getMachines(Long id);

	public List<JobWorker> getJobWorkers(Long id);

	public List<JobTaskDefine> getJobTaskDefines(Long id);

}
