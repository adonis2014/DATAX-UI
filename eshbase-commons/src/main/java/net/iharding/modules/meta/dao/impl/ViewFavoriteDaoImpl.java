package net.iharding.modules.meta.dao.impl;

import net.iharding.modules.meta.dao.ViewFavoriteDao;
import net.iharding.modules.meta.model.ViewFavorite;

import org.guess.core.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Repository;

@Repository
public class ViewFavoriteDaoImpl extends HibernateDao<ViewFavorite, Long> implements ViewFavoriteDao {

}
