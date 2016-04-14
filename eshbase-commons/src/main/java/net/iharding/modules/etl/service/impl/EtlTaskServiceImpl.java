package net.iharding.modules.etl.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Set;

import net.iharding.modules.etl.dao.EtlPluginDao;
import net.iharding.modules.etl.dao.EtlTaskDao;
import net.iharding.modules.etl.dao.EtlTaskParamDao;
import net.iharding.modules.etl.model.EtlPluginParam;
import net.iharding.modules.etl.model.EtlTask;
import net.iharding.modules.etl.model.EtlTaskParam;
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
	
	@Autowired
	private EtlPluginDao etlPluginDao;
	
	@Autowired
	private EtlTaskParamDao etlTaskParamDao;
	
	
	@Override
	public void save(EtlTask etlTask) throws Exception {
		if (etlTask.getId() != null) {
			EtlTask rc = etlTaskDao.get(etlTask.getId());
			rc.setCheckLabel(etlTask.getCheckLabel());
			rc.setTaskName(etlTask.getTaskName());
			rc.setRemark(etlTask.getRemark());
			if (etlTask.getPlugin()!=null)rc.setPlugin(etlPluginDao.get(etlTask.getPlugin().getId()));
			// 更新者
			User cuser = UserUtil.getCurrentUser();
			rc.setUpdater(cuser);
			rc.setUpdateDate(new Date());
			super.save(rc);
		} else {
			User cuser = UserUtil.getCurrentUser();
			etlTask.setUpdater(cuser);
			etlTask.setUpdateDate(new Date());
			etlTask.setCreater(cuser);
			etlTask.setCreateDate(new Date());
			etlTask.setCheckLabel(0);
			super.save(etlTask);
		}
	}
	
	private boolean checkHasParam(Set<EtlTaskParam> params,EtlPluginParam param){
		for(EtlTaskParam tparam:params){
			if (tparam.getPluginParamId()==param.getId()){
				return true;
			}
		}
		return false;
	}

	@Override
	public EtlTask generateParams(Long taskId) {
		EtlTask task= etlTaskDao.get(taskId);
		Set<EtlPluginParam> params=task.getPlugin().getPluginParams();
		for(EtlPluginParam param:params){
			if (!checkHasParam(task.getTaskParams(),param)){
				EtlTaskParam tparam=new EtlTaskParam();
				tparam.setParamKey(param.getName());
				tparam.setParamValue(param.getDefaultValue());
				tparam.setPluginParamId(param.getId());
				tparam.setRemark(param.getDescription());
				tparam.setTask(task);
				tparam.setTaskId(task.getId());
				task.getTaskParams().add(tparam);
				etlTaskParamDao.save(tparam);
			}
		}
		etlTaskDao.save(task);
		return task;
	}
}
