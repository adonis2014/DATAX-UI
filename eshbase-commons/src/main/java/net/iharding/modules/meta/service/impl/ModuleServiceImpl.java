package net.iharding.modules.meta.service.impl;

import java.util.Date;

import net.iharding.modules.meta.dao.ModuleDao;
import net.iharding.modules.meta.model.Module;
import net.iharding.modules.meta.service.ModuleService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: Module
* @Description: ModuleserviceImpl
* @author zhangxuhui
* @date 2016-8-5 下午02:04:46
*
*/
@Service
public class ModuleServiceImpl extends BaseServiceImpl<Module, Long> implements ModuleService {
	@Autowired
	private ModuleDao moduleDao;
	
	public void save(Module module) throws Exception {
		if(module.getId() != null){
			Module oriModule = moduleDao.get(module.getId());
			//保留发表者以及发表提起
			module.setCreater(oriModule.getCreater());
			module.setCreateDate(oriModule.getCreateDate());
			module.setCheckLabel(oriModule.getCheckLabel());
			//更新者
			User cuser = UserUtil.getCurrentUser();
			module.setUpdater(cuser);
			module.setUpdateDate(new Date());
		}else{
			User cuser = UserUtil.getCurrentUser();
			module.setCreater(cuser);
			module.setCreateDate(new Date());
			module.setUpdater(cuser);
			module.setUpdateDate(new Date());
			module.setCheckLabel(1);
		}
		super.save(module);
	}
}
