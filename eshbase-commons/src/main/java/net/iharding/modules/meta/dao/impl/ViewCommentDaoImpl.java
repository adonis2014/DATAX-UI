package net.iharding.modules.meta.dao.impl;

import net.iharding.modules.meta.dao.ViewCommentDao;
import net.iharding.modules.meta.model.ViewComment;

import org.guess.core.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Repository;

@Repository
public class ViewCommentDaoImpl  extends HibernateDao<ViewComment, Long> implements ViewCommentDao{

}
