package net.iharding.modules.etl.controller;

import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
import org.guess.core.web.BaseController;

import net.iharding.modules.etl.model.EtlTask;
import net.iharding.modules.etl.service.EtlTaskParamService;
import net.iharding.modules.etl.service.EtlTaskService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
* 
* @ClassName: EtlTask
* @Description: EtlTaskController
* @author Joe.zhang
* @date  2016-1-30 10:07:54
*
*/
@Controller
@RequestMapping("/etl/EtlTask")
public class EtlTaskController extends BaseController<EtlTask>{

	{
		editView = "/etl/EtlTask/edit";
		listView = "/etl/EtlTask/list";
		showView = "/etl/EtlTask/show";
	}
	
	@Autowired
	private EtlTaskService etlTaskService;
	
	@Autowired
	private EtlTaskParamService etlTaskParamService;
	
	/**
	 * 添加
	 * @param object
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/edit")
	public String create(@Valid EtlTask object) throws Exception {
		etlTaskService.save(object);
		String isEdit=this.request.getParameter("isEdit");
		if (StringUtils.isNotEmpty(isEdit)){
			return REDIRECT +  "/etl/EtlJob/edit";
		}else{
			return REDIRECT + listView;
		}
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete/{id}")
	public String delete(@PathVariable("id") Long id) throws Exception {
		etlTaskService.removeById(id);
		String isEdit=this.request.getParameter("isEdit");
		if (StringUtils.isNotEmpty(isEdit)){
			return REDIRECT +  "/etl/EtlJob/edit";
		}else{
			return REDIRECT + listView;
		}
	}
	
	/**
	 * 跳转到更新页面
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/generateParams/{id}")
	public ModelAndView generateParams(@PathVariable("id") Long id) throws Exception {
		EtlTask obj = etlTaskService.generateParams(id);
		ModelAndView mav = new ModelAndView(editView);
		mav.addObject("obj", obj);
		return mav;
	}
	
}
