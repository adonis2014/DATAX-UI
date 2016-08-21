package net.iharding.modules.meta.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.iharding.modules.meta.model.MetaComment;
import net.iharding.modules.meta.model.ViewComment;
import net.iharding.modules.meta.service.MetaCommentService;
import net.iharding.modules.meta.service.ViewCommentService;

import org.apache.commons.lang.StringUtils;
import org.guess.core.orm.Page;
import org.guess.core.orm.PropertyFilter;
import org.guess.core.web.BaseController;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	@ResponseBody
	public String saveComment(@RequestParam("objectType") int objectType, @RequestParam("objectId") long objectId,@RequestParam("commentStr")String commentStr){
		MetaComment comment=new MetaComment();
		comment.setObjectId(objectId);
		comment.setObjectType(objectType);
		comment.setCreateDate(new Date());
		comment.setUser(UserUtil.getCurrentUser());
		comment.setComment(commentStr);
		try {
			commentService.save(comment);
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
	public @ResponseBody Map<String,Object> page(Page<ViewComment> page,HttpServletRequest request){
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
		Page<ViewComment> pageData = viewCommentService.findPage(page, pfs);
		return pageData.returnMap();
	}
	
	/**
	 * 展示
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/showObj/{objectType}/{id}")
	public String showObj(@PathVariable("objectType") Integer objectType,@PathVariable("id") Long objectId) throws Exception{
		switch(objectType){
		case 0:
			return REDIRECT+"/meta/DataSource/show/"+objectId;
		case 1:
			return REDIRECT+"/meta/Database/show/"+objectId;
		case 2:
			return REDIRECT+"/meta/DBTable/show/"+objectId;
		case 3:
			return REDIRECT+"/meta/DBIndex/show/"+objectId;
		case 4:
			return REDIRECT+"/meta/DBColumn/show/"+objectId;
		case 10:
			return REDIRECT+"/meta/Project/show/"+objectId;
		case 11:
			return REDIRECT+"/meta/Module/show/"+objectId;
		case 12:
			return REDIRECT+"/job/JobWorker/show/"+objectId;
		default:
			return REDIRECT+"";
		}	
	}
}