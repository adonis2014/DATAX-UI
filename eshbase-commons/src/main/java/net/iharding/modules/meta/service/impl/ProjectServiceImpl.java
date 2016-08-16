package net.iharding.modules.meta.service.impl;

import java.util.Date;

import net.iharding.modules.meta.dao.ProjectDao;
import net.iharding.modules.meta.model.Project;
import net.iharding.modules.meta.service.ProjectService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: Project
* @Description: ProjectserviceImpl
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class ProjectServiceImpl extends BaseServiceImpl<Project, Long> implements ProjectService {

	@Autowired
	private ProjectDao projectDao;
	
	@Override
	public void save(Project project) throws Exception {
		if(project.getId() != null){
			
			Project dbProject = projectDao.get(project.getId());
			
			//保留发表者以及发表提起
			project.setCreater(dbProject.getCreater());
			project.setCreateDate(dbProject.getCreateDate());
			//更新者
			User cuser = UserUtil.getCurrentUser();
			project.setUpdater(cuser);
			project.setUpdateDate(new Date());
		}else{
			User cuser = UserUtil.getCurrentUser();
			project.setCreater(cuser);
			project.setCreateDate(new Date());
			project.setUpdater(cuser);
			project.setCheckLabel(1);
			project.setUpdateDate(new Date());
		}
		super.save(project);
	}
	
}
