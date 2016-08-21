package net.iharding.modules.meta.dao.impl;

import java.util.List;

import net.iharding.modules.meta.dao.ViewFavoriteDao;
import net.iharding.modules.meta.model.ViewFavorite;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.sys.model.User;
import org.springframework.stereotype.Repository;

@Repository
public class ViewFavoriteDaoImpl extends HibernateDao<ViewFavorite, Long> implements ViewFavoriteDao {

	@Override
	public List<ViewFavorite> getViewFavorites(User user) {
		return this.findBy("user", user);
	}

}
