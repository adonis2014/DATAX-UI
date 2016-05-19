package net.iharding.modules.meta.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.meta.model.MetaComment;
import net.iharding.modules.meta.service.MetaCommentService;
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
public class MetaCommentController extends BaseController<MetaComment>{

	{
		editView = "/meta/Comment/edit";
		listView = "/meta/Comment/list";
		showView = "/meta/Comment/show";
	}
	
	@Autowired
	private MetaCommentService commentService;
}