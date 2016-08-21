package net.iharding.modules.meta.dao.impl;

import net.iharding.modules.meta.dao.WatchDao;
import net.iharding.modules.meta.model.Watch;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.sys.model.User;
import org.springframework.stereotype.Repository;

/**
 * 
 * @ClassName: Watch
 * @Description: WatchdaoImpl
 * @author Joe.zhang
 * @date 2016-5-18 14:18:11
 *
 */
@Repository
public class WatchDaoImpl extends HibernateDao<Watch, Long> implements WatchDao {

	@Override
	public Watch getWatch(User user, Integer objectType, Long objectId) {
		return this.findUnique(" from Watch where user=? and objectType=? and objectId=? ", user, objectType, objectId);
	}

	@Override
	public long getWatchNum(int objectType, Long id) {
		return this.countHqlResult(" select count(1) from Watch where objectType=? and objectId=? ",objectType,id);
	}

}
