package net.iharding.modules.etl.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.etl.model.EtlParamColumn;
import net.iharding.modules.etl.service.EtlParamColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: EtlParamColumn
* @Description: EtlParamColumnController
* @author Joe.zhang
* @date  2016-1-30 17:29:38
*
*/
@Controller
@RequestMapping("/etl/EtlParamColumn")
public class EtlParamColumnController extends BaseController<EtlParamColumn>{

	{
		editView = "/etl/EtlParamColumn/edit";
		listView = "/etl/EtlParamColumn/list";
		showView = "/etl/EtlParamColumn/show";
	}
	
	@Autowired
	private EtlParamColumnService etlParamColumnService;
}