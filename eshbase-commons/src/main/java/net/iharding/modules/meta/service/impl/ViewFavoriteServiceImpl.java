package net.iharding.modules.meta.service.impl;

import java.util.List;

import net.iharding.modules.meta.dao.ViewFavoriteDao;
import net.iharding.modules.meta.model.ViewFavorite;
import net.iharding.modules.meta.service.ViewFavoriteService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ViewFavoriteServiceImpl  extends BaseServiceImpl<ViewFavorite, Long> implements ViewFavoriteService{

	@Autowired
	private ViewFavoriteDao viewFavoriteDao;
	
	@Override
	public List<ViewFavorite> getViewFavorites(User user) {
		return viewFavoriteDao.getViewFavorites(user);
	}

}
