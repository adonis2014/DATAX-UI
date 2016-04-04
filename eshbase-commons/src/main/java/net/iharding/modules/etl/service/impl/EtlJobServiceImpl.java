package net.iharding.modules.etl.service.impl;

import java.util.Date;

import net.iharding.modules.etl.dao.EtlJobDao;
import net.iharding.modules.etl.model.EtlJob;
import net.iharding.modules.etl.service.EtlJobService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: EtlJob
* @Description: EtlJobserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class EtlJobServiceImpl extends BaseServiceImpl<EtlJob, Long> implements EtlJobService {
	
	@Autowired
	private EtlJobDao etlJobDao;
	
	@Override
	public void save(EtlJob etlJob) throws Exception {
		if (etlJob.getId() != null) {
			EtlJob rc = etlJobDao.get(etlJob.getId());

			// 保留发表者以及发表提起
			etlJob.setCreater(rc.getCreater());
			etlJob.setCreateDate(rc.getCreateDate());
			// 更新者
			User cuser = UserUtil.getCurrentUser();
			etlJob.setUpdater(cuser);
			etlJob.setUpdateDate(new Date());
		} else {
			User cuser = UserUtil.getCurrentUser();
			etlJob.setUpdater(cuser);
			etlJob.setUpdateDate(new Date());
			etlJob.setCreater(cuser);
			etlJob.setCreateDate(new Date());
			etlJob.setCheckLabel(0);
			etlJob.setStatus(0);
		}
		super.save(etlJob);
	}
}
