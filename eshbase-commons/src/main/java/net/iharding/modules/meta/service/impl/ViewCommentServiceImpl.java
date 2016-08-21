package net.iharding.modules.meta.service.impl;

import java.util.List;

import net.iharding.modules.meta.dao.ViewCommentDao;
import net.iharding.modules.meta.model.ViewComment;
import net.iharding.modules.meta.service.ViewCommentService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ViewCommentServiceImpl  extends BaseServiceImpl<ViewComment, Long> implements ViewCommentService{

	
	@Autowired
	private ViewCommentDao viewCommentDao;
	@Override
	public List<ViewComment> getViewComments(User user) {
		return viewCommentDao.getViewComments(user);
	}

}
