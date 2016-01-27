package net.iharding.modules.meta.service.impl;

import java.util.Date;

import net.iharding.modules.meta.dao.DataSourceDao;
import net.iharding.modules.meta.model.DataSource;
import net.iharding.modules.meta.service.DataSourceService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: DataSource
* @Description: DataSourceserviceImpl
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class DataSourceServiceImpl extends BaseServiceImpl<DataSource, Long> implements DataSourceService {

	
	@Autowired
	private DataSourceDao dataSourceDao;
	
	public void save(DataSource datasource) throws Exception {
		if(datasource.getId() != null){
			
			DataSource oriDatasource = dataSourceDao.get(datasource.getId());
			
			//保留发表者以及发表提起
			datasource.setCreater(oriDatasource.getCreater());
			datasource.setCreateDate(oriDatasource.getCreateDate());
			//更新者
			User cuser = UserUtil.getCurrentUser();
			datasource.setUpdater(cuser);
			datasource.setUpdateDate(new Date());
		}else{
			User cuser = UserUtil.getCurrentUser();
			datasource.setCreater(cuser);
			datasource.setCreateDate(new Date());
			datasource.setUpdater(cuser);
			datasource.setUpdateDate(new Date());
		}
		super.save(datasource);
	}
}
