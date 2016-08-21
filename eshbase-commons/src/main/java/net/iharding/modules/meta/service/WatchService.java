package net.iharding.modules.meta.service;

import org.guess.core.service.BaseService;
import org.guess.sys.model.User;

import net.iharding.modules.meta.model.Watch;

/**
* 
* @ClassName: Watch
* @Description: Watchservice
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
public interface WatchService extends BaseService<Watch, Long>{
	/**
	 * 获取关注信息
	 * @param user
	 * @param objectType
	 * @param objectId
	 * @return
	 */
	public Watch getWatch(User user,Integer objectType,Long objectId);

	public long getWatchNum(int objectTypeDatabase, Long id);
}
