package net.iharding.modules.etl.service.impl;

import java.util.Date;

import net.iharding.modules.etl.dao.EtlJobDao;
import net.iharding.modules.etl.dao.EtlTaskDao;
import net.iharding.modules.etl.dao.EtlTaskParamDao;
import net.iharding.modules.etl.dao.JobColumnPairDao;
import net.iharding.modules.etl.model.EtlJob;
import net.iharding.modules.etl.model.EtlTask;
import net.iharding.modules.etl.model.EtlTaskParam;
import net.iharding.modules.etl.model.JobColumnPair;
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
	
	@Autowired
	private EtlTaskDao etlTaskDao;
	
	@Autowired
	private EtlTaskParamDao etlTaskParamDao;
	
	@Autowired
	private JobColumnPairDao columnPairDao;
	
	@Override
	public void save(EtlJob etlJob) throws Exception {
		if (etlJob.getId() != null && etlJob.getId()>0) {
			EtlJob rc = etlJobDao.get(etlJob.getId());
			// 保留发表者以及发表提起
			if (rc!=null){
				etlJob.setCreater(rc.getCreater());
				etlJob.setCreateDate(rc.getCreateDate());
			}
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
			etlJob.setCheckLabel(1);
			etlJob.setStatus(1);
		}
		super.save(etlJob);
		EtlTask readertask=null;
		EtlTask writertask=null;
		//save task
		for(EtlTask task:etlJob.getTasks()){
			task.setJob(etlJob);
			etlTaskDao.save(task);
			if (task.getPlugin().getPluginType()==1){
				readertask=task;
			}else{
				writertask=task;
			}
			for(EtlTaskParam taskParam:task.getTaskParams()){
				taskParam.setTask(task);
				taskParam.setTaskId(task.getId());
				etlTaskParamDao.save(taskParam);
			}
		}
		//save taskColumnPair
		for(JobColumnPair columnPair:etlJob.getColumnPairs()){
			columnPair.setJob(etlJob);
			columnPair.setJobId(etlJob.getId());
			columnPair.setReadtask(readertask);
			columnPair.setReadTaskId(readertask.getId());
			columnPair.setWritetask(writertask);
			columnPair.setWriteTaskId(writertask.getId());
			columnPairDao.save(columnPair);
		}
	}
}
