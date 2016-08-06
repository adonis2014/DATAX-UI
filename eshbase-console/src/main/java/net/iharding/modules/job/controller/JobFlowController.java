package net.iharding.modules.job.controller;

import javax.validation.Valid;

import net.iharding.modules.job.model.JobFlow;
import net.iharding.modules.job.model.JobFlowCron;
import net.iharding.modules.job.model.JobFlowWrapper;
import net.iharding.modules.job.model.JobWorker;
import net.iharding.modules.job.service.JobFlowService;
import net.iharding.modules.job.service.JobWorkerService;
import net.iharding.utils.HBStringUtils;

import org.guess.core.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * @ClassName: JobFlow
 * @Description: JobFlowController
 * @author Joe.zhang
 * @date 2016-5-19 23:56:47
 *
 */
@Controller
@RequestMapping("/job/JobFlow")
public class JobFlowController extends BaseController<JobFlow> {

	{
		editView = "/job/JobFlow/edit";
		listView = "/job/JobFlow/list";
		showView = "/job/JobFlow/show";
	}

	@Autowired
	private JobFlowService jobFlowService;

	@Autowired
	private JobWorkerService jobWorkerService;

	/**
	 * 进入任务调度安排界面
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/checkJobFlow")
	public ModelAndView checkJobFlow(@RequestParam("ids") Long id) throws Exception {
		JobFlowWrapper object = jobFlowService.CheckJobFlow(id);
		ModelAndView mav = new ModelAndView("/job/JobFlow/checkJobView");
		mav.addObject("obj", object);
		return mav;
	}

	/**
	 * 调度安排任务
	 * 
	 * @param cron
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/generateJob")
	public ModelAndView generateJob(@Valid JobFlowCron cron) throws Exception {
		JobFlowWrapper object = jobFlowService.CheckJobFlow(cron.getId());
		String cronString = HBStringUtils.getCronString(cron);
		JobWorker worker = jobWorkerService.schedleJob(object, cronString);
		ModelAndView mav = new ModelAndView("/job/JobFlow/JobWorkerView");
		mav.addObject("obj", worker);
		return mav;
	}

}