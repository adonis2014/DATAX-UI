package net.iharding.modules.sys.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.sys.model.MultiLang;
import net.iharding.modules.sys.service.MultiLangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: MultiLang
* @Description: MultiLangController
* @author Joe.zhang
* @date  2015-12-23 17:50:20
*
*/
@Controller
@RequestMapping("/sys/multilang")
public class MultiLangController extends BaseController<MultiLang>{

	{
		editView = "/sys/multilang/edit";
		listView = "/sys/multilang/list";
		showView = "/sys/multilang/show";
	}
	
	@Autowired
	private MultiLangService multiLangService;
}