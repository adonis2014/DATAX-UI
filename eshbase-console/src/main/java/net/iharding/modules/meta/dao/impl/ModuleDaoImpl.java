package net.iharding.modules.meta.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.meta.dao.ModuleDao;
import net.iharding.modules.meta.model.Module;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: Module
* @Description: ModuledaoImpl
* @author zhangxuhui
* @date 2014-8-5 下午02:04:46
*
*/
@Repository
public class ModuleDaoImpl extends HibernateDao<Module,Long> implements ModuleDao {

}
