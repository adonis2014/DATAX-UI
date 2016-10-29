package net.iharding.modules.etl.controller;

import javax.validation.Valid;

import net.iharding.modules.etl.model.EtlPlugin;
import net.iharding.modules.etl.model.EtlPluginParam;
import net.iharding.modules.etl.service.EtlPluginParamService;
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
* @ClassName: EtlPluginParam
* @Description: EtlPluginParamController
* @author Joe.zhang
* @date  2016-1-30 17:35:16
*
*/
@Controller
@RequestMapping("/etl/EtlPluginParam")
public class EtlPluginParamController extends BaseController<EtlPluginParam>{

	{
		editView = "/etl/EtlPlugin/edit";
		listView = "/etl/EtlPluginParam/list";
		showView = "/etl/EtlPluginParam/show";
}
	
	@Autowired
	private EtlPluginParamService etlPluginParamService;
	
	@Autowired
	private EtlPluginService etlPluginService;
	
	/**
	 * 添加
	 * @param object
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/saveParam")
	public ModelAndView savePluginParam(@Valid EtlPluginParam object) throws Exception {
//		object.setPlugin(etlPluginService.get(object.getPlugin().getId()));
		etlPluginParamService.save(object);
		EtlPlugin obj = etlPluginService.get(object.getPlugin().getId());
		ModelAndView mav = new ModelAndView(editView);
		mav.addObject("obj", obj);
		
		return mav;
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteParam/{id}")
	public ModelAndView deleteParam(@PathVariable("id") Long id) throws Exception {
		EtlPluginParam pparam=etlPluginParamService.get(id);
		etlPluginParamService.removeById(id);
		EtlPlugin obj = etlPluginService.get(pparam.getPlugin().getId());
		ModelAndView mav = new ModelAndView(editView);
		mav.addObject("obj", obj);
		return mav;
	}
}
