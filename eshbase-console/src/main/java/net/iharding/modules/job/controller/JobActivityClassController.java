package net.iharding.modules.job.controller;

import net.iharding.modules.job.model.JobActivityClass;
import net.iharding.modules.job.service.JobActivityClassService;

import org.guess.core.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: JobActivityClass
* @Description: JobActivityClassController
* @author Joe.zhang
* @date  2016-9-10 19:12:08
*
*/
@Controller
@RequestMapping("/job/jobActivityClass")
public class JobActivityClassController extends BaseController<JobActivityClass>{

	{
		editView = "/job/jobActivityClass/edit";
		listView = "/job/jobActivityClass/list";
		showView = "/job/jobActivityClass/show";
	}
	
	@Autowired
	private JobActivityClassService jobActivityClassService;
}