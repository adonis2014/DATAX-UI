package com.github.esadmin.meta.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.math.NumberUtils;
import org.guess.core.web.BaseController;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.github.esadmin.meta.model.DataSource;
import com.github.esadmin.meta.model.DataSourceWrapper;
import com.github.esadmin.meta.model.MetaProperty;
import com.github.esadmin.meta.service.DBTableService;
import com.github.esadmin.meta.service.DataSourceService;

import net.iharding.esproxy.throttle.EsThrottleFactory;

/**
* 
* @ClassName: DataSource
* @Description: DataSourceController
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Controller
@RequestMapping("/meta/clustermgnt")
public class DataSourceController extends BaseController<DataSource>{

	{
		editView = "/meta/clustermgnt/edit";
		listView = "/meta/clustermgnt/list";
		showView = "/meta/clustermgnt/show";
	}
	
	@Autowired
	private DataSourceService dataSourceService;
	
	@Autowired
	private DBTableService dbTableService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/start/{id}")
	public String setCheckLabel(@PathVariable("id") Long id) throws Exception {
		DataSource obj = dataSourceService.get(id);
		if (obj.getCheckLabel()==null || obj.getCheckLabel()==0){
			obj.setCheckLabel(1);
		}else{
			obj.setCheckLabel(0);
		}
		obj.setUpdateDate(new Date());
		obj.setUpdater(UserUtil.getCurrentUser());
		dataSourceService.save(obj);
		return this.list();
	}
	/**
	 * 获取数据源的详细参数设置信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/setup/{id}")
	public ModelAndView setup(@PathVariable("id") Long id) throws Exception {
		DataSourceWrapper obj = dataSourceService.getWrapper(id);
		ModelAndView mav = new ModelAndView("/meta/clustermgnt/setup");
		mav.addObject("obj", obj);
		return  mav;
	}
	
	
	@RequestMapping(method = RequestMethod.POST, value = "/saveSetup")
	public ModelAndView saveSetup(DataSourceWrapper cobj) throws Exception {
		DataSource obj = dataSourceService.get(cobj.getId());
		String[] paramKeys=this.request.getParameterValues("paramKey");
		List<MetaProperty> properties=new ArrayList<MetaProperty>();
		for(String key:paramKeys){
			MetaProperty mp=new MetaProperty();
			mp.setPropertyKey(key);
			mp.setPropertyValue(request.getParameter(key+"_value"));
			mp.setRemark(request.getParameter(key+"_remark"));
			mp.setGroup(request.getParameter(key+"_group"));
			mp.setGroupName(request.getParameter(key+"_groupName"));
			mp.setSortId(NumberUtils.toLong(request.getParameter(key+"_sortId")));
			if (NumberUtils.isDigits(request.getParameter(key+"_id"))){
				mp.setId(Long.valueOf(request.getParameter(key+"_id")));
			}
			mp.setRefId(obj.getId());
			mp.setRefType(obj.getDbType());
			properties.add(mp);
		}
		ModelAndView mav = new ModelAndView(showView);
		mav.addObject("obj", obj);
		mav.addObject("properties", properties);
		dataSourceService.saveSetup(obj,properties);
		EsThrottleFactory.updateByClusterName(obj.getSchemaName(),true);
		return  mav;
	}
	
	/**
	 * 展示
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/show/{id}")
	public ModelAndView show(@PathVariable("id") Long id) throws Exception{
		DataSource obj = dataSourceService.get(id);
		ModelAndView mav = new ModelAndView(showView);
		mav.addObject("obj", obj);
		List<MetaProperty> properties=dataSourceService.getProperties(obj.getDbType(),id);
		mav.addObject("properties", properties);
		return mav;
	}
	
	/**
	 * 进入树状元数据表列表，查看监控日志
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/monitor/{id}")
	public ModelAndView monitor(@PathVariable("id") Long id)  {
		ModelAndView mav = new ModelAndView("/meta/DBTable/list");
		try{
			DataSource obj = dataSourceService.monitor(id);
			mav.addObject("objs", obj);
		}catch(Exception ex){
			mav.addObject("msg", "连接数据源失败！"+ex.getMessage());
		}
		return  mav;
	}
}