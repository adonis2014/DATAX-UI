package net.iharding.modules.meta.controller;

import java.util.Date;

import javax.validation.Valid;

import net.iharding.Constants;
import net.iharding.modules.meta.model.Dataset;
import net.iharding.modules.meta.model.DbColumn;
import net.iharding.modules.meta.service.DatasetService;
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
* @ClassName: DBTable
* @Description: DBTableController
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Controller
@RequestMapping("/meta/Dataset")
public class DatasetController extends BaseController<Dataset>{

	{
		editView = "/meta/Dataset/edit";
		listView = "/meta/Dataset/list";
		showView = "/meta/Dataset/show";
	}
	
	@Autowired
	private DatasetService dbTableService;
	
	@Autowired
	private UserService userService;
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
	public String create(@Valid Dataset object) throws Exception {
		dbTableService.save(object);
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
		Dataset obj = dbTableService.get(id);
		ModelAndView mav = new ModelAndView(editView);
		mav.addObject("obj", obj);
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/setCheckLabel/{id}")
	public String setCheckLabel(@PathVariable("id") Long id) throws Exception {
		Dataset obj = dbTableService.get(id);
		if (obj.getCheckLabel()==0){
			obj.setCheckLabel(1);
		}else{
			obj.setCheckLabel(0);
		}
		obj.setUpdateDate(new Date());
		obj.setUpdater(UserUtil.getCurrentUser());
		dbTableService.save(obj);
		return this.list();
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/saveTable")
	public ModelAndView saveTable(Dataset cobj) throws Exception {
		Dataset obj = dbTableService.get(cobj.getId());
		obj.setRemark(cobj.getRemark());
		obj.setDatasetPname(cobj.getDatasetPname());
		obj.setDatasetType(cobj.getDatasetType());
		for(DbColumn column:obj.getColumns()){
			column.setColumnPname(request.getParameter("columnPname_"+column.getId()));
			column.setRemark(request.getParameter("remark_"+column.getId()));
		}
		ModelAndView mav = new ModelAndView(showView);
		mav.addObject("obj", obj);
		dbTableService.save(obj);
		return  mav;
	}
	
	@RequestMapping(value = "/show/{id}")
	public ModelAndView show(@PathVariable("id") Long id) throws Exception{
		Dataset object = dbTableService.get(id);
		ModelAndView mav = new ModelAndView(showView);
		mav.addObject("obj", object);
		User cuser = UserUtil.getCurrentUser();
		mav.addObject("favorite", favoriteService.getFavorite(cuser, Constants.OBJECT_TYPE_DBTABLE, object.getId()));
		mav.addObject("favoriteNum", favoriteService.getFavoriteNum(Constants.OBJECT_TYPE_DBTABLE, object.getId()));
		mav.addObject("watch", watchService.getWatch(cuser, Constants.OBJECT_TYPE_DBTABLE, object.getId()));
		mav.addObject("watchNum", watchService.getWatchNum(Constants.OBJECT_TYPE_DBTABLE, object.getId()));
		mav.addObject("owner", ownerService.getOwner(cuser, Constants.OBJECT_TYPE_DBTABLE, object.getId()));
		mav.addObject("ownerNum", ownerService.getOwnerNum(Constants.OBJECT_TYPE_DBTABLE, object.getId()));
		mav.addObject("commentNum", commentService.getCommentNum(Constants.OBJECT_TYPE_DBTABLE, object.getId()));
		return mav;
	}
}