package net.iharding.modules.sys.controller;

import java.util.List;

import org.guess.core.Constants;
import org.guess.core.web.BaseController;
import org.guess.sys.model.Resource;

import net.iharding.modules.sys.model.Dict;
import net.iharding.modules.sys.service.DictService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
* 
* @ClassName: Dict
* @Description: DictController
* @author Joe.zhang
* @date  2015-12-23 17:38:16
*
*/
@Controller
@RequestMapping("/sys/dict")
public class DictController extends BaseController<Dict>{

	{
		editView = "/sys/dict/edit";
		listView = "/sys/dict/list";
		showView = "/sys/dict/show";
	}
	
	@Autowired
	private DictService dictService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/tree")
	@ResponseBody
	public List<Dict> tree() throws Exception {
		List<Dict> res = dictService.getAll();
		return res;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/showTree")
	@ResponseBody
	public List<Dict> showTree() throws Exception {
		List<Dict> res = dictService.getAll();
		return res;
	}

	@Override
	public ModelAndView create() throws Exception {
		ModelAndView mav = new ModelAndView(editView);
		return mav;
	}

	@Override
	public ModelAndView update(@PathVariable("id") Long id) throws Exception {
		ModelAndView mav = new ModelAndView(editView);
		Dict obj = dictService.get(id);
		mav.addObject("obj", obj);
		return mav;
	}

	@Override
	public String create(Dict object) throws Exception {
		return super.create(object);
	}
}