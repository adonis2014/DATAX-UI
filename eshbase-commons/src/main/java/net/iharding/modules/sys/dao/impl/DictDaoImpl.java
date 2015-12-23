package net.iharding.modules.sys.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.sys.dao.DictDao;
import net.iharding.modules.sys.model.Dict;
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
public class DictDaoImpl extends HibernateDao<Dict,Long> implements DictDao {

}
