package net.iharding.modules.meta.controller;

import net.iharding.Constants;
import net.iharding.modules.meta.model.DbColumn;
import net.iharding.modules.meta.service.DbColumnService;
import net.iharding.modules.meta.service.FavoriteService;
import net.iharding.modules.meta.service.MetaCommentService;
import net.iharding.modules.meta.service.OwnerService;
import net.iharding.modules.meta.service.WatchService;

import org.guess.core.web.BaseController;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
* 
* @ClassName: DbColumn
* @Description: DbColumnController
* @author Joe.zhang
* @date  2015-12-3 16:35:17
*
*/
@Controller
@RequestMapping("/meta/DBColumn")
public class DbColumnController extends BaseController<DbColumn>{

	{
		editView = "/meta/DBColumn/edit";
		listView = "/meta/DBColumn/list";
		showView = "/meta/DBColumn/show";
	}
	
	@Autowired
	private DbColumnService dbColumnService;
	@Autowired
	private MetaCommentService commentService;
	
	@Autowired
	private FavoriteService favoriteService;
	
	@Autowired
	private OwnerService ownerService;
	
	@Autowired
	private WatchService watchService;
	@RequestMapping(method = RequestMethod.GET, value = "/setCheckLabel/{id}")
	public String setCheckLabel(@PathVariable("id") Long id) throws Exception {
		DbColumn obj = dbColumnService.get(id);
		if (obj.getCheckLabel()==0){
			obj.setCheckLabel(1);
		}else{
			obj.setCheckLabel(0);
		}
		dbColumnService.save(obj);
		return this.list();
	}
	
	@RequestMapping(value = "/show/{id}")
	public ModelAndView show(@PathVariable("id") Long id) throws Exception{
		DbColumn object = dbColumnService.get(id);
		ModelAndView mav = new ModelAndView(showView);
		mav.addObject("obj", object);
		User cuser = UserUtil.getCurrentUser();
		mav.addObject("favorite", favoriteService.getFavorite(cuser, Constants.OBJECT_TYPE_COLUMN, object.getId()));
		mav.addObject("favoriteNum", favoriteService.getFavoriteNum(Constants.OBJECT_TYPE_COLUMN, object.getId()));
		mav.addObject("watch", watchService.getWatch(cuser, Constants.OBJECT_TYPE_COLUMN, object.getId()));
		mav.addObject("watchNum", watchService.getWatchNum(Constants.OBJECT_TYPE_COLUMN, object.getId()));
		mav.addObject("owner", ownerService.getOwner(cuser, Constants.OBJECT_TYPE_COLUMN, object.getId()));
		mav.addObject("ownerNum", ownerService.getOwnerNum(Constants.OBJECT_TYPE_COLUMN, object.getId()));
		mav.addObject("commentNum", commentService.getCommentNum(Constants.OBJECT_TYPE_COLUMN, object.getId()));
		return mav;
	}
}