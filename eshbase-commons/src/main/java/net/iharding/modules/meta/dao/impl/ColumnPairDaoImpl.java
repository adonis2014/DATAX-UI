package net.iharding.modules.meta.dao.impl;

import java.util.List;

import net.iharding.modules.meta.dao.ColumnPairDao;
import net.iharding.modules.meta.model.ColumnPair;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;
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
public class ColumnPairDaoImpl extends HibernateDao<ColumnPair,Long> implements ColumnPairDao {

	@Override
	public List<ColumnPair> getJobColumnPairs(Long readTaskId){
		return this.findBy("readTaskId", readTaskId);
	}
	
	@Override
	public void save(ColumnPair columnPair) {
		Session session = getSession();
		if (columnPair.getId()==null ||columnPair.getId()==0){
			session.save(columnPair);
		}else{
			session.merge(columnPair);
		}
	}

}
