package net.iharding.modules.job.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.uncode.schedule.ConsoleManager;
import cn.uncode.schedule.core.ScheduleServer;
import cn.uncode.schedule.core.TaskDefine;

@Controller
@RequestMapping("/job/JobMonitor")
public class MonitorController {
	
	protected final static String REDIRECT = "redirect:";
	protected final static String SUCCESS = "success";
	protected String listView = "/job/Monitor/list";
	/**
	 * 显示监控主界面
	 * @return
	 */
	@RequestMapping(value = "/*")
	public ModelAndView list(){
		ModelAndView mav = new ModelAndView(listView);
		try {
			List<ScheduleServer> servers = ConsoleManager.getScheduleManager().getScheduleDataManager().selectServer();
			mav.addObject("servers", servers);
			List<TaskDefine> tasks = ConsoleManager.queryScheduleTask();
			mav.addObject("tasks", tasks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value = "/delete")
	public ModelAndView delete(@RequestParam("del") String del){
		TaskDefine taskDefine = new TaskDefine();
		String[] dels = del.split("_");
		taskDefine.setTargetBean(dels[0]);
		taskDefine.setTargetMethod(dels[1]);
		if (dels.length>2)taskDefine.setParams(dels[2]);
		ConsoleManager.delScheduleTask(taskDefine);
		return list();
	}
	
	
	
}
