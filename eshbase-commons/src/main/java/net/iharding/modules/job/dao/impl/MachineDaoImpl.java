package net.iharding.modules.job.dao.impl;

import java.util.List;

import net.iharding.modules.job.dao.MachineDao;
import net.iharding.modules.job.model.Machine;

import org.guess.core.orm.hibernate.NativeSqlQueryHibernateDao;
import org.guess.sys.dao.UserDao;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 
 * @ClassName: Machine
 * @Description: MachinedaoImpl
 * @author Joe.zhang
 * @date 2016-1-31 17:00:46
 * 
 */
@Repository
public class MachineDaoImpl extends NativeSqlQueryHibernateDao<Machine, Long> implements MachineDao {
	
	@Autowired
	private UserDao userDao;
	@Override
	public Machine get(String serverIp) {
		return this.findUniqueBy("address", serverIp);
	}

	@Override
	public List<Machine> findByRegCenter(Long id) {
		return this.findBy("regId", id);
	}



	 @Override
	 public void save(Machine machine) {
		 Session session = getSession();
		 session.merge(machine);
	 }

}
