package net.iharding.modules.job.service.impl;

import java.util.Date;
import java.util.List;

import net.iharding.modules.job.dao.JobClassDao;
import net.iharding.modules.job.dao.JobWorkerDao;
import net.iharding.modules.job.dao.MachineDao;
import net.iharding.modules.job.dao.RegCenterDao;
import net.iharding.modules.job.model.JobWorker;
import net.iharding.modules.job.model.Machine;
import net.iharding.modules.job.model.RegCenter;
import net.iharding.modules.job.service.RegCenterService;

import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.uncode.schedule.ConsoleManager;
import cn.uncode.schedule.core.ScheduleServer;


/**
 * 
 * @ClassName: RegCenter
 * @Description: RegCenterserviceImpl
 * @author Joe.zhang
 * @date 2014-8-5 下午02:04:46
 * 
 */
@Service
public class RegCenterServiceImpl extends BaseServiceImpl<RegCenter, Long> implements RegCenterService {

	@Autowired
	private RegCenterDao regCenterDao;
	
	@Autowired
	private MachineDao machineDao;
	
	
	@Autowired
	private JobWorkerDao jobWorkerDao;
	
	@Autowired
	private JobClassDao jobClassDao;

		
	@Override
	public void save(RegCenter regCenter) throws Exception {
		if (regCenter.getId() != null) {
			RegCenter rc = regCenterDao.get(regCenter.getId());

			// 保留发表者以及发表提起
			regCenter.setCreater(rc.getCreater());
			regCenter.setCreateDate(rc.getCreateDate());
			// 更新者
			User cuser = UserUtil.getCurrentUser();
			regCenter.setUpdater(cuser);
			regCenter.setUpdateDate(new Date());
		} else {
			User cuser = UserUtil.getCurrentUser();
			regCenter.setUpdater(cuser);
			regCenter.setUpdateDate(new Date());
			regCenter.setCreater(cuser);
			regCenter.setCreateDate(new Date());
			regCenter.setCheckLabel(0);
		}
		super.save(regCenter);
	}




	@Override
	public List<Machine> getMachines(Long id) {
		return machineDao.findByRegCenter(id);
	}

	@Override
	public List<JobWorker> getJobWorkers(Long id) {
		return jobWorkerDao.findByRegCenter(id);
	}

	

	@Override
	@Transactional
	public void connect(Long id) {
		try {
			String zkConnectString=ConsoleManager.getScheduleManager().getZkManager().getConnectStr();
//			String rootPath=ConsoleManager.getScheduleManager().getZkManager().get("rootPath");
//			RegCenter regCenter=regCenterDao.get(zkConnectString,rootPath);
//			User user=UserUtil.getCurrentUser();
//			if (regCenter==null){
//				regCenter=new RegCenter();
//				regCenter.setCreateDate(new Date());
//				regCenter.setCreater(user);
//				regCenter.setNameSpace(rootPath);
//				regCenter.setZkQuorumPeer(zkConnectString);
//			}else{
//				regCenter.setUpdateDate(new Date());
//				regCenter.setUpdater(UserUtil.getCurrentUser());
//			}
//			regCenter.setCheckLabel(1);
//			regCenterDao.save(regCenter);
//			//machine
//			List<String> servers = ConsoleManager.getScheduleManager().getScheduleDataManager().loadScheduleServerNames();
//			for(ScheduleServer server:servers){
//				Machine machine=machineDao.get(server.getIp());
//				if (machine==null){
//					machine=new Machine();
//					machine.setAddress(server.getIp());
//					machine.setCreateDate(new Date());
//				}
//				machine.setCheckLabel(1);
//				machine.setHostName(server.getHostName());
//				machine.setRegCenter(regCenter);
//				machine.setUpdateDate(new Date());
//				machine.setUpdater(user);
//				machineDao.save(machine);
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
