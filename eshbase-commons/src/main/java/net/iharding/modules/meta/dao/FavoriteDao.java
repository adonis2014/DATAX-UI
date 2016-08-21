package net.iharding.modules.meta.dao;

import net.iharding.modules.meta.model.Favorite;

import org.guess.core.orm.EntityDao;
import org.guess.sys.model.User;

/**
* 
* @ClassName: Favorite
* @Description: Favoritedao
* @author Joe.zhang
* @date  2016-5-18 14:16:48
*
*/
public interface FavoriteDao extends EntityDao<Favorite, Long>{
	/**
	 * 获取收藏信息
	 * @param user
	 * @param objectType
	 * @param objectId
	 * @return
	 */
	public Favorite getFavorite(User user,Integer objectType,Long objectId);

	public long getFavoriteNum(int objectType, Long objectId);
 
}
