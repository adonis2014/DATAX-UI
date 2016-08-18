package net.iharding.modules.meta.controller;

import java.util.Date;

import javax.validation.Valid;

import net.iharding.modules.meta.model.DBTable;
import net.iharding.modules.meta.model.DbColumn;
import net.iharding.modules.meta.service.DBTableService;

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
		obj.setUpdater(UserUtil.getCurrentUser());
		dbTableService.save(obj);
		return this.list();
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/saveTable")
	public ModelAndView saveTable(DBTable cobj) throws Exception {
		DBTable obj = dbTableService.get(cobj.getId());
		obj.setRemark(cobj.getRemark());
		obj.setTablePname(cobj.getTablePname());
		obj.setTableType(cobj.getTableType());
		for(DbColumn column:obj.getColumns()){
			column.setColumnPname(request.getParameter("columnPname_"+column.getId()));
			column.setRemark(request.getParameter("remark_"+column.getId()));
		}
		ModelAndView mav = new ModelAndView(showView);
		mav.addObject("obj", obj);
		dbTableService.save(obj);
		return  mav;
	}
}