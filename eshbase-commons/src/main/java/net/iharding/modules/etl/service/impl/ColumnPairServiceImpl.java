package net.iharding.modules.etl.service.impl;

import java.util.List;

import net.iharding.modules.etl.dao.JobColumnPairDao;
import net.iharding.modules.etl.model.JobColumnPair;
import net.iharding.modules.etl.service.ColumnPairService;

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
public class ColumnPairServiceImpl extends BaseServiceImpl<JobColumnPair, Long> implements ColumnPairService {

	@Autowired
	private JobColumnPairDao columnPairDao; 
	
	@Override
	public List<JobColumnPair> getJobColumnPairs(Long readTaskId){
		return columnPairDao.getJobColumnPairs(readTaskId);
	}

}
