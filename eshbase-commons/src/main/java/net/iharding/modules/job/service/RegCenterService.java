package net.iharding.modules.job.service;

import org.guess.core.service.BaseService;

import com.dangdang.ddframe.job.console.domain.RegistryCenterClient;

import net.iharding.modules.job.model.RegCenter;

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
	RegistryCenterClient connect(String name);

	/**
	 * 连接注册中心，更新作业终端和作业任务状态信息
	 * 
	 * @param rc
	 * @return
	 */
	RegistryCenterClient connect(RegCenter rc);

	/**
	 * 连接注册中心，更新作业终端和作业任务状态信息
	 * 
	 * @param id
	 * @return
	 */
	RegistryCenterClient connect(Long id);

}
