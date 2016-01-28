package net.iharding.modules.meta.controller;

import javax.validation.Valid;

import net.iharding.modules.meta.model.DBTable;
import net.iharding.modules.meta.service.DBTableService;

import org.guess.core.web.BaseController;
import org.guess.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
}