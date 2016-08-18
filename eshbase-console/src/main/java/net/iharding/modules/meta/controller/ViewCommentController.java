package net.iharding.modules.meta.controller;

import net.iharding.modules.meta.model.ViewComment;
import net.iharding.modules.meta.service.MetaCommentService;
import net.iharding.modules.meta.service.ViewCommentService;

import org.guess.core.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 
* @ClassName: Comment
* @Description: CommentController
* @author Joe.zhang
* @date  2016-5-18 14:14:12
*
*/
@Controller
@RequestMapping("/meta/Comment")
public class ViewCommentController extends BaseController<ViewComment>{

	{
		editView = "/meta/Comment/edit";
		listView = "/meta/Comment/list";
		showView = "/meta/Comment/show";
	}
	
	@Autowired
	private ViewCommentService viewCommentService;
	
	@Autowired
	private MetaCommentService commentService;
}