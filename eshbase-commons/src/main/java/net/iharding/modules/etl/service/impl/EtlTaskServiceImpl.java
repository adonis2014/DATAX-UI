package net.iharding.modules.etl.service.impl;

import java.util.Date;

import net.iharding.modules.etl.dao.EtlTaskDao;
import net.iharding.modules.etl.model.EtlTask;
import net.iharding.modules.etl.service.EtlTaskService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: EtlTask
* @Description: EtlTaskserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class EtlTaskServiceImpl extends BaseServiceImpl<EtlTask, Long> implements EtlTaskService {
	
	@Autowired
	private EtlTaskDao etlTaskDao;
	
	@Override
	public void save(EtlTask etlTask) throws Exception {
		if (etlTask.getId() != null) {
			EtlTask rc = etlTaskDao.get(etlTask.getId());

			// 保留发表者以及发表提起
			etlTask.setCreater(rc.getCreater());
			etlTask.setCreateDate(rc.getCreateDate());
			// 更新者
			User cuser = UserUtil.getCurrentUser();
			etlTask.setUpdater(cuser);
			etlTask.setUpdateDate(new Date());
		} else {
			User cuser = UserUtil.getCurrentUser();
			etlTask.setUpdater(cuser);
			etlTask.setUpdateDate(new Date());
			etlTask.setCreater(cuser);
			etlTask.setCreateDate(new Date());
			etlTask.setCheckLabel(0);
		}
		super.save(etlTask);
	}
}
