package com.github.eswrapper.service.impl;

import java.util.List;

import org.guess.core.orm.Page;
import org.guess.core.orm.PropertyFilter;
import org.guess.core.service.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.eswrapper.dao.MonitorLogDetailDao;
import com.github.eswrapper.model.MonitorLogDetail;
import com.github.eswrapper.service.MonitorLogDetailService;

/**
* 
* @ClassName: MonitorLogDetail
* @Description: MonitorLogDetailserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class MonitorLogDetailServiceImpl extends BaseServiceImpl<MonitorLogDetail, Long> implements MonitorLogDetailService {
	@Autowired
	private MonitorLogDetailDao monitorLogDetaildao;
	@Override
	public Page<MonitorLogDetail> findFilterPage(Page<MonitorLogDetail> page, List<PropertyFilter> filters) {
//		PropertyFilter pf=new PropertyFilter("search_LT_clusterName","NULL");
//		filters.add(pf);
		return monitorLogDetaildao.findFilterPage(page, filters);
	}
	@Override
	public Page<MonitorLogDetail> find(Page<MonitorLogDetail> page, String success, String failure, String search_GTD_logTime, String search_LTD_logTime) {
		return monitorLogDetaildao.find(page, success,failure,search_GTD_logTime,search_LTD_logTime);
	}

}
