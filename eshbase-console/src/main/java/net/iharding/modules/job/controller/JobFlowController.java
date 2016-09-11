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
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping(value = "/checkJobFlow/{id}")
	public ModelAndView checkJobFlow(@PathVariable("id") Long id) throws Exception {
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
	
	/**
	 * 获取cron 备注和字符串
	 * @param cron
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getCronString")
	public ModelAndView getCronString(@Valid JobFlowCron cron) throws Exception {
		JobFlowWrapper object = jobFlowService.CheckJobFlow(cron.getId());
		String[] cronString = HBStringUtils.getCronRemark(cron);
		ModelAndView mav = new ModelAndView("/job/JobFlow/checkJobView");
		mav.addObject("obj", object);
		mav.addObject("cronStr", cronString[0]);
		mav.addObject("cronRemark", cronString[1]);
		return mav;
	}

}