package net.iharding.modules.job.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import net.iharding.modules.job.model.JobExecutionInfo;
import net.iharding.modules.job.model.JobFlow;
import net.iharding.modules.job.model.JobFlowCron;
import net.iharding.modules.job.model.JobFlowWrapper;
import net.iharding.modules.job.model.JobWorker;
import net.iharding.modules.job.service.JobFlowService;
import net.iharding.modules.job.service.JobWorkerService;
import net.iharding.utils.HBStringUtils;

import org.apache.commons.lang3.math.NumberUtils;
import org.guess.core.orm.Page;
import org.guess.core.orm.PropertyFilter;
import org.guess.core.web.BaseController;
import org.quartz.CronExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	 * 展示
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/show/{id}")
	public ModelAndView show(@PathVariable("id") Long id) throws Exception{
		JobFlow object = jobFlowService.get(id);
		ModelAndView mav = new ModelAndView(showView);
		mav.addObject("obj", object);
		mav.addObject("workers", jobWorkerService.findBy("jobFlowId", object.getId()));
		return mav;
	}
	
	@RequestMapping("/executionPage")
	public @ResponseBody Map<String,Object> executionPage(Page<JobExecutionInfo> page,HttpServletRequest request){
		Page<JobExecutionInfo> pageData = jobFlowService.findExecutionPage(page,NumberUtils.toLong(request.getParameter("flowId")) );
		return pageData.returnMap();
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
		JobWorker worker = jobWorkerService.schedleJob(object,cron, cronString);
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
		CronExpression exp = new CronExpression(cronString[0]);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d = new Date();
		int i = 0;
		// 循环得到接下来n此的触发时间点，供验证
		StringBuffer sb=new StringBuffer();
		while (i < 10) {
			d = exp.getNextValidTimeAfter(d);
			sb.append(df.format(d)+"<br/>");
			++i;
		}
		mav.addObject("exeTime", sb.toString());
		return mav;
	}

}