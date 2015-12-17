package net.iharding.modules.task.controller;

import net.iharding.modules.task.model.TimeTask;
import net.iharding.modules.task.service.TimeTaskService;

import org.guess.core.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
* 
* @ClassName: TimeTask
* @Description: TimeTaskController
* @author renzp
* @date 2014-8-5 下午02:04:46
*
*/
@Controller
@RequestMapping("/task/timeTask")
public class TimeTaskController extends BaseController<TimeTask>{

	{
		editView = "/task/timeTask/edit";
		listView = "/task/timeTask/list";
		showView = "/task/timeTask/show";
	}
	
	@Autowired
	private TimeTaskService timeTaskService;
}