package net.iharding.modules.etl.service.impl;

import java.util.List;

import net.iharding.modules.etl.dao.TaskColumnDao;
import net.iharding.modules.etl.model.TaskColumn;
import net.iharding.modules.etl.service.TaskColumnService;

import org.guess.core.service.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: TaskColumn
* @Description: TaskColumnserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class TaskColumnServiceImpl extends BaseServiceImpl<TaskColumn, Long> implements TaskColumnService {

	@Autowired
	private TaskColumnDao taskColumnDao; 
	
	@Override
	public List<TaskColumn> getTaskColumns(Long readTaskId) {
		return taskColumnDao.getTaskColumns(readTaskId);
	}

}
