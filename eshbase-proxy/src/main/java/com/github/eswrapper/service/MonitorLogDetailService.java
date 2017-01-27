package com.github.eswrapper.service;

import java.util.List;

import org.guess.core.orm.Page;
import org.guess.core.orm.PropertyFilter;
import org.guess.core.service.BaseService;

import com.github.eswrapper.model.MonitorLogDetail;

/**
* 
* @ClassName: MonitorLogDetail
* @Description: MonitorLogDetailservice
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
public interface MonitorLogDetailService extends BaseService<MonitorLogDetail, Long>{

	Page<MonitorLogDetail> findFilterPage(Page<MonitorLogDetail> page, List<PropertyFilter> buildFromHttpRequest);

	Page<MonitorLogDetail> find(Page<MonitorLogDetail> page, String success, String failure, String search_GTD_logTime, String search_LTD_logTime);

}
