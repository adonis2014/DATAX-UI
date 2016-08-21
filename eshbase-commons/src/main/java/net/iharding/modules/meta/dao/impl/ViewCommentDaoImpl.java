package net.iharding.modules.meta.dao.impl;

import java.util.List;

import net.iharding.modules.meta.dao.ViewCommentDao;
import net.iharding.modules.meta.model.ViewComment;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.sys.model.User;
import org.springframework.stereotype.Repository;

@Repository
public class ViewCommentDaoImpl  extends HibernateDao<ViewComment, Long> implements ViewCommentDao{

	@Override
	public List<ViewComment> getViewComments(User user) {
		return this.findBy("user", user);
	}

}
