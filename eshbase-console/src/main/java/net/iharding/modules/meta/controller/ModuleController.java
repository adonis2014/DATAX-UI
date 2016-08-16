package net.iharding.modules.meta.controller;

import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.guess.core.web.BaseController;
import org.guess.sys.util.UserUtil;

import net.iharding.modules.meta.model.DBIndex;
import net.iharding.modules.meta.model.DataSource;
import net.iharding.modules.meta.model.Module;
import net.iharding.modules.meta.service.DataSourceService;
import net.iharding.modules.meta.service.ModuleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
* 
* @ClassName: Module
* @Description: ModuleController
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Controller
@RequestMapping("/meta/Module")
public class ModuleController extends BaseController<Module>{

	{
		editView = "/meta/Module/edit";
		listView = "/meta/Module/list";
		showView = "/meta/Module/show";
	}
	
	@Autowired
	private ModuleService moduleService;
	
	@Autowired
	private DataSourceService dataSourceService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/setCheckLabel/{id}")
	public String setCheckLabel(@PathVariable("id") Long id) throws Exception {
		Module obj = moduleService.get(id);
		if (obj.getCheckLabel()==null || obj.getCheckLabel()==0){
			obj.setCheckLabel(1);
		}else{
			obj.setCheckLabel(0);
		}
		obj.setUpdateDate(new Date());
		obj.setUpdater(UserUtil.getCurrentUser());
		moduleService.save(obj);
		return this.list();
	}
	
	/**
	 * 跳转到更新页面
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/update/{id}")
	public ModelAndView update(@PathVariable("id") Long id) throws Exception {
		Module obj = moduleService.get(id);
		ModelAndView mav = new ModelAndView(editView);
		mav.addObject("obj", obj);
		List<DataSource> dss=dataSourceService.getAll();
		mav.addObject("datasources", dss);
		return mav;
	}
	
	/**
	 * 跳转到添加页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/create")
	public ModelAndView create() throws Exception{
		ModelAndView mav = new ModelAndView(editView);
		List<DataSource> dss=dataSourceService.getAll();
		mav.addObject("datasources", dss);
		return mav;
	}
	
	/**
	 * 添加
	 * @param object
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/edit")
	public String create(@Valid Module object) throws Exception {
		moduleService.save(object);
		return REDIRECT + listView;
	}
}