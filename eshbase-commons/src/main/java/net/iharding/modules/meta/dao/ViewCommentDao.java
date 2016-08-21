package net.iharding.modules.meta.dao;

import java.util.List;

import net.iharding.modules.meta.model.ViewComment;

import org.guess.core.orm.EntityDao;
import org.guess.sys.model.User;

public interface ViewCommentDao extends EntityDao<ViewComment, Long> {
	
	/**
	 * 获得注释列表
	 * 
	 * @param user
	 * @return
	 */
	public List<ViewComment> getViewComments(User user);
}
