package net.iharding.modules.meta.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.meta.model.DBIndex;
import net.iharding.modules.meta.service.DBIndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: DBIndex
* @Description: DBIndexController
* @author Joe.zhang
* @date  2015-12-8 12:00:37
*
*/
@Controller
@RequestMapping("/meta/dbindex")
public class DBIndexController extends BaseController<DBIndex>{

	{
		editView = "/meta/DBIndex/edit";
		listView = "/meta/DBIndex/list";
		showView = "/meta/DBIndex/show";
	}
	
	@Autowired
	private DBIndexService dBIndexService;
}