package net.iharding.modules.meta.service.impl;

import java.util.Date;

import net.iharding.modules.meta.dao.DBIndexDao;
import net.iharding.modules.meta.model.DBIndex;
import net.iharding.modules.meta.service.DBIndexService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: DBIndex
* @Description: DBIndexserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class DBIndexServiceImpl extends BaseServiceImpl<DBIndex, Long> implements DBIndexService {

	@Autowired
	private DBIndexDao dbIndexDao; 
	
	@Override
	public void save(DBIndex dbindex) throws Exception {
		if(dbindex.getId() != null){
			DBIndex index = dbIndexDao.get(dbindex.getId());
			//保留发表者以及发表提起
			dbindex.setCreatebyId(index.getCreatebyId());
			dbindex.setCreateDate(index.getCreateDate());
			//更新者
			User cuser = UserUtil.getCurrentUser();
			dbindex.setUpdatebyId(cuser.getId());
			dbindex.setUpdateDate(new Date());
		}else{
			User cuser = UserUtil.getCurrentUser();
			dbindex.setCreatebyId(cuser.getId());
			dbindex.setCreateDate(new Date());
			dbindex.setUpdatebyId(cuser.getId());
			dbindex.setUpdateDate(new Date());
		}
		super.save(dbindex);
	}
	
}
