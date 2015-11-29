package net.iharding.modules.meta.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.meta.model.Project;
import net.iharding.modules.meta.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: Project
* @Description: ProjectController
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Controller
@RequestMapping("/meta/project")
public class ProjectController extends BaseController<Project>{

	{
		editView = "/meta/project/edit";
		listView = "/meta/project/list";
		showView = "/meta/project/show";
	}
	
	@Autowired
	private ProjectService projectService;
}