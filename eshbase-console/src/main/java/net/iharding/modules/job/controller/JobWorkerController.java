package net.iharding.modules.job.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.job.model.JobWorker;
import net.iharding.modules.job.service.JobWorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: JobWorker
* @Description: JobWorkerController
* @author Joe.zhang
* @date  2016-1-31 17:34:42
*
*/
@Controller
@RequestMapping("/job/JobWorker")
public class JobWorkerController extends BaseController<JobWorker>{

	{
		editView = "/job/JobWorker/edit";
		listView = "/job/JobWorker/list";
		showView = "/job/JobWorker/show";
	}
	
	@Autowired
	private JobWorkerService jobWorkerService;
}