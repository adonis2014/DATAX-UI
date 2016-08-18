package net.iharding.modules.meta.controller;

import net.iharding.modules.meta.model.ViewWatch;
import net.iharding.modules.meta.service.ViewWatchService;
import net.iharding.modules.meta.service.WatchService;

import org.guess.core.web.BaseController;
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
@RequestMapping("/meta/Watch")
public class ViewWatchController extends BaseController<ViewWatch>{

	{
		editView = "/meta/Watch/edit";
		listView = "/meta/Watch/list";
		showView = "/meta/Watch/show";
	}
	
	@Autowired
	private WatchService watchService;
	
	@Autowired
	private ViewWatchService viewWatchService;
}