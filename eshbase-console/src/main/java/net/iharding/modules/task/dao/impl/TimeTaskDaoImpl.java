package net.iharding.modules.task.dao.impl;

import net.iharding.modules.task.dao.TimeTaskDao;
import net.iharding.modules.task.model.TimeTask;

import org.guess.core.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: TimeTask
* @Description: TimeTaskdaoImpl
* @author renzp
* @date 2014-8-5 下午02:04:46
*
*/
@Repository
public class TimeTaskDaoImpl extends HibernateDao<TimeTask,Long> implements TimeTaskDao {

}
