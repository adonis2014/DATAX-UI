package com.github.eswrapper.service.impl;

import java.util.Set;

import org.guess.core.service.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.eswrapper.dao.MonitorLogDao;
import com.github.eswrapper.dao.MonitorLogDetailDao;
import com.github.eswrapper.model.MonitorLog;
import com.github.eswrapper.model.MonitorLogDetail;
import com.github.eswrapper.service.MonitorLogService;

/**
* 
* @ClassName: MonitorLog
* @Description: MonitorLogserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class MonitorLogServiceImpl extends BaseServiceImpl<MonitorLog, Long> implements MonitorLogService {
	@Autowired
	private MonitorLogDao monitorLogDao;
	@Autowired
	private MonitorLogDetailDao monitorLogDetailDao;
	
	@Override
	@Transactional
	public void saveLogs(MonitorLog log, Set<MonitorLogDetail> logDetails) {
		try {
			this.save(log);
			for(MonitorLogDetail logDetail:logDetails){
				logDetail.setLog(log);
				monitorLogDetailDao.save(logDetail);
			}
			log.setLogDetails(logDetails);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
