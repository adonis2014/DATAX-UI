package net.iharding.modules.job.dao.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.iharding.modules.job.dao.MachineDao;
import net.iharding.modules.job.model.Machine;

import org.guess.core.orm.hibernate.NativeSqlQueryHibernateDao;
import org.guess.sys.dao.UserDao;
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
		List<Map<String, Object>> list = this.findForJdbc("select distinct t1.* from job_task_define t,job_machine t1 where t.reg_id=1 and t1.id=t.machine_id and t.reg_id = ?", id);
		List<Machine> machines = new ArrayList<Machine>();
		for (Map<String, Object> obj : list) {
			Machine machine = new Machine();
			machine.setAddress((String) obj.get("address"));
			machine.setCheckLabel((Integer) obj.get("check_label"));
			machine.setCreateDate((Date)obj.get("create_date"));
			if (obj.get("createby_id")!=null)machine.setCreater(userDao.get(((BigInteger)obj.get("createby_id")).longValue()));
			machine.setHostName((String)obj.get("host_name"));
			machine.setId(((BigInteger)obj.get("id")).longValue());
			machine.setLoginName((String)obj.get("login_name"));
			machine.setLoginPassword((String)obj.get("login_password"));
			machine.setMachineName((String)obj.get("machine_name"));
			machine.setRemark((String)obj.get("remark"));
			machine.setSshPort((Integer)obj.get("ssh_port"));
			machine.setUpdateDate((Date)obj.get("update_date"));
			if (obj.get("updateby_id")!=null)machine.setUpdater(userDao.get(((BigInteger)obj.get("updateby_id")).longValue()));
			machine.setUserDir((String)obj.get("user_dir"));
			machines.add(machine);
		}
		return machines;
	}

	// @Override
	// public void save(Machine machine) {
	// Session session = getSession();
	// session.merge(machine);
	// }

}
