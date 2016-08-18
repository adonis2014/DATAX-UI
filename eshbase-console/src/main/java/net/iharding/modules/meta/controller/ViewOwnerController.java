package net.iharding.modules.meta.controller;

import net.iharding.modules.meta.model.ViewOwner;
import net.iharding.modules.meta.service.OwnerService;
import net.iharding.modules.meta.service.ViewOwnerService;

import org.guess.core.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: Owner
* @Description: OwnerController
* @author Joe.zhang
* @date  2016-5-18 14:17:31
*
*/
@Controller
@RequestMapping("/meta/Owner")
public class ViewOwnerController extends BaseController<ViewOwner>{

	{
		editView = "/meta/Owner/edit";
		listView = "/meta/Owner/list";
		showView = "/meta/Owner/show";
	}
	
	@Autowired
	private OwnerService ownerService;
	
	@Autowired
	private ViewOwnerService viewOwnerService;
}