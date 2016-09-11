package net.iharding.modules.job.controller;

import net.iharding.modules.job.model.JobActivity;
import net.iharding.modules.job.service.JobActivityService;

import org.guess.core.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: JobActivity
* @Description: JobActivityController
* @author Joe.zhang
* @date  2016-9-10 19:09:22
*
*/
@Controller
@RequestMapping("/job/jobActivity")
public class JobActivityController extends BaseController<JobActivity>{

	{
		editView = "/job/jobActivity/edit";
		listView = "/job/jobActivity/list";
		showView = "/job/jobActivity/show";
	}
	
	@Autowired
	private JobActivityService jobActivityService;
	
	
}