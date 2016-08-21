package net.iharding.modules.meta.service.impl;

import net.iharding.modules.meta.dao.OwnerDao;
import net.iharding.modules.meta.model.Owner;
import net.iharding.modules.meta.service.OwnerService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: Owner
* @Description: OwnerserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class OwnerServiceImpl extends BaseServiceImpl<Owner, Long> implements OwnerService {

	@Autowired
	private OwnerDao ownerDao;
	
	@Override
	public Owner getOwner(User user, Integer objectType, Long objectId) {
		return ownerDao.getOwner(user, objectType, objectId);
	}

	@Override
	public long getOwnerNum(int objectType, Long id) {
		return ownerDao.getOwnerNum(objectType,id);
	}

}
