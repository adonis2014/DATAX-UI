package net.iharding.modules.job.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.job.model.JobTaskDefine;
import net.iharding.modules.job.service.JobTaskDefineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: JobTaskDefine
* @Description: JobTaskDefineController
* @author Joe.zhang
* @date  2016-1-31 17:39:36
*
*/
@Controller
@RequestMapping("/job/JobTaskDefine")
public class JobTaskDefineController extends BaseController<JobTaskDefine>{

	{
		editView = "/job/JobTaskDefine/edit";
		listView = "/job/JobTaskDefine/list";
		showView = "/job/JobTaskDefine/show";
	}
	
	@Autowired
	private JobTaskDefineService jobTaskDefineService;
}