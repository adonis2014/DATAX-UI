package net.iharding.modules.meta.controller;

import net.iharding.modules.meta.model.DataModel;
import net.iharding.modules.meta.service.DataSourceService;
import net.iharding.modules.meta.service.DatabaseService;
import net.iharding.modules.meta.service.DatasetService;
import net.iharding.modules.meta.service.FavoriteService;
import net.iharding.modules.meta.service.MetaCommentService;
import net.iharding.modules.meta.service.OwnerService;
import net.iharding.modules.meta.service.WatchService;

import org.guess.core.web.BaseController;
import org.guess.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/meta/DataModel")
public class DataModelController extends BaseController<DataModel>{
	{
		editView = "/meta/DataModel/edit";
		listView = "/meta/DataModel/list";
		showView = "/meta/DataModel/show";
	}
	
	@Autowired
	private DataSourceService dataSourceService;
	
	@Autowired
	private DatabaseService databaseService;
	
	@Autowired
	private DatasetService datasetService;
	
	@Autowired
	private UserService userService;
	@Autowired
	private MetaCommentService commentService;
	
	@Autowired
	private FavoriteService favoriteService;
	
	@Autowired
	private OwnerService ownerService;
	
	@Autowired
	private WatchService watchService;
	
	
}
