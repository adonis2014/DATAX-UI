package net.iharding.modules.meta.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.meta.model.DbColumn;
import net.iharding.modules.meta.service.DbColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}