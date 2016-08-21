package net.iharding.modules.meta.dao.impl;

import java.util.List;

import net.iharding.modules.meta.dao.ViewOwnerDao;
import net.iharding.modules.meta.model.ViewOwner;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.sys.model.User;
import org.springframework.stereotype.Repository;

@Repository
public class ViewOwnerDaoImpl extends HibernateDao<ViewOwner, Long> implements ViewOwnerDao{

	@Override
	public List<ViewOwner> getViewOwners(User user) {
		return this.findBy("user", user);
	}

}
