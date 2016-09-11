package net.iharding.modules.job.service.impl;

import java.util.Date;
import java.util.List;

import net.iharding.modules.job.dao.MachineDao;
import net.iharding.modules.job.model.Machine;
import net.iharding.modules.job.service.MachineService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: Machine
* @Description: MachineserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class MachineServiceImpl extends BaseServiceImpl<Machine, Long> implements MachineService {

	@Autowired
	private MachineDao machineDao;
	@Override
	public Machine get(String ip) {
		return machineDao.get(ip);
	}

	@Override
	public List<Machine> findByRegCenter(Long id) {
		return machineDao.findByRegCenter(id);
	}
	
	@Override
	public void save(Machine machine) throws Exception {
		if (machine.getId() != null) {
			Machine rc = machineDao.get(machine.getId());
			// 保留发表者以及发表提起
			machine.setCreater(rc.getCreater());
			machine.setCreateDate(rc.getCreateDate());
			// 更新者
			User cuser = UserUtil.getCurrentUser();
			machine.setUpdater(cuser);
			machine.setUpdateDate(new Date());
		} else {
			User cuser = UserUtil.getCurrentUser();
			machine.setUpdater(cuser);
			machine.setUpdateDate(new Date());
			machine.setCreater(cuser);
			machine.setCreateDate(new Date());
			machine.setCheckLabel(1);
		}
		machineDao.save(machine);
	}

}
