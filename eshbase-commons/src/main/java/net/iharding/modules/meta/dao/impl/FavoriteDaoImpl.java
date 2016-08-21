package net.iharding.modules.meta.dao.impl;

import net.iharding.modules.meta.dao.FavoriteDao;
import net.iharding.modules.meta.model.Favorite;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.sys.model.User;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: Favorite
* @Description: FavoritedaoImpl
* @author Joe.zhang
* @date  2016-5-18 14:16:48
*
*/
@Repository
public class FavoriteDaoImpl extends HibernateDao<Favorite,Long> implements FavoriteDao {

	@Override
	public Favorite getFavorite(User user, Integer objectType, Long objectId) {
		return this.findUnique(" from Favorite where user=? and objectType=? and objectId=? ", user,objectType,objectId);
	}

	@Override
	public long getFavoriteNum(int objectType, Long objectId) {
		return this.countHqlResult("select count(1) from Favorite where objectType=? and objectId=? ", objectType,objectId);
	}

}
