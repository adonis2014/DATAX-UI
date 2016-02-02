package net.iharding.modules.job.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import net.iharding.modules.job.model.RegCenter;
import net.iharding.modules.job.service.RegCenterService;

import org.guess.core.web.BaseController;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangdang.ddframe.job.console.domain.RegistryCenterClient;

/**
 * 
 * @ClassName: RegCenter
 * @Description: RegCenterController
 * @author Joe.zhang
 * @date 2016-1-31 17:15:41
 * 
 */
@Controller
@RequestMapping("/job/RegCenter")
public class RegCenterController extends BaseController<RegCenter> {

	public static final String CURATOR_CLIENT_KEY = "curator_client_key";

	{
		editView = "/job/RegCenter/edit";
		listView = "/job/RegCenter/list";
		showView = "/job/RegCenter/show";
	}

	@Autowired
	private RegCenterService regCenterService;

	/**
	 * 添加注册中心
	 * 
	 * @param object
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/edit")
	public String create(@Valid RegCenter object) throws Exception {
		regCenterService.save(object);
		return REDIRECT + listView;
	}

	/**
	 * 连接注册中心对应的zkServer,获取调度作业信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "connect", method = RequestMethod.POST)
	public boolean connect(@RequestParam("id") Long id) {
		setClientToSession(regCenterService.connect(id), session);
		return true;
	}

	private boolean setClientToSession(final RegistryCenterClient client, final HttpSession session) {
		boolean result = client.isConnected();
		if (result) {
			session.setAttribute(CURATOR_CLIENT_KEY, client);
		}
		return result;
	}
	
}