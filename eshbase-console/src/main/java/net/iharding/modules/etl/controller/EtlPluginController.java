package net.iharding.modules.etl.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.etl.model.EtlPlugin;
import net.iharding.modules.etl.service.EtlPluginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: EtlPlugin
* @Description: EtlPluginController
* @author Joe.zhang
* @date  2016-1-29 22:25:15
*
*/
@Controller
@RequestMapping("/etl/etlPlugin")
public class EtlPluginController extends BaseController<EtlPlugin>{

	{
		editView = "/etl/etlPlugin/edit";
		listView = "/etl/etlPlugin/list";
		showView = "/etl/etlPlugin/show";
	}
	
	@Autowired
	private EtlPluginService etlPluginService;
}