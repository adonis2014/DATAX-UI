package net.iharding.modules.meta.dao;

import java.util.List;

import net.iharding.modules.meta.model.ViewWatch;

import org.guess.core.orm.EntityDao;
import org.guess.sys.model.User;

public interface ViewWatchDao  extends EntityDao<ViewWatch, Long>{

	/**
	 * 获取关注信息列表
	 * @param user
	 * @return
	 */
	public List<ViewWatch> getViewWatchs(User user);
}
