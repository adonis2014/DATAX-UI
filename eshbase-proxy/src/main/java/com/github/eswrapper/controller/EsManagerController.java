package com.github.eswrapper.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.guess.core.orm.Page;
import org.guess.core.orm.PropertyFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.esadmin.meta.model.DataSource;
import com.github.esadmin.meta.model.DataSourceWrapper;
import com.github.esadmin.meta.service.DataSourceService;

@Controller
@RequestMapping("/esmgnt/thirdparty")
public class EsManagerController  {
	
	@Autowired
	private DataSourceService dataSourceService;
	
	/**
	 * 返回分页json数据
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping("/page")
	public @ResponseBody Map<String,Object> page(Page<DataSource> page,HttpServletRequest request){
		Page<DataSource> pageData = dataSourceService.findPage(page, PropertyFilter.buildFromHttpRequest(request, "search"));
		return pageData.returnMap();
	}
	
	
	
	@RequestMapping(method = RequestMethod.GET, value = "/head")
	public ModelAndView headList() throws Exception {
		ModelAndView mav = new ModelAndView("/meta/esmgnt/head");
		return  mav;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/redirectHead/{id}")
	public ModelAndView redirectHead(@PathVariable("id") Long id) throws Exception {
		DataSourceWrapper dw=dataSourceService.getWrapper(id);
		ModelAndView mav = new ModelAndView("redirect:"+dw.getPluginUrl("head","auth_user","auth_password"));
		return  mav;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/redirectKopf/{id}")
	public ModelAndView redirectKopf(@PathVariable("id") Long id) throws Exception {
		DataSourceWrapper dw=dataSourceService.getWrapper(id);
		ModelAndView mav = new ModelAndView("redirect:"+dw.getPluginUrl("kopf","auth_user","auth_password"));
		return  mav;
	}

	@RequestMapping(method = RequestMethod.GET,value = "/kopf")
	public ModelAndView kopfList() throws Exception {
		ModelAndView mav = new ModelAndView("/meta/esmgnt/kopf");
		return  mav;
	}
}
