package net.iharding.modules.etl.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.etl.model.TaskDsDefine;
import net.iharding.modules.etl.service.TaskDsDefineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: TaskDsDefine
* @Description: TaskDsDefineController
* @author Joe.zhang
* @date  2016-4-3 23:21:21
*
*/
@Controller
@RequestMapping("/etl/taskDsDefine")
public class TaskDsDefineController extends BaseController<TaskDsDefine>{

	{
		editView = "/etl/taskDsDefine/edit";
		listView = "/etl/taskDsDefine/list";
		showView = "/etl/taskDsDefine/show";
	}
	
	@Autowired
	private TaskDsDefineService taskDsDefineService;
}