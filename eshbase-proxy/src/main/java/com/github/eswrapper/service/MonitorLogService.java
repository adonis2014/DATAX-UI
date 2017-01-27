package com.github.eswrapper.service;

import java.util.Set;

import org.guess.core.service.BaseService;

import com.github.eswrapper.model.MonitorLog;
import com.github.eswrapper.model.MonitorLogDetail;

/**
* 
* @ClassName: MonitorLog
* @Description: MonitorLogservice
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
public interface MonitorLogService extends BaseService<MonitorLog, Long>{
/**
 * 保存完整日志信息
 * @param log
 * @param logDetails
 */
	public void saveLogs(MonitorLog log,Set<MonitorLogDetail> logDetails);
}
