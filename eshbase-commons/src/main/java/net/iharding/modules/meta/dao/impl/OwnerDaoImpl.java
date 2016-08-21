package net.iharding.modules.meta.dao.impl;

import net.iharding.modules.meta.dao.OwnerDao;
import net.iharding.modules.meta.model.Owner;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.sys.model.User;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: Owner
* @Description: OwnerdaoImpl
* @author Joe.zhang
* @date  2016-5-18 14:17:31
*
*/
@Repository
public class OwnerDaoImpl extends HibernateDao<Owner,Long> implements OwnerDao {

	@Override
	public Owner getOwner(User user, Integer objectType, Long objectId) {
		return this.findUnique(" from Owner where user=? and objectType=? and objectId=? ", user,objectType,objectId);
	}

	@Override
	public long getOwnerNum(int objectType, Long objectId) {
		return this.countHqlResult("select count(1) from Owner where  objectType=? and objectId=? ", objectType,objectId);
	}

}
