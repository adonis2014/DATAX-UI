package net.iharding.modules.sys.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.sys.model.Dict;
import net.iharding.modules.sys.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: Dict
* @Description: DictController
* @author Joe.zhang
* @date  2015-12-23 17:38:16
*
*/
@Controller
@RequestMapping("/sys/dict")
public class DictController extends BaseController<Dict>{

	{
		editView = "/sys/dict/edit";
		listView = "/sys/dict/list";
		showView = "/sys/dict/show";
	}
	
	@Autowired
	private DictService dictService;
}