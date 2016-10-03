package net.iharding.modules.meta.service.impl;

import java.util.Date;

import net.iharding.modules.meta.dao.DatasetDao;
import net.iharding.modules.meta.model.Dataset;
import net.iharding.modules.meta.service.DatasetService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: DBTable
* @Description: DBTableserviceImpl
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class DatasetServiceImpl extends BaseServiceImpl<Dataset, Long> implements DatasetService {
	
	@Autowired
	private DatasetDao dbTableDao; 
	
	@Override
	public void save(Dataset dbtable) throws Exception {
		if(dbtable.getId() != null){
			Dataset table = dbTableDao.get(dbtable.getId());
			//保留发表者以及发表提起
			dbtable.setCreater(table.getCreater());
			dbtable.setCreateDate(table.getCreateDate());
			//更新者
			User cuser = UserUtil.getCurrentUser();
			dbtable.setUpdater(cuser);
			dbtable.setUpdateDate(new Date());
		}else{
			User cuser = UserUtil.getCurrentUser();
			dbtable.setCreater(cuser);
			dbtable.setCreateDate(new Date());
			dbtable.setUpdater(cuser);
			dbtable.setUpdateDate(new Date());
		}
		super.save(dbtable);
	}
}
