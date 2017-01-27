package com.github.eswrapper.controller;

import org.guess.core.web.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.eswrapper.model.SlowLog;

@Controller
@RequestMapping("/esSlowlog")
public class SlowLogController  extends BaseController<SlowLog>{
	
	{
		listView = "/es/slowlog/list";
		showView = "/es/slowlog/show";
	}
}
