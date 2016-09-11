package net.iharding.modules.job.dao;

import org.guess.core.orm.EntityDao;

import net.iharding.modules.job.model.RegCenter;

/**
* 
* @ClassName: RegCenter
* @Description: RegCenterdao
* @author Joe.zhang
* @date  2016-1-31 17:15:41
*
*/
public interface RegCenterDao extends EntityDao<RegCenter, Long>{

	public RegCenter getByName(String name);

	public RegCenter get(String zkQuorumPeer, String nameSpace);
	
}
