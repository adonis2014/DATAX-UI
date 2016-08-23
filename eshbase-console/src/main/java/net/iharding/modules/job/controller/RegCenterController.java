package net.iharding.modules.job.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import net.iharding.modules.job.model.JobTaskDefine;
import net.iharding.modules.job.model.JobWorker;
import net.iharding.modules.job.model.Machine;
import net.iharding.modules.job.model.RegCenter;
import net.iharding.modules.job.service.RegCenterService;

import org.guess.core.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 * 
 * @ClassName: RegCenter
 * @Description: RegCenterController
 * @author Joe.zhang
 * @param <Machine>
 * @date 2016-1-31 17:15:41
 * 
 */
@Controller
@RequestMapping("/job/RegCenter")
public class RegCenterController extends BaseController<RegCenter> {

	public static final String CURATOR_CLIENT_KEY = "curator_client_key";

	{
		editView = "/job/RegCenter/edit";
		listView = "/job/RegCenter/list";
		showView = "/job/RegCenter/show";
	}

	@Autowired
	private RegCenterService regCenterService;

	/**
	 * 添加注册中心
	 * 
	 * @param object
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/edit")
	public String create(@Valid RegCenter object) throws Exception {
		regCenterService.save(object);
		return REDIRECT + listView;
	}

	/**
	 * 连接注册中心对应的zkServer,获取调度作业信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "connect/{id}", method = RequestMethod.GET)
	public ModelAndView connect(@PathVariable("id") Long id)  throws Exception{
//		regCenterService.connect(id);
		return show(id);
	}
	
	/**
	 * 展示
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/show/{id}")
	public ModelAndView show(@PathVariable("id") Long id) throws Exception{
		RegCenter object = regCenterService.get(id);
		ModelAndView mav = new ModelAndView(showView);
		mav.addObject("obj", object);
		List<Machine> machines=regCenterService.getMachines(id);
		mav.addObject("machines", machines);
		List<JobWorker> workers=regCenterService.getJobWorkers(id);
		mav.addObject("workers", workers);
		List<JobTaskDefine> taskDefines=regCenterService.getJobTaskDefines(id);
		mav.addObject("taskDefines", taskDefines);
		return mav;
	}

	
	
}