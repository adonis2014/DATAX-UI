package net.iharding.modules.job.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.Session;

import net.iharding.modules.job.dao.MachineDao;
import net.iharding.modules.job.model.Machine;
import net.iharding.modules.job.model.RegCenter;

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

	@Override
	public Machine get(String serverIp) {
		return this.findUniqueBy("address",serverIp);
	}
	
//	@Override
//	public void save(Machine machine) {
//		Session session = getSession();
//		session.merge(machine);
//	}

}
