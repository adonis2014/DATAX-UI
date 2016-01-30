package net.iharding.modules.etl.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.etl.model.EtlTask;
import net.iharding.modules.etl.service.EtlTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: EtlTask
* @Description: EtlTaskController
* @author Joe.zhang
* @date  2016-1-30 10:07:54
*
*/
@Controller
@RequestMapping("/etl/etlTask")
public class EtlTaskController extends BaseController<EtlTask>{

	{
		editView = "/etl/etlTask/edit";
		listView = "/etl/etlTask/list";
		showView = "/etl/etlTask/show";
	}
	
	@Autowired
	private EtlTaskService etlTaskService;
}