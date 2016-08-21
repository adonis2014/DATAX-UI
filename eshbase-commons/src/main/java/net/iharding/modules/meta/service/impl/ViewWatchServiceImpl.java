package net.iharding.modules.meta.service.impl;

import java.util.List;

import net.iharding.modules.meta.dao.ViewWatchDao;
import net.iharding.modules.meta.model.ViewWatch;
import net.iharding.modules.meta.service.ViewWatchService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ViewWatchServiceImpl extends BaseServiceImpl<ViewWatch, Long> implements ViewWatchService{

	@Autowired
	private ViewWatchDao viewWatchDao;
	
	@Override
	public List<ViewWatch> getViewWatchs(User user) {
		return viewWatchDao.getViewWatchs(user);
	}

}
