package com.github.esadmin.meta.controller;

import java.util.Date;

import javax.validation.Valid;

import com.github.esadmin.meta.model.DBIndex;
import com.github.esadmin.meta.service.DBIndexService;

import org.guess.core.web.BaseController;
import org.guess.sys.service.UserService;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
* 
* @ClassName: DBIndex
* @Description: DBIndexController
* @author Joe.zhang
* @date  2015-12-8 12:00:37
*
*/
@Controller
@RequestMapping("/meta/DBIndex")
public class DBIndexController extends BaseController<DBIndex>{

	{
		editView = "/meta/DBIndex/edit";
		listView = "/meta/DBIndex/list";
		showView = "/meta/DBIndex/show";
	}
	
	@Autowired
	private DBIndexService dbindexService;
	@Autowired
	private UserService userService;
	
	/**
	 * 添加
	 * @param object
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/edit")
	public String create(@Valid DBIndex object) throws Exception {
		dbindexService.save(object);
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
		DBIndex obj = dbindexService.get(id);
		ModelAndView mav = new ModelAndView(editView);
		mav.addObject("obj", obj);
		if (obj.getCreatebyId()!=null)mav.addObject("creater", userService.get(obj.getCreatebyId()));
		if (obj.getUpdatebyId()!=null)mav.addObject("updater", userService.get(obj.getUpdatebyId()));
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/setCheckLabel/{id}")
	public String setCheckLabel(@PathVariable("id") Long id) throws Exception {
		DBIndex obj = dbindexService.get(id);
		if (obj.getCheckLabel()==0){
			obj.setCheckLabel(1);
		}else{
			obj.setCheckLabel(0);
		}
		obj.setUpdateDate(new Date());
		obj.setUpdatebyId(UserUtil.getCurrentUser().getId());
		dbindexService.save(obj);
		return this.list();
	}
	
}