package net.iharding.modules.job.controller;

import java.util.Date;

import javax.validation.Valid;

import net.iharding.modules.job.model.RegCenter;
import net.iharding.modules.job.service.RegCenterService;

import org.guess.core.web.BaseController;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
* 
* @ClassName: RegCenter
* @Description: RegCenterController
* @author Joe.zhang
* @date  2016-1-31 17:15:41
*
*/
@Controller
@RequestMapping("/job/RegCenter")
public class RegCenterController extends BaseController<RegCenter>{

	{
		editView = "/job/RegCenter/edit";
		listView = "/job/RegCenter/list";
		showView = "/job/RegCenter/show";
	}
	
	@Autowired
	private RegCenterService regCenterService;
	
	/**
	 * 添加
	 * @param object
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/edit")
	public String create(@Valid RegCenter object) throws Exception {
		regCenterService.save(object);
		return REDIRECT + listView;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/setCheckLabel/{id}")
	public String setCheckLabel(@PathVariable("id") Long id) throws Exception {
		RegCenter obj = regCenterService.get(id);
		if (obj.getCheckLabel()==0){
			obj.setCheckLabel(1);
		}else{
			obj.setCheckLabel(0);
		}
		obj.setUpdateDate(new Date());
		obj.setUpdater(UserUtil.getCurrentUser());
		regCenterService.save(obj);
		return this.list();
	}
}