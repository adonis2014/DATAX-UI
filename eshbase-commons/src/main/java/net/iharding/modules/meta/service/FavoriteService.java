package net.iharding.modules.meta.service;

import org.guess.core.service.BaseService;
import org.guess.sys.model.User;

import net.iharding.modules.meta.model.Favorite;

/**
* 
* @ClassName: Favorite
* @Description: Favoriteservice
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
public interface FavoriteService extends BaseService<Favorite, Long>{
	/**
	 * 获取收藏信息
	 * @param user
	 * @param objectType
	 * @param objectId
	 * @return
	 */
	public Favorite getFavorite(User user,Integer objectType,Long objectId);

	public long getFavoriteNum(int objectTypeDatabase, Long id);
}
