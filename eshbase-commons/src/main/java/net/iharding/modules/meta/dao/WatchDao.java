package net.iharding.modules.meta.dao;

import java.util.List;

import net.iharding.modules.meta.model.Watch;

import org.guess.core.orm.EntityDao;
import org.guess.sys.model.User;

/**
* 
* @ClassName: Watch
* @Description: Watchdao
* @author Joe.zhang
* @date  2016-5-18 14:18:11
*
*/
public interface WatchDao extends EntityDao<Watch, Long>{
	/**
	 * 获取关注信息
	 * @param user
	 * @param objectType
	 * @param objectId
	 * @return
	 */
	public Watch getWatch(User user,Integer objectType,Long objectId);

	public long getWatchNum(int objectType, Long id);
	
	
}
