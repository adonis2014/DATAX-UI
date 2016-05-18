package net.iharding.modules.meta.controller;

import org.guess.core.web.BaseController;
import net.iharding.modules.meta.model.Comment;
import net.iharding.modules.meta.service.CommentService;
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
@RequestMapping("/meta/comment")
public class CommentController extends BaseController<Comment>{

	{
		editView = "/meta/comment/edit";
		listView = "/meta/comment/list";
		showView = "/meta/comment/show";
	}
	
	@Autowired
	private CommentService commentService;
}