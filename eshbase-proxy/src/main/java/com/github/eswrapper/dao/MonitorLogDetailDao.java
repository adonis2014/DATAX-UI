package com.github.eswrapper.dao;

import java.util.List;

import org.guess.core.orm.EntityDao;
import org.guess.core.orm.Page;
import org.guess.core.orm.PropertyFilter;

import com.github.eswrapper.model.MonitorLogDetail;

/**
* 
* @ClassName: MonitorLogDetail
* @Description: MonitorLogDetaildao
* @author Joe.zhang
* @date  2016-8-5 11:36:13
*
*/
public interface MonitorLogDetailDao extends EntityDao<MonitorLogDetail, Long>{

	Page<MonitorLogDetail> findFilterPage(Page<MonitorLogDetail> page, List<PropertyFilter> filters);

	Page<MonitorLogDetail> find(Page<MonitorLogDetail> page, String success, String failure, String search_GTD_logTime, String search_LTD_logTime);
	
}
