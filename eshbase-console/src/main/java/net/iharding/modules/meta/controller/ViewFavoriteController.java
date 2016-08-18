package net.iharding.modules.meta.controller;

import net.iharding.modules.meta.model.ViewFavorite;
import net.iharding.modules.meta.service.FavoriteService;
import net.iharding.modules.meta.service.ViewFavoriteService;

import org.guess.core.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}