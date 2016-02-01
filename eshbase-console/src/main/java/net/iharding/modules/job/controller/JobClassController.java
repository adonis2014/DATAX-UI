package net.iharding.modules.job.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.job.model.JobClass;
import net.iharding.modules.job.service.JobClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: JobClass
* @Description: JobClassController
* @author Joe.zhang
* @date  2016-1-31 16:56:20
*
*/
@Controller
@RequestMapping("/job/JobClass")
public class JobClassController extends BaseController<JobClass>{

	{
		editView = "/job/JobClass/edit";
		listView = "/job/JobClass/list";
		showView = "/job/JobClass/show";
	}
	
	@Autowired
	private JobClassService jobClassService;
}