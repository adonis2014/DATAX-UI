package net.iharding.modules.meta.dao.impl;

import net.iharding.modules.meta.dao.ViewWatchDao;
import net.iharding.modules.meta.model.ViewWatch;

import org.guess.core.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Repository;

@Repository
public class ViewWatchDaoImpl extends HibernateDao<ViewWatch, Long> implements ViewWatchDao {

	
}
