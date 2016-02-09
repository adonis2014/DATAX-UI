package net.iharding.modules.job.dao;

import org.guess.core.orm.EntityDao;

import net.iharding.modules.job.model.Machine;

/**
* 
* @ClassName: Machine
* @Description: Machinedao
* @author Joe.zhang
* @date  2016-1-31 17:00:46
*
*/
public interface MachineDao extends EntityDao<Machine, Long>{

	public Machine get(String serverIp);
	
}
