package com.github.eswrapper.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.esadmin.meta.service.DataSourceService;

@Controller
@RequestMapping("/esSecurity")
public class EsSecurityController {
	@Autowired
	private DataSourceService dataSourceService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/clusters")
	public ModelAndView clusters(@RequestParam(required = false) String clustername) throws Exception {
		ModelAndView mav = new ModelAndView("/meta/security/clusters");
		mav.addObject("clusters", dataSourceService.findBy("checkLabel", 1));
		return  mav;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/roles")
	public ModelAndView roles(@RequestParam(required = false) String clustername) throws Exception {
		ModelAndView mav = new ModelAndView("/meta/security/roles");

		return  mav;
	}
}
