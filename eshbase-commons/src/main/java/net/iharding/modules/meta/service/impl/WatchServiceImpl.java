package net.iharding.modules.meta.service.impl;

import net.iharding.modules.meta.dao.WatchDao;
import net.iharding.modules.meta.model.Watch;
import net.iharding.modules.meta.service.WatchService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: Watch
* @Description: WatchserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class WatchServiceImpl extends BaseServiceImpl<Watch, Long> implements WatchService {

	@Autowired
	private WatchDao watchDao;
	
	@Override
	public Watch getWatch(User user, Integer objectType, Long objectId) {
		return watchDao.getWatch(user, objectType, objectId);
	}

	@Override
	public long getWatchNum(int objectType, Long id) {
		return watchDao.getWatchNum(objectType,id);
	}

}
