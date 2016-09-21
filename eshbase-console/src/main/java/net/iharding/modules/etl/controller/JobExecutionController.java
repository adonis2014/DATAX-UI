package net.iharding.modules.etl.controller;

import net.iharding.modules.etl.model.EtlJobExecution;
import net.iharding.modules.etl.service.EtlJobExecutionService;

import org.guess.core.web.BaseController;
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
@RequestMapping("/etl/jobExecution")
public class JobExecutionController extends BaseController<EtlJobExecution>{

	{
		listView = "/etl/jobExecution/list";
		showView = "/etl/jobExecution/show";
	}
	
	@Autowired
	private EtlJobExecutionService jobExecutionService;
}