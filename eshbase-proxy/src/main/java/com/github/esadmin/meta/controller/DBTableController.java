package com.github.esadmin.meta.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.github.esadmin.meta.model.DBTable;
import com.github.esadmin.meta.service.DBTableService;
import com.github.esadmin.meta.service.DataSourceService;

import org.apache.commons.lang3.math.NumberUtils;
import org.guess.core.orm.Page;
import org.guess.core.orm.PropertyFilter;
import org.guess.core.web.BaseController;
import org.guess.sys.service.UserService;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
* 
* @ClassName: DBTable
* @Description: DBTableController
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Controller
@RequestMapping("/meta/DBTable")
public class DBTableController extends BaseController<DBTable>{

	{
		editView = "/meta/DBTable/edit";
		listView = "/meta/DBTable/list";
		showView = "/meta/DBTable/show";
	}
	
	@Autowired
	private DBTableService dbTableService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private DataSourceService dataSourceService;
	/**
	 * 返回分页json数据
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping("/page")
	public @ResponseBody Map<String,Object> page(Page<DBTable> page,HttpServletRequest request){
		String dsid=request.getParameter("dsid");
		Page<DBTable> pageData = null;
		if (NumberUtils.isDigits(dsid)){
			pageData = dbTableService.findPage(page,"select table from DBTable as table left join table.database as database left join database.datasource as ds where ds.id=? ",NumberUtils.toLong(dsid) );
		}else{
			pageData = dbTableService.findPage(page,PropertyFilter.buildFromHttpRequest(request, "search"));
		}
		return pageData.returnMap();
	}
	
	@RequestMapping(value = "/*")
	public String list(){
		request.setAttribute("clusters", dataSourceService.findBy("checkLabel", 1));
		return listView;
	}
	
	
	
	/**
	 * 添加
	 * @param object
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/edit")
	public String create(@Valid DBTable object) throws Exception {
		dbTableService.save(object);
		return REDIRECT + listView;
	}
	
	/**
	 * 跳转到更新页面
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/update/{id}")
	public ModelAndView update(@PathVariable("id") Long id) throws Exception {
		DBTable obj = dbTableService.get(id);
		ModelAndView mav = new ModelAndView(editView);
		mav.addObject("obj", obj);
		if (obj.getCreatebyId()!=null)mav.addObject("creater", userService.get(obj.getCreatebyId()));
		if (obj.getUpdatebyId()!=null)mav.addObject("updater", userService.get(obj.getUpdatebyId()));
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/setCheckLabel/{id}")
	public String setCheckLabel(@PathVariable("id") Long id) throws Exception {
		DBTable obj = dbTableService.get(id);
		if (obj.getCheckLabel()==0){
			obj.setCheckLabel(1);
		}else{
			obj.setCheckLabel(0);
		}
		obj.setUpdateDate(new Date());
		obj.setUpdatebyId(UserUtil.getCurrentUser().getId());
		dbTableService.save(obj);
		return this.list();
	}
}