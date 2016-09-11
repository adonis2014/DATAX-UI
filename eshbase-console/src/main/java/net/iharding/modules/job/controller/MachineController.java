package net.iharding.modules.job.controller;

import org.apache.commons.lang3.StringUtils;
import org.guess.core.web.BaseController;

import net.iharding.modules.job.model.Machine;
import net.iharding.modules.job.service.MachineService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	/**
	 * 展示
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/showByUUID/{uuid}")
	public ModelAndView showByUUID(@PathVariable("uuid") String uuid) throws Exception{
		String[] ips=StringUtils.split(uuid,"#");
		Machine object = machineService.get(ips[0]);
		ModelAndView mav = new ModelAndView(showView);
		mav.addObject("obj", object);
		return mav;
	}
}