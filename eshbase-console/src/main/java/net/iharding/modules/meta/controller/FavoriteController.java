package net.iharding.modules.meta.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.meta.model.Favorite;
import net.iharding.modules.meta.service.FavoriteService;
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
@RequestMapping("/meta/favorite")
public class FavoriteController extends BaseController<Favorite>{

	{
		editView = "/meta/favorite/edit";
		listView = "/meta/favorite/list";
		showView = "/meta/favorite/show";
	}
	
	@Autowired
	private FavoriteService favoriteService;
}