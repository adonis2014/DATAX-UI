package net.iharding.modules.job.service.impl;

import java.util.Date;
import java.util.List;

import net.iharding.DictConstants;
import net.iharding.modules.job.dao.JobFlowDao;
import net.iharding.modules.job.model.JobFlow;
import net.iharding.modules.job.model.JobFlowWrapper;
import net.iharding.modules.job.service.JobFlowService;
import net.iharding.modules.meta.dao.MetaPropertyDao;
import net.iharding.modules.meta.model.MetaProperty;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: JobFlow
* @Description: JobFlowserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class JobFlowServiceImpl extends BaseServiceImpl<JobFlow, Long> implements JobFlowService {
	@Autowired
	private MetaPropertyDao metaPropertyDao;
	
	@Autowired
	private JobFlowDao jobFlowDao;
	
	public void save(JobFlow jobFlow) throws Exception {
		if(jobFlow.getId() != null){
			JobFlow oriJobFlow = jobFlowDao.get(jobFlow.getId());
			//保留发表者以及发表提起
			jobFlow.setCreater(oriJobFlow.getCreater());
			jobFlow.setCreateDate(oriJobFlow.getCreateDate());
			jobFlow.setCheckLabel(oriJobFlow.getCheckLabel());
			//更新者
			User cuser = UserUtil.getCurrentUser();
			jobFlow.setUpdater(cuser);
			jobFlow.setUpdateDate(new Date());
		}else{
			User cuser = UserUtil.getCurrentUser();
			jobFlow.setCreater(cuser);
			jobFlow.setCreateDate(new Date());
			jobFlow.setUpdater(cuser);
			jobFlow.setUpdateDate(new Date());
			jobFlow.setCheckLabel(1);
		}
		super.save(jobFlow);
	}
	
	@Override
	public JobFlowWrapper getJobFlowWrapper(long flowId) {
		JobFlowWrapper flowrapper=new JobFlowWrapper();
		try {
			JobFlow flow=this.get(flowId);
			List<MetaProperty> properties=metaPropertyDao.getProperties(DictConstants.DICT_OBJECT_TYPE_JOBFLOW,flowId);
			flowrapper.addProperties(properties);
			flowrapper.setJobFlow(flow);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flowrapper;
	}

}
