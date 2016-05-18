package net.iharding.modules.meta.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.meta.model.MetaProperty;
import net.iharding.modules.meta.service.MetaPropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: MetaProperty
* @Description: MetaPropertyController
* @author Joe.zhang
* @date  2016-5-18 14:20:22
*
*/
@Controller
@RequestMapping("/meta/metaProperty")
public class MetaPropertyController extends BaseController<MetaProperty>{

	{
		editView = "/meta/metaProperty/edit";
		listView = "/meta/metaProperty/list";
		showView = "/meta/metaProperty/show";
	}
	
	@Autowired
	private MetaPropertyService metaPropertyService;
}