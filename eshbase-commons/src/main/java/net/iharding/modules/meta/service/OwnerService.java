package net.iharding.modules.meta.service;

import org.guess.core.service.BaseService;
import org.guess.sys.model.User;

import net.iharding.modules.meta.model.Owner;

/**
* 
* @ClassName: Owner
* @Description: Ownerservice
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
public interface OwnerService extends BaseService<Owner, Long>{
	/**
	 * 获取拥有者
	 * @param user
	 * @param objectType
	 * @param objectId
	 * @return
	 */
	public Owner getOwner(User user,Integer objectType,Long objectId);

	public long getOwnerNum(int objectTypeDatabase, Long id);
}
