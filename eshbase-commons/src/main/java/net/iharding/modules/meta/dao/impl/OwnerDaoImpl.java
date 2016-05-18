package net.iharding.modules.meta.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.meta.dao.OwnerDao;
import net.iharding.modules.meta.model.Owner;
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

}
