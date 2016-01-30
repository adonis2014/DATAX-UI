package net.iharding.modules.etl.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.etl.model.EtlJob;
import net.iharding.modules.etl.service.EtlJobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: EtlJob
* @Description: EtlJobController
* @author Joe.zhang
* @date  2016-1-30 12:11:47
*
*/
@Controller
@RequestMapping("/etl/EtlJob")
public class EtlJobController extends BaseController<EtlJob>{

	{
		editView = "/etl/EtlJob/edit";
		listView = "/etl/EtlJob/list";
		showView = "/etl/EtlJob/show";
	}
	
	@Autowired
	private EtlJobService etlJobService;
}
