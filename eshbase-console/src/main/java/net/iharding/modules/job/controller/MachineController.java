package net.iharding.modules.job.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.job.model.Machine;
import net.iharding.modules.job.service.MachineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: Machine
* @Description: MachineController
* @author Joe.zhang
* @date  2016-1-31 17:00:46
*
*/
@Controller
@RequestMapping("/job/Machine")
public class MachineController extends BaseController<Machine>{

	{
		editView = "/job/Machine/edit";
		listView = "/job/Machine/list";
		showView = "/job/Machine/show";
	}
	
	@Autowired
	private MachineService machineService;
}