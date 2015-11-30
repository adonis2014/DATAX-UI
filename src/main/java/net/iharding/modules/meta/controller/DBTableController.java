package net.iharding.modules.meta.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.meta.model.DBTable;
import net.iharding.modules.meta.service.DBTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: DBTable
* @Description: DBTableController
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Controller
@RequestMapping("/meta/dBTable")
public class DBTableController extends BaseController<DBTable>{

	{
		editView = "/meta/dBTable/edit";
		listView = "/meta/dBTable/list";
		showView = "/meta/dBTable/show";
	}
	
	@Autowired
	private DBTableService dBTableService;
}