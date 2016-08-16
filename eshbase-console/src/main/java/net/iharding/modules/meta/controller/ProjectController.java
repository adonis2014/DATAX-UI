package net.iharding.modules.meta.controller;

import java.util.Date;

import javax.validation.Valid;

import net.iharding.modules.meta.model.Project;
import net.iharding.modules.meta.service.ProjectService;

import org.guess.core.web.BaseController;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
* 
* @ClassName: Project
* @Description: ProjectController
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Controller
@RequestMapping("/meta/Project")
public class ProjectController extends BaseController<Project>{

	{
		editView = "/meta/Project/edit";
		listView = "/meta/Project/list";
		showView = "/meta/Project/show";
	}
	
	@Autowired
	private ProjectService projectService;
	
	/**
	 * 添加
	 * @param object
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/edit")
	public String create(@Valid Project object) throws Exception {
		projectService.save(object);
		return REDIRECT + listView;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/setCheckLabel/{id}")
	public String setCheckLabel(@PathVariable("id") Long id) throws Exception {
		Project obj = projectService.get(id);
		if (obj.getCheckLabel()==null || obj.getCheckLabel()==0){
			obj.setCheckLabel(1);
		}else{
			obj.setCheckLabel(0);
		}
		obj.setUpdateDate(new Date());
		obj.setUpdater(UserUtil.getCurrentUser());
		projectService.save(obj);
		return this.list();
	}
}