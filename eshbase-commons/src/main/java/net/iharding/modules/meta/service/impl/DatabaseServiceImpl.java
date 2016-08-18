package net.iharding.modules.meta.service.impl;

import java.util.Date;

import net.iharding.modules.meta.dao.DatabaseDao;
import net.iharding.modules.meta.model.Database;
import net.iharding.modules.meta.service.DatabaseService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: Database
* @Description: DatabaseserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class DatabaseServiceImpl extends BaseServiceImpl<Database, Long> implements DatabaseService {
	
	@Autowired
	private DatabaseDao databaseDao;
	
	@Override
	public void save(Database database) throws Exception {
		if (database.getId() != null) {
			Database oriDatabase = databaseDao.get(database.getId());
			// 保留发表者以及发表提起
			database.setCreater(oriDatabase.getCreater());
			database.setCreateDate(oriDatabase.getCreateDate());
			database.setCheckLabel(oriDatabase.getCheckLabel());
			database.setDatasource(oriDatabase.getDatasource());
			// 更新者
			User cuser = UserUtil.getCurrentUser();
			database.setUpdater(cuser);
			database.setUpdateDate(new Date());
		} else {
			User cuser = UserUtil.getCurrentUser();
			database.setUpdater(cuser);
			database.setCheckLabel(1);
			database.setUpdateDate(new Date());
		}
		super.save(database);
	}
}
