package net.iharding.modules.meta.service.impl;

import net.iharding.modules.meta.dao.FavoriteDao;
import net.iharding.modules.meta.model.Favorite;
import net.iharding.modules.meta.service.FavoriteService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: Favorite
* @Description: FavoriteserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class FavoriteServiceImpl extends BaseServiceImpl<Favorite, Long> implements FavoriteService {

	
	@Autowired
	private FavoriteDao favoriteDao;
	
	@Override
	public Favorite getFavorite(User user, Integer objectType, Long objectId) {
		return favoriteDao.getFavorite(user, objectType, objectId);
	}

	@Override
	public long getFavoriteNum(int objectType, Long objectId) {
		return favoriteDao.getFavoriteNum(objectType, objectId);
	}

}
