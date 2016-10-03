package net.iharding.modules.etl.dao.impl;

import java.util.List;

import org.guess.core.orm.hibernate.HibernateDao;

import net.iharding.modules.etl.dao.TaskColumnDao;
import net.iharding.modules.etl.model.TaskColumn;

import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: TaskColumn
* @Description: TaskColumndaoImpl
* @author Joe.zhang
* @date  2016-4-3 23:30:55
*
*/
@Repository
public class TaskColumnDaoImpl extends HibernateDao<TaskColumn,Long> implements TaskColumnDao {

	@Override
	public List<TaskColumn> getTaskColumns(Long readTaskId) {
		return this.findBy("readTaskId", readTaskId);
	}

}
