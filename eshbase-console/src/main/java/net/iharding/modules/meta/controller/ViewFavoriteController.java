package net.iharding.modules.meta.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.iharding.modules.meta.model.Favorite;
import net.iharding.modules.meta.model.ViewFavorite;
import net.iharding.modules.meta.service.FavoriteService;
import net.iharding.modules.meta.service.ViewFavoriteService;

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
* @ClassName: Favorite
* @Description: FavoriteController
* @author Joe.zhang
* @date  2016-5-18 14:16:48
*
*/
@Controller
@RequestMapping("/meta/Favorite")
public class ViewFavoriteController extends BaseController<ViewFavorite>{

	{
		editView = "/meta/Favorite/edit";
		listView = "/meta/Favorite/list";
		showView = "/meta/Favorite/show";
	}
	
	@Autowired
	private FavoriteService favoriteService;
	
	@Autowired
	private ViewFavoriteService viewFavoriteService;
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	@ResponseBody
	public String saveFavorite(@RequestParam("objectType") int objectType, @RequestParam("objectId") long objectId){
		User cuser=UserUtil.getCurrentUser();
		Favorite favorite=favoriteService.getFavorite(cuser, objectType, objectId);
		try {
			if (favorite==null){
				favorite=new Favorite();
				favorite.setObjectId(objectId);
				favorite.setObjectType(objectType);
				favorite.setCreateDate(new Date());
				favorite.setUser(UserUtil.getCurrentUser());
				favoriteService.save(favorite);
			}else{
				favoriteService.remove(favorite);
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
	public @ResponseBody Map<String,Object> page(Page<ViewFavorite> page,HttpServletRequest request){
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
		Page<ViewFavorite> pageData = viewFavoriteService.findPage(page, pfs);
		return pageData.returnMap();
	}
}