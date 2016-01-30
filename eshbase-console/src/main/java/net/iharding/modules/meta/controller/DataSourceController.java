package net.iharding.modules.meta.controller;

import java.util.Date;

import net.iharding.modules.meta.model.DataSource;
import net.iharding.modules.meta.service.DataSourceService;

import org.guess.core.web.BaseController;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(method = RequestMethod.GET, value = "/setCheckLabel/{id}")
	public String setCheckLabel(@PathVariable("id") Long id) throws Exception {
		DataSource obj = dataSourceService.get(id);
		if (obj.getCheckLabel()==0){
			obj.setCheckLabel(1);
		}else{
			obj.setCheckLabel(0);
		}
		obj.setUpdateDate(new Date());
		obj.setUpdater(UserUtil.getCurrentUser());
		dataSourceService.save(obj);
		return this.list();
	}
}