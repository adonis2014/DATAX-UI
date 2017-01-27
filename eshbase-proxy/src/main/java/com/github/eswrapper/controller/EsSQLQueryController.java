package com.github.eswrapper.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.esadmin.meta.service.DataSourceService;
import com.github.eswrapper.model.CommonQueryParams;
import com.github.eswrapper.model.Response;
import com.github.eswrapper.service.ESSqlManager;

@Controller
@RequestMapping("/commonQuery")
public class EsSQLQueryController {

	@Autowired
	private ESSqlManager essqlManager;
	@Autowired
	private DataSourceService dataSourceService;
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/essql", method = RequestMethod.POST)
	@ResponseBody
	public Response<List<Map>> getESSqlQuery(@RequestParam String sql,
			@RequestParam(required = false) String clusterName,
			@RequestParam(required = false) String taskId,
			@RequestParam(required = false) Integer from,
			@RequestParam(required = false) Integer size,
			@RequestParam(required = false) Integer useScroll,
			@RequestParam(required = false) Integer useCache) {
		return essqlManager.getESSqlQuery(sql,clusterName, taskId, from==null ? 0 : from , size==null ? 10 :size,useScroll!=null && useScroll == 1, useCache!=null && useCache == 1);
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/getResults", method = RequestMethod.POST)
	@ResponseBody
	public Response<List<Map>> getResults(@RequestBody CommonQueryParams params) {
		return essqlManager.getResults(params);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/sqlquery")
	public ModelAndView sqlquery(@RequestParam(required = false) String clustername) throws Exception {
		ModelAndView mav = new ModelAndView("/meta/sql/sqlquery");
		mav.addObject("clusters", dataSourceService.findBy("checkLabel", 1));
		return  mav;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(method = RequestMethod.POST, value = "/showResults")
	public ModelAndView showSqlResults(@RequestParam String sql,
			@RequestParam(required = false) String clusterName,
			@RequestParam(required = false) String taskId,
			@RequestParam(required = false) Integer from,
			@RequestParam(required = false) Integer size,
			@RequestParam(required = false) Integer useScroll,
			@RequestParam(required = false) Integer useCache) throws Exception {
		Response<List<Map>> results=essqlManager.getESSqlQuery(sql,clusterName, taskId, from==null ? 0 : from , size==null ? 10 :size,useScroll!=null && useScroll == 1, useCache!=null && useCache == 1);
		ModelAndView mav = new ModelAndView("/meta/sql/results");
		if (results.getData()!=null){
			Set<String> fields=new HashSet<String>();
			for(Map row:results.getData()){
				for(Object key:row.keySet()){
					if (key!=null){
						fields.add(key.toString());
					}
				}
			}
			mav.addObject("fields", fields);
		}
		mav.addObject("results", results);
		return  mav;
	}
}
