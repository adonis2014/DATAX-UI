package net.iharding.modules.meta.dao.impl;

import net.iharding.modules.meta.dao.WatchDao;
import net.iharding.modules.meta.model.Watch;

import org.guess.core.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: Watch
* @Description: WatchdaoImpl
* @author Joe.zhang
* @date  2016-5-18 14:18:11
*
*/
@Repository
public class WatchDaoImpl extends HibernateDao<Watch,Long> implements WatchDao {

}
