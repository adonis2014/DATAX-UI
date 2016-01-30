package net.iharding.modules.meta.controller;

import java.util.Date;

import org.guess.core.web.BaseController;
import org.guess.sys.util.UserUtil;

import net.iharding.modules.meta.model.DBIndex;
import net.iharding.modules.meta.model.Module;
import net.iharding.modules.meta.service.ModuleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
* 
* @ClassName: Module
* @Description: ModuleController
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Controller
@RequestMapping("/meta/module")
public class ModuleController extends BaseController<Module>{

	{
		editView = "/meta/Module/edit";
		listView = "/meta/Module/list";
		showView = "/meta/Module/show";
	}
	
	@Autowired
	private ModuleService moduleService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/setCheckLabel/{id}")
	public String setCheckLabel(@PathVariable("id") Long id) throws Exception {
		Module obj = moduleService.get(id);
		if (obj.getCheckLabel()==0){
			obj.setCheckLabel(1);
		}else{
			obj.setCheckLabel(0);
		}
		obj.setUpdateDate(new Date());
		obj.setUpdater(UserUtil.getCurrentUser());
		moduleService.save(obj);
		return this.list();
	}
}