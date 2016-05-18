package net.iharding.modules.meta.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.meta.dao.FavoriteDao;
import net.iharding.modules.meta.model.Favorite;
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

}
