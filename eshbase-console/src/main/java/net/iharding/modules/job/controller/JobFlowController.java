package net.iharding.modules.job.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.job.model.JobFlow;
import net.iharding.modules.job.service.JobFlowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: JobFlow
* @Description: JobFlowController
* @author Joe.zhang
* @date  2016-5-19 23:56:47
*
*/
@Controller
@RequestMapping("/job/jobFlow")
public class JobFlowController extends BaseController<JobFlow>{

	{
		editView = "/job/jobFlow/edit";
		listView = "/job/jobFlow/list";
		showView = "/job/jobFlow/show";
	}
	
	@Autowired
	private JobFlowService jobFlowService;
}