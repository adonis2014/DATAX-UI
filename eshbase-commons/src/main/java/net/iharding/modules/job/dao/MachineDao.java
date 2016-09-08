package net.iharding.modules.job.dao;

import java.util.List;

import org.guess.core.orm.EntityDao;

import net.iharding.modules.job.model.Machine;

/**
 * 
 * @ClassName: Machine
 * @Description: Machinedao
 * @author Joe.zhang
 * @date 2016-1-31 17:00:46
 * 
 */
public interface MachineDao extends EntityDao<Machine, Long> {
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
