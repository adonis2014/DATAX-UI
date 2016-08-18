package net.iharding.modules.meta.dao.impl;

import net.iharding.modules.meta.dao.ViewOwnerDao;
import net.iharding.modules.meta.model.ViewOwner;

import org.guess.core.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Repository;

@Repository
public class ViewOwnerDaoImpl extends HibernateDao<ViewOwner, Long> implements ViewOwnerDao{

}
