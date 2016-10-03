package net.iharding.modules.meta.controller;

import net.iharding.Constants;
import net.iharding.modules.meta.model.Dataset;
import net.iharding.modules.meta.model.Database;
import net.iharding.modules.meta.service.DatabaseService;
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
* @ClassName: Database
* @Description: DatabaseController
* @author Joe.zhang
* @date  2016-5-18 14:08:46
*
*/
@Controller
@RequestMapping("/meta/Database")
public class DatabaseController extends BaseController<Database>{

	{
		editView = "/meta/Database/edit";
		listView = "/meta/Database/list";
		showView = "/meta/Database/show";
	}
	
	@Autowired
	private DatabaseService databaseService;
	
	@Autowired
	private MetaCommentService commentService;
	
	@Autowired
	private FavoriteService favoriteService;
	
	@Autowired
	private OwnerService ownerService;
	
	@Autowired
	private WatchService watchService;
	
	@RequestMapping(method = RequestMethod.POST, value = "/saveDatabase")
	public ModelAndView saveDatabase(Database cobj) throws Exception {
		Database obj = databaseService.get(cobj.getId());
		obj.setRemark(cobj.getRemark());
		for(Dataset table:obj.getTables()){
			table.setDatasetPname(request.getParameter("tablePname_"+table.getId()));
			table.setRemark(request.getParameter("remark_"+table.getId()));
		}
		ModelAndView mav = new ModelAndView(showView);
		mav.addObject("obj", obj);
		databaseService.save(obj);
		return  mav;
	}
	
	
	@RequestMapping(value = "/show/{id}")
	public ModelAndView show(@PathVariable("id") Long id) throws Exception{
		Database object = databaseService.get(id);
		ModelAndView mav = new ModelAndView(showView);
		mav.addObject("obj", object);
		User cuser = UserUtil.getCurrentUser();
		mav.addObject("favorite", favoriteService.getFavorite(cuser, Constants.OBJECT_TYPE_DATABASE, object.getId()));
		mav.addObject("favoriteNum", favoriteService.getFavoriteNum(Constants.OBJECT_TYPE_DATABASE, object.getId()));
		mav.addObject("watch", watchService.getWatch(cuser, Constants.OBJECT_TYPE_DATABASE, object.getId()));
		mav.addObject("watchNum", watchService.getWatchNum(Constants.OBJECT_TYPE_DATABASE, object.getId()));
		mav.addObject("owner", ownerService.getOwner(cuser, Constants.OBJECT_TYPE_DATABASE, object.getId()));
		mav.addObject("ownerNum", ownerService.getOwnerNum(Constants.OBJECT_TYPE_DATABASE, object.getId()));
		mav.addObject("commentNum", commentService.getCommentNum(Constants.OBJECT_TYPE_DATABASE, object.getId()));
		return mav;
	}
}