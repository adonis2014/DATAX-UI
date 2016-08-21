package net.iharding.modules.meta.dao;

import java.util.List;

import net.iharding.modules.meta.model.Owner;

import org.guess.core.orm.EntityDao;
import org.guess.sys.model.User;

/**
* 
* @ClassName: Owner
* @Description: Ownerdao
* @author Joe.zhang
* @date  2016-5-18 14:17:31
*
*/
public interface OwnerDao extends EntityDao<Owner, Long>{
	/**
	 * 获取拥有者
	 * @param user
	 * @param objectType
	 * @param objectId
	 * @return
	 */
	public Owner getOwner(User user,Integer objectType,Long objectId);

	public long getOwnerNum(int objectType, Long id);
	
}
