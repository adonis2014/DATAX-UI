package net.iharding.modules.meta.service.impl;

import java.util.List;

import net.iharding.modules.meta.dao.ViewOwnerDao;
import net.iharding.modules.meta.model.ViewOwner;
import net.iharding.modules.meta.service.ViewOwnerService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ViewOwnerServiceImpl  extends BaseServiceImpl<ViewOwner, Long> implements ViewOwnerService{

	@Autowired
	private ViewOwnerDao viewOwnerDao;
	
	@Override
	public List<ViewOwner> getViewOwners(User user) {
		return viewOwnerDao.getViewOwners(user);
	}

}
