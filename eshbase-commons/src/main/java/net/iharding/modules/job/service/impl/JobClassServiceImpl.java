package net.iharding.modules.job.service.impl;

import java.util.Date;

import net.iharding.modules.job.dao.JobClassDao;
import net.iharding.modules.job.model.JobClass;
import net.iharding.modules.job.service.JobClassService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: JobClass
* @Description: JobClassserviceImpl
* @author Joe.zhang
* @date 2016-8-5 下午02:04:46
*
*/
@Service
public class JobClassServiceImpl extends BaseServiceImpl<JobClass, Long> implements JobClassService {

	@Autowired
	private JobClassDao jobClassDao;
	
	@Override
	public void save(JobClass regCenter) throws Exception {
		if(regCenter.getId() != null){
			JobClass rc = jobClassDao.get(regCenter.getId());
			
			//保留发表者以及发表提起
			regCenter.setCreater(rc.getCreater());
			regCenter.setCreateDate(rc.getCreateDate());
			//更新者
			User cuser = UserUtil.getCurrentUser();
			regCenter.setUpdater(cuser);
			regCenter.setUpdateDate(new Date());
		}else{
			User cuser = UserUtil.getCurrentUser();
			regCenter.setCreater(cuser);
			regCenter.setCreateDate(new Date());
			regCenter.setCheckLabel(0);
			regCenter.setUpdater(cuser);
			regCenter.setUpdateDate(new Date());
		}
		super.save(regCenter);
	}
	
}
