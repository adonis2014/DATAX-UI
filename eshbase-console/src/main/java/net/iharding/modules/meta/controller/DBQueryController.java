package net.iharding.modules.meta.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/meta/DBQuery")
public class DBQueryController {

	@Autowired
	protected HttpServletRequest request;
	
	@Autowired
	protected HttpSession session;
	
	protected String 	queryView = "/meta/DBQuery/queryAdvance";
	protected String 	listView = "/meta/DBQuery/list";
	protected String 	showView = "/meta/DBQuery/show";
	
	public DBQueryController() {
	}
	
	@RequestMapping(value = "/list")
	public String list(){
		return listView;
	}

}
