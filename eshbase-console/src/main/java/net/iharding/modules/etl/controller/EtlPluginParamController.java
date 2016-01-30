package net.iharding.modules.etl.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.etl.model.EtlPluginParam;
import net.iharding.modules.etl.service.EtlPluginParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: EtlPluginParam
* @Description: EtlPluginParamController
* @author Joe.zhang
* @date  2016-1-30 17:35:16
*
*/
@Controller
@RequestMapping("/etl/EtlPluginParam")
public class EtlPluginParamController extends BaseController<EtlPluginParam>{

	{
		editView = "/etl/EtlPluginParam/edit";
		listView = "/etl/EtlPluginParam/list";
		showView = "/etl/EtlPluginParam/show";
	}
	
	@Autowired
	private EtlPluginParamService etlPluginParamService;
}