package com.github.esadmin.meta.controller;

import com.github.esadmin.meta.model.DbColumn;
import com.github.esadmin.meta.service.DbColumnService;

import org.guess.core.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
* 
* @ClassName: DbColumn
* @Description: DbColumnController
* @author Joe.zhang
* @date  2015-12-3 16:35:17
*
*/
@Controller
@RequestMapping("/meta/dbColumn")
public class DbColumnController extends BaseController<DbColumn>{

	{
		editView = "/meta/dbColumn/edit";
		listView = "/meta/dbColumn/list";
		showView = "/meta/dbColumn/show";
	}
	
	@Autowired
	private DbColumnService dbColumnService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/setCheckLabel/{id}")
	public String setCheckLabel(@PathVariable("id") Long id) throws Exception {
		DbColumn obj = dbColumnService.get(id);
		if (obj.getCheckLabel()==0){
			obj.setCheckLabel(1);
		}else{
			obj.setCheckLabel(0);
		}
		dbColumnService.save(obj);
		return this.list();
	}
}