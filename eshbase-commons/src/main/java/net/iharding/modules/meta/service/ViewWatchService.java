package net.iharding.modules.meta.service;

import java.util.List;

import net.iharding.modules.meta.model.ViewWatch;

import org.guess.core.service.BaseService;
import org.guess.sys.model.User;

public interface ViewWatchService  extends BaseService<ViewWatch, Long>{
	/**
	 * 获取关注信息列表
	 * @param user
	 * @return
	 */
	public List<ViewWatch> getViewWatchs(User user);
}
