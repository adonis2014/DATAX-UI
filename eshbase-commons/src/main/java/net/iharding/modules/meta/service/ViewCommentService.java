package net.iharding.modules.meta.service;

import java.util.List;

import net.iharding.modules.meta.model.ViewComment;

import org.guess.core.service.BaseService;
import org.guess.sys.model.User;

public interface ViewCommentService extends BaseService<ViewComment, Long>{
	/**
	 * 获得注释列表
	 * 
	 * @param user
	 * @return
	 */
	public List<ViewComment> getViewComments(User user);
}
