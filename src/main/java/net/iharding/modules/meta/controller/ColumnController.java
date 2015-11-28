package net.iharding.modules.meta.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.meta.model.Column;
import net.iharding.modules.meta.service.ColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: Column
* @Description: ColumnController
* @author renzp
* @date 2014-8-5 下午02:04:46
*
*/
@Controller
@RequestMapping("/meta/column")
public class ColumnController extends BaseController<Column>{

	{
		editView = "/meta/column/edit";
		listView = "/meta/column/list";
		showView = "/meta/column/show";
	}
	
	@Autowired
	private ColumnService columnService;
}