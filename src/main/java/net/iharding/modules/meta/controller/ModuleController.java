package net.iharding.modules.meta.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.meta.model.Module;
import net.iharding.modules.meta.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: Module
* @Description: ModuleController
* @author renzp
* @date 2014-8-5 下午02:04:46
*
*/
@Controller
@RequestMapping("/meta/module")
public class ModuleController extends BaseController<Module>{

	{
		editView = "/meta/module/edit";
		listView = "/meta/module/list";
		showView = "/meta/module/show";
	}
	
	@Autowired
	private ModuleService moduleService;
}