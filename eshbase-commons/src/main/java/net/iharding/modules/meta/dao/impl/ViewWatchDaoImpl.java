package net.iharding.modules.meta.dao.impl;

import java.util.List;

import net.iharding.modules.meta.dao.ViewWatchDao;
import net.iharding.modules.meta.model.ViewWatch;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.sys.model.User;
import org.springframework.stereotype.Repository;

@Repository
public class ViewWatchDaoImpl extends HibernateDao<ViewWatch, Long> implements ViewWatchDao {

	@Override
	public List<ViewWatch> getViewWatchs(User user) {
		return this.findBy("user", user);
	}

	
}
