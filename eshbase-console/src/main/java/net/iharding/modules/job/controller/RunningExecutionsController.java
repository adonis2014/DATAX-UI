package net.iharding.modules.job.controller;

import net.iharding.modules.job.model.JobExecutionInfo;

import org.guess.core.web.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.uncode.schedule.ConsoleManager;
import cn.uncode.schedule.ZKScheduleManager;

@Controller
@RequestMapping("/job/RunningExecutions")
public class RunningExecutionsController extends BaseController<JobExecutionInfo>{
	
	{
		listView = "/job/RunningExecutions/list";
	}
	
	@RequestMapping(value = "/list")
	public ModelAndView show() throws Exception{
		ModelAndView mav = new ModelAndView(listView);
		mav.addObject("workers", ConsoleManager.getScheduleManager().getScheduledExecutor());
		return mav;
	}
}
