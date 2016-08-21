package net.iharding.modules.meta.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.iharding.modules.meta.model.Owner;
import net.iharding.modules.meta.model.ViewFavorite;
import net.iharding.modules.meta.model.ViewOwner;
import net.iharding.modules.meta.service.OwnerService;
import net.iharding.modules.meta.service.ViewOwnerService;

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
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	@ResponseBody
	public String saveOwner(@RequestParam("objectType") int objectType, @RequestParam("objectId") long objectId){
		User cuser=UserUtil.getCurrentUser();
		Owner owner=ownerService.getOwner(cuser, objectType, objectId);
		try {
			if (owner==null){
				owner=new Owner();
				owner.setObjectId(objectId);
				owner.setObjectType(objectType);
				owner.setCreateDate(new Date());
				owner.setUser(UserUtil.getCurrentUser());
				ownerService.save(owner);
			}else{
				ownerService.remove(owner);
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
	public @ResponseBody Map<String,Object> page(Page<ViewOwner> page,HttpServletRequest request){
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
		Page<ViewOwner> pageData = viewOwnerService.findPage(page, pfs);
		return pageData.returnMap();
	}
}