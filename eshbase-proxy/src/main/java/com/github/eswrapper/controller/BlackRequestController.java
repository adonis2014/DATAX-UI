package com.github.eswrapper.controller;

import org.guess.core.web.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.eswrapper.model.BlackRequest;

@Controller
@RequestMapping("/blackfilter")
public class BlackRequestController extends BaseController<BlackRequest>{
	{
		listView = "/es/blackfilter/list";
		showView = "/es/blackfilter/show";
	}
}
