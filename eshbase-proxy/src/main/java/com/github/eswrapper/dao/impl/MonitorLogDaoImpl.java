package com.github.eswrapper.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import com.github.eswrapper.dao.MonitorLogDao;
import com.github.eswrapper.model.MonitorLog;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: MonitorLog
* @Description: MonitorLogdaoImpl
* @author Joe.zhang
* @date  2016-8-5 11:30:18
*
*/
@Repository
public class MonitorLogDaoImpl extends HibernateDao<MonitorLog,Long> implements MonitorLogDao {

}
