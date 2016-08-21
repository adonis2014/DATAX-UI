package net.iharding.modules.meta.dao;

import java.util.List;

import net.iharding.modules.meta.model.ViewFavorite;

import org.guess.core.orm.EntityDao;
import org.guess.sys.model.User;

public interface ViewFavoriteDao  extends EntityDao<ViewFavorite, Long>{

	/**
	 * 获取指定用户的收藏夹信息
	 * @param user
	 * @return
	 */
	public List<ViewFavorite> getViewFavorites(User user);
}
