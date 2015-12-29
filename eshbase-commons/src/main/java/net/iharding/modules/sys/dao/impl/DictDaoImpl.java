package net.iharding.modules.sys.dao.impl;

import net.iharding.modules.sys.dao.DictDao;
import net.iharding.modules.sys.model.Dict;

import org.guess.core.orm.hibernate.NativeSqlQueryHibernateDao;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: Dict
* @Description: DictdaoImpl
* @author Joe.zhang
* @date  2015-12-23 17:38:16
*
*/
@Repository
public class DictDaoImpl extends NativeSqlQueryHibernateDao<Dict,Long> implements DictDao {


}
