package net.iharding.modules.job.controller;

import net.iharding.modules.job.model.JobFlow;
import net.iharding.modules.job.model.JobFlowWrapper;
import net.iharding.modules.job.service.JobFlowService;

import org.guess.core.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
@RequestMapping("/job/FlowDesign")
public class FlowDesingController  extends BaseController<JobFlow>{
	@Autowired
	private JobFlowService jobFlowService;
	
	@RequestMapping(value = "/design/{id}")
	public ModelAndView flowDesing(@PathVariable("id") Long id) throws Exception {
		JobFlowWrapper object = jobFlowService.CheckJobFlow(id);
		ModelAndView mav = new ModelAndView("/job/JobFlow/flowdesign");
		mav.addObject("obj", object);
		return mav;
	}
}
