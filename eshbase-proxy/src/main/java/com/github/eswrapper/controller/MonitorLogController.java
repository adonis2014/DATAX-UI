package com.github.eswrapper.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.guess.core.orm.Page;
import org.guess.core.orm.PropertyFilter;
import org.guess.core.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.eswrapper.model.MonitorLog;
import com.github.eswrapper.model.MonitorLogDetail;
import com.github.eswrapper.service.MonitorLogDetailService;
import com.github.eswrapper.service.MonitorLogService;

/**
* 
* @ClassName: MonitorLog
* @Description: MonitorLogController
* @author Joe.zhang
* @date  2016-8-5 11:30:18
*
*/
@Controller
@RequestMapping("/monitorLog")
public class MonitorLogController extends BaseController<MonitorLogDetail>{

	{
		editView = "/es/monitorlog/edit";
		listView = "/es/monitorlog/list";
		showView = "/es/monitorlog/show";
	}
	
	@Autowired
	private MonitorLogService monitorLogService;
	
	@Autowired
	private MonitorLogDetailService monitorLogDetailService;
	
	/**
	 * 返回分页json数据
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping("/page")
	public @ResponseBody Map<String,Object> page(Page<MonitorLogDetail> page,HttpServletRequest request){
		String success=request.getParameter("search_GTD_successCount");
		String failure=request.getParameter("search_GTD_failureCount");
		String search_GTD_logTime=request.getParameter("search_GTD_logTime");
		String search_LTD_logTime=request.getParameter("search_LTD_logTime");
		Page<MonitorLogDetail> pageData = monitorLogDetailService.find(page, success,failure,search_GTD_logTime,search_LTD_logTime);
		return pageData.returnMap();
	}
	
	/**
	 * 展示
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/show/{id}")
	public ModelAndView show(@PathVariable("id") Long id) throws Exception{
		MonitorLog object = monitorLogService.get(id);
		ModelAndView mav = new ModelAndView(showView);
		mav.addObject("obj", object);
		return mav;
	}
}