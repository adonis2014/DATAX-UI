package net.iharding.modules.etl.controller;

import javax.validation.Valid;

import net.iharding.modules.etl.model.EtlPlugin;
import net.iharding.modules.etl.service.EtlPluginService;

import org.guess.core.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
* 
* @ClassName: EtlPlugin
* @Description: EtlPluginController
* @author Joe.zhang
* @date  2016-1-29 22:25:15
*
*/
@Controller
@RequestMapping("/etl/EtlPlugin")
public class EtlPluginController extends BaseController<EtlPlugin>{

	{
		editView = "/etl/EtlPlugin/edit";
		listView = "/etl/EtlPlugin/list";
		showView = "/etl/EtlPlugin/show";
	}
	
	@Autowired
	private EtlPluginService etlPluginService;
	
	/**
	 * 跳转到更新页面
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/update/{id}")
	public ModelAndView update(@PathVariable("id") Long id) throws Exception {
		EtlPlugin obj = etlPluginService.get(id);
		ModelAndView mav = new ModelAndView(editView);
		mav.addObject("obj", obj);
		
		return mav;
	}
	
	/**
	 * 添加
	 * @param object
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/edit")
	public String create(@Valid EtlPlugin object) throws Exception {
		object.setCheckLabel(1);
		etlPluginService.save(object);
		return REDIRECT + listView;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/setCheckLabel/{id}")
	public String setCheckLabel(@PathVariable("id") Long id) throws Exception {
		EtlPlugin obj = etlPluginService.get(id);
		if (obj.getCheckLabel()==null || obj.getCheckLabel()==0){
			obj.setCheckLabel(1);
		}else{
			obj.setCheckLabel(0);
		}
		etlPluginService.save(obj);
		return this.list();
	}
	
}
