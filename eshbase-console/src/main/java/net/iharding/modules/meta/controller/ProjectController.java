package net.iharding.modules.meta.controller;

import java.util.Date;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.guess.core.Constants;
import org.guess.core.web.BaseController;
import org.guess.sys.model.User;

import net.iharding.modules.meta.model.Project;
import net.iharding.modules.meta.service.ProjectService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		if (object.getId()==null){
			object.setCreateDate(new Date());
			object.setCreater((User) session.getAttribute(Constants.CURRENT_USER));
		}
		object.setUpdateDate(new Date());
		object.setUpdater((User) session.getAttribute(Constants.CURRENT_USER));
		return super.create(object);
	}
}