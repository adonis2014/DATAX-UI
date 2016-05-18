package net.iharding.modules.meta.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.meta.model.Watch;
import net.iharding.modules.meta.service.WatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: Watch
* @Description: WatchController
* @author Joe.zhang
* @date  2016-5-18 14:18:11
*
*/
@Controller
@RequestMapping("/meta/watch")
public class WatchController extends BaseController<Watch>{

	{
		editView = "/meta/watch/edit";
		listView = "/meta/watch/list";
		showView = "/meta/watch/show";
	}
	
	@Autowired
	private WatchService watchService;
}