package net.iharding.modules.etl.service.impl;

import java.util.Date;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;

import net.iharding.modules.etl.dao.EtlPluginParamDao;
import net.iharding.modules.etl.model.EtlPluginParam;
import net.iharding.modules.etl.service.EtlPluginParamService;
import net.iharding.modules.meta.dao.DBTableDao;
import net.iharding.modules.meta.model.DBTable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: EtlPluginParam
* @Description: EtlPluginParamserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class EtlPluginParamServiceImpl extends BaseServiceImpl<EtlPluginParam, Long> implements EtlPluginParamService {
	
	@Autowired
	private EtlPluginParamDao etlPluginParamDao; 
	
	@Override
	public void save(EtlPluginParam param) throws Exception {
//		if(param.getId() != null){
//			
//			EtlPluginParam pluginParam = etlPluginParamDao.get(param.getId());
//			
//			//保留发表者以及发表提起
//			param.setCreatebyId(pluginParam.getCreatebyId());
//			param.setCreateDate(pluginParam.getCreateDate());
//			//更新者
//			User cuser = UserUtil.getCurrentUser();
//			param.setUpdatebyId(cuser.getId());
//			param.setUpdateDate(new Date());
//		}else{
//			User cuser = UserUtil.getCurrentUser();
//			param.setCreatebyId(cuser.getId());
//			param.setCreateDate(new Date());
//			param.setUpdatebyId(cuser.getId());
//			param.setUpdateDate(new Date());
//		}
		super.save(param);
	}
}
