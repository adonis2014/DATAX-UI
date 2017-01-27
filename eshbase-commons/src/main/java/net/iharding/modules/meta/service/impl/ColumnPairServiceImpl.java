package net.iharding.modules.meta.service.impl;

import java.util.List;

import net.iharding.modules.meta.dao.ColumnPairDao;
import net.iharding.modules.meta.model.ColumnPair;
import net.iharding.modules.meta.service.ColumnPairService;

import org.guess.core.service.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: ColumnPairService
* @Description: ColumnPairServiceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class ColumnPairServiceImpl extends BaseServiceImpl<ColumnPair, Long> implements ColumnPairService {

	@Autowired
	private ColumnPairDao columnPairDao; 
	
	@Override
	public List<ColumnPair> getJobColumnPairs(Long readTaskId){
		return columnPairDao.getJobColumnPairs(readTaskId);
	}

}
