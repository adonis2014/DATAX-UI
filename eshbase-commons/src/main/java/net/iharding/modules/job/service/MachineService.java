package net.iharding.modules.job.service;

import java.util.List;

import org.guess.core.service.BaseService;

import net.iharding.modules.job.model.Machine;

/**
* 
* @ClassName: Machine
* @Description: Machineservice
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
public interface MachineService extends BaseService<Machine, Long>{

	/**
	 * 根据ip获取机器
	 * 
	 * @param serverIp
	 * @return
	 */
	public Machine get(String serverIp);

	/**
	 * 根据注册中心获取所有终端机器
	 * 
	 * @param id
	 * @return
	 */
	public List<Machine> findByRegCenter(Long id);

}
