package net.iharding.modules.etl.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.etl.dao.TaskDsDefineDao;
import net.iharding.modules.etl.model.TaskDsDefine;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: TaskDsDefine
* @Description: TaskDsDefinedaoImpl
* @author Joe.zhang
* @date  2016-4-3 23:21:21
*
*/
@Repository
public class TaskDsDefineDaoImpl extends HibernateDao<TaskDsDefine,Long> implements TaskDsDefineDao {

}
