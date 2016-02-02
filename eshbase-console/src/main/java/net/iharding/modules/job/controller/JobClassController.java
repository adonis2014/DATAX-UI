package net.iharding.modules.job.controller;

import java.util.Date;

import net.iharding.modules.job.model.JobClass;
import net.iharding.modules.job.service.JobClassService;

import org.guess.core.web.BaseController;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
* 
* @ClassName: JobClass
* @Description: JobClassController
* @author Joe.zhang
* @date  2016-1-31 16:56:20
*
*/
@Controller
@RequestMapping("/job/JobClass")
public class JobClassController extends BaseController<JobClass>{

	{
		editView = "/job/JobClass/edit";
		listView = "/job/JobClass/list";
		showView = "/job/JobClass/show";
	}
	
	@Autowired
	private JobClassService jobClassService;
	
	@RequestMapping(method = RequestMethod.POST, value = "setCheckLabel")
	@ResponseBody
	public int setCheckLabel(@RequestParam("id") Long id) throws Exception {
		JobClass obj = jobClassService.get(id);
		if (obj.getCheckLabel()==null || obj.getCheckLabel()==0){
			obj.setCheckLabel(1);
		}else{
			obj.setCheckLabel(0);
		}
		obj.setUpdateDate(new Date());
		obj.setUpdater(UserUtil.getCurrentUser());
		jobClassService.save(obj);
		return obj.getCheckLabel();
	}
}