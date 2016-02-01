package net.iharding.modules.job.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import net.iharding.modules.job.dao.MachineDao;
import net.iharding.modules.job.model.Machine;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: Machine
* @Description: MachinedaoImpl
* @author Joe.zhang
* @date  2016-1-31 17:00:46
*
*/
@Repository
public class MachineDaoImpl extends HibernateDao<Machine,Long> implements MachineDao {

}
