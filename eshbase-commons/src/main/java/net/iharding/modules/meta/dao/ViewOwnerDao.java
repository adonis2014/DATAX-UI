package net.iharding.modules.meta.dao;

import java.util.List;

import net.iharding.modules.meta.model.ViewOwner;

import org.guess.core.orm.EntityDao;
import org.guess.sys.model.User;

public interface ViewOwnerDao  extends EntityDao<ViewOwner, Long>{

	/**
	 * 
	 * @param user
	 * @return
	 */
	public List<ViewOwner> getViewOwners(User user);
}
