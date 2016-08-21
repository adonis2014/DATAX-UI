package net.iharding.modules.meta.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.iharding.modules.meta.model.ViewWatch;
import net.iharding.modules.meta.model.Watch;
import net.iharding.modules.meta.service.ViewWatchService;
import net.iharding.modules.meta.service.WatchService;

import org.apache.commons.lang.StringUtils;
import org.guess.core.orm.Page;
import org.guess.core.orm.PropertyFilter;
import org.guess.core.web.BaseController;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	@ResponseBody
	public String saveWatch(@RequestParam("objectType") int objectType, @RequestParam("objectId") long objectId){
		User cuser=UserUtil.getCurrentUser();
		Watch watch=watchService.getWatch(cuser, objectType, objectId);
		try {
			if (watch==null){
				 watch=new Watch();
				watch.setObjectId(objectId);
				watch.setObjectType(objectType);
				watch.setCreateDate(new Date());
				watch.setUser(UserUtil.getCurrentUser());
				watchService.save(watch);
			}else{
				watchService.remove(watch);
				return "2";
			}
		} catch (Exception e) {
			return "0";
		}
		return "1";
	}
	
	/**
	 * 返回分页json数据
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping("/page")
	public @ResponseBody Map<String,Object> page(Page<ViewWatch> page,HttpServletRequest request){
		List<PropertyFilter> pfs= PropertyFilter.buildFromHttpRequest(request, "search");
		if (StringUtils.isNotEmpty(request.getParameter("objectId"))){
			PropertyFilter pf1=new PropertyFilter("EQL_objectId",request.getParameter("objectId"));
			PropertyFilter pf2=new PropertyFilter("EQI_objectType",request.getParameter("objectType"));
			pfs.add(pf1);
			pfs.add(pf2);
		}
		if (StringUtils.isNotEmpty(request.getParameter("userId"))){
			PropertyFilter pf3=new PropertyFilter("EQL_userId",UserUtil.getCurrentUser().getId().toString());
			pfs.add(pf3);
		}
		page.setOrderBy("createDate");
		page.setOrderDir("desc");
		Page<ViewWatch> pageData = viewWatchService.findPage(page, pfs);
		return pageData.returnMap();
	}
}