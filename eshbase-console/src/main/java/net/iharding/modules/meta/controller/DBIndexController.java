package net.iharding.modules.meta.controller;

import java.util.Date;

import javax.validation.Valid;

import net.iharding.Constants;
import net.iharding.modules.meta.model.DBIndex;
import net.iharding.modules.meta.service.DBIndexService;
import net.iharding.modules.meta.service.DbColumnService;
import net.iharding.modules.meta.service.FavoriteService;
import net.iharding.modules.meta.service.MetaCommentService;
import net.iharding.modules.meta.service.OwnerService;
import net.iharding.modules.meta.service.WatchService;

import org.guess.core.web.BaseController;
import org.guess.sys.model.User;
import org.guess.sys.service.UserService;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
* 
* @ClassName: DBIndex
* @Description: DBIndexController
* @author Joe.zhang
* @date  2015-12-8 12:00:37
*
*/
@Controller
@RequestMapping("/meta/DBIndex")
public class DBIndexController extends BaseController<DBIndex>{

	{
		editView = "/meta/DBIndex/edit";
		listView = "/meta/DBIndex/list";
		showView = "/meta/DBIndex/show";
	}
	
	@Autowired
	private DBIndexService dbindexService;
	@Autowired
	private UserService userService;
	
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
	/**
	 * 添加
	 * @param object
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/edit")
	public String create(@Valid DBIndex object) throws Exception {
		dbindexService.save(object);
		return REDIRECT + listView;
	}
	
	/**
	 * 跳转到更新页面
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/update/{id}")
	public ModelAndView update(@PathVariable("id") Long id) throws Exception {
		DBIndex obj = dbindexService.get(id);
		ModelAndView mav = new ModelAndView(editView);
		mav.addObject("obj", obj);
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/setCheckLabel/{id}")
	public String setCheckLabel(@PathVariable("id") Long id) throws Exception {
		DBIndex obj = dbindexService.get(id);
		if (obj.getCheckLabel()==0){
			obj.setCheckLabel(1);
		}else{
			obj.setCheckLabel(0);
		}
		obj.setUpdateDate(new Date());
		obj.setUpdater(UserUtil.getCurrentUser());
		dbindexService.save(obj);
		return this.list();
	}
	
	@RequestMapping(value = "/show/{id}")
	public ModelAndView show(@PathVariable("id") Long id) throws Exception{
		DBIndex object = dbindexService.get(id);
		ModelAndView mav = new ModelAndView(showView);
		mav.addObject("obj", object);
		User cuser = UserUtil.getCurrentUser();
		mav.addObject("favorite", favoriteService.getFavorite(cuser, Constants.OBJECT_TYPE_DBINDEX, object.getId()));
		mav.addObject("favoriteNum", favoriteService.getFavoriteNum(Constants.OBJECT_TYPE_DBINDEX, object.getId()));
		mav.addObject("watch", watchService.getWatch(cuser, Constants.OBJECT_TYPE_DBINDEX, object.getId()));
		mav.addObject("watchNum", watchService.getWatchNum(Constants.OBJECT_TYPE_DBINDEX, object.getId()));
		mav.addObject("owner", ownerService.getOwner(cuser, Constants.OBJECT_TYPE_DBINDEX, object.getId()));
		mav.addObject("ownerNum", ownerService.getOwnerNum(Constants.OBJECT_TYPE_DBINDEX, object.getId()));
		mav.addObject("commentNum", commentService.getCommentNum(Constants.OBJECT_TYPE_DBINDEX, object.getId()));
		return mav;
	}
	
}