package net.iharding.modules.meta.controller;

import net.iharding.modules.meta.model.DBTable;
import net.iharding.modules.meta.model.Database;
import net.iharding.modules.meta.service.DatabaseService;

import org.guess.core.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
* 
* @ClassName: Database
* @Description: DatabaseController
* @author Joe.zhang
* @date  2016-5-18 14:08:46
*
*/
@Controller
@RequestMapping("/meta/Database")
public class DatabaseController extends BaseController<Database>{

	{
		editView = "/meta/Database/edit";
		listView = "/meta/Database/list";
		showView = "/meta/Database/show";
	}
	
	@Autowired
	private DatabaseService databaseService;
	
	@RequestMapping(method = RequestMethod.POST, value = "/saveDatabase")
	public ModelAndView saveDatabase(Database cobj) throws Exception {
		Database obj = databaseService.get(cobj.getId());
		obj.setRemark(cobj.getRemark());
		for(DBTable table:obj.getTables()){
			table.setTablePname(request.getParameter("tablePname_"+table.getId()));
			table.setRemark(request.getParameter("remark_"+table.getId()));
		}
		ModelAndView mav = new ModelAndView(showView);
		mav.addObject("obj", obj);
		databaseService.save(obj);
		return  mav;
	}
}