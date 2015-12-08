package net.iharding.modules.meta.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.meta.model.DataSource;
import net.iharding.modules.meta.service.DataSourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: DataSource
* @Description: DataSourceController
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Controller
@RequestMapping("/meta/DataSource")
public class DataSourceController extends BaseController<DataSource>{

	{
		editView = "/meta/DataSource/edit";
		listView = "/meta/DataSource/list";
		showView = "/meta/DataSource/show";
	}
	
	@Autowired
	private DataSourceService dataSourceService;
}