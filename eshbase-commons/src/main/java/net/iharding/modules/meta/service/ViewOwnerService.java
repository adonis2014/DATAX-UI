package net.iharding.modules.meta.service;

import java.util.List;

import net.iharding.modules.meta.model.ViewOwner;

import org.guess.core.service.BaseService;
import org.guess.sys.model.User;

public interface ViewOwnerService  extends BaseService<ViewOwner, Long>{
	/**
	 * 
	 * @param user
	 * @return
	 */
	public List<ViewOwner> getViewOwners(User user);
}
