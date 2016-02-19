package net.iharding.modules.job.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.quartz.CronExpression;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/job/CronTest")
public class CronTestController {

	public CronTestController() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 显示测试页面
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/show")
	public ModelAndView show() throws Exception{
		ModelAndView mav = new ModelAndView("/job/CronTest/show");
		return mav;
	}
	
	/**
	 * 测试语句是否正确
	 * @param cronString
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/test",method=RequestMethod.POST)
	public ModelAndView testCron(@RequestParam("cronString") String cronString , HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/job/CronTest/show");
		try {
			CronExpression exp = new CronExpression(cronString);
			SimpleDateFormat df = new SimpleDateFormat("YYYYMMDD HH:mm:ss");
			Date d = new Date();
			int i = 0;
			// 循环得到接下来n此的触发时间点，供验证
			StringBuffer sb=new StringBuffer();
			while (i < 10) {
				d = exp.getNextValidTimeAfter(d);
				sb.append(df.format(d)+"<br/>");
				++i;
			}
			mav.addObject("msg", "Cron表达式格式正确！测试执行时间：<br/>"+sb.toString());
		} catch (ParseException e) {
			mav.addObject("msg", "Cron表达式格式错误！");
		}
		return mav;
	}

}
