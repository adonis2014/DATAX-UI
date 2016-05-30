package net.iharding.modules.job.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.job.model.JobExecutionInfo;
import net.iharding.modules.job.service.JobExecutionInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: JobExecutionInfo
* @Description: JobExecutionInfoController
* @author Joe.zhang
* @date  2016-2-11 12:11:47
*
*/
@Controller
@RequestMapping("/job/JobExecutionInfo")
public class JobExecutionInfoController extends BaseController<JobExecutionInfo>{

	{
		editView = "/job/JobExecutionInfo/edit";
		listView = "/job/JobExecutionInfo/list";
		showView = "/job/JobExecutionInfo/show";
	}
	
	@Autowired
	private JobExecutionInfoService jobExecutionInfoService;
}