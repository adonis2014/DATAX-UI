package net.iharding.modules.job.service.impl;

import java.util.Collection;
import java.util.Date;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import net.iharding.modules.job.dao.JobTaskDefineDao;
import net.iharding.modules.job.dao.JobWorkerDao;
import net.iharding.modules.job.dao.MachineDao;
import net.iharding.modules.job.dao.RegCenterDao;
import net.iharding.modules.job.model.Machine;
import net.iharding.modules.job.model.RegCenter;
import net.iharding.modules.job.service.RegCenterService;

import org.apache.curator.framework.CuratorFramework;
import org.guess.core.service.BaseServiceImpl;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dangdang.ddframe.job.console.domain.JobBriefInfo;
import com.dangdang.ddframe.job.console.domain.RegistryCenterClient;
import com.dangdang.ddframe.job.console.domain.ServerBriefInfo;
import com.dangdang.ddframe.job.console.domain.ServerBriefInfo.ServerBriefStatus;
import com.dangdang.ddframe.job.console.repository.zookeeper.CuratorRepository;
import com.dangdang.ddframe.job.console.service.JobDimensionService;
import com.dangdang.ddframe.job.console.service.ServerDimensionService;
import com.dangdang.ddframe.job.console.util.SessionCuratorClient;

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
	private JobTaskDefineDao jobTaskDefineDao;
	
	
	

	@Resource
	private CuratorRepository curatorRepository;

	private ConcurrentHashMap<String, RegistryCenterClient> clientMap = new ConcurrentHashMap<>();
	
	@Resource
    private ServerDimensionService serverDimensionService;
	
	@Resource
	private JobDimensionService jobDimensionService;
	
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
	public RegistryCenterClient connect(String name) {
		RegistryCenterClient result = new RegistryCenterClient(name);
		RegCenter regCenter = regCenterDao.getByName(name);
		if (null == regCenter) {
			return result;
		}
		return connect(regCenter);
	}

	private RegistryCenterClient findInCache(final String name) {
		if (clientMap.containsKey(name)) {
			if (clientMap.get(name).isConnected()) {
				return clientMap.get(name);
			}
			clientMap.remove(name);
		}
		return null;
	}

	private void setRegistryCenterClient(final RegistryCenterClient registryCenterClient, final String name, final CuratorFramework client) {
		registryCenterClient.setConnected(true);
		registryCenterClient.setCuratorClient(client);
		clientMap.putIfAbsent(name, registryCenterClient);
	}

	@Override
	public RegistryCenterClient connect(RegCenter regCenter) {
		RegistryCenterClient result = new RegistryCenterClient(regCenter.getName());
		RegistryCenterClient clientInCache = findInCache(regCenter.getName());
		if (null != clientInCache) {
			return clientInCache;
		}
		//连接zookServer，获取client对象
		CuratorFramework client = curatorRepository.connect(regCenter.getZkQuorumPeer(), regCenter.getNameSpace(), regCenter.getLoginCert());
		if (null == client) {
			return result;
		}
		setRegistryCenterClient(result, regCenter.getName(), client);
		//更新注册中心状态和最后更新信息
		User cuser = UserUtil.getCurrentUser();
		regCenter.setUpdater(cuser);
		regCenter.setUpdateDate(new Date());
		regCenter.setCheckLabel(1);
		regCenterDao.save(regCenter);
		SessionCuratorClient.setCuratorClient(client);
		//读取注册相关信息，包括作业终端和调度任务,并更新或者新建作业终端和作业信息
		Collection<ServerBriefInfo> servers=serverDimensionService.getAllServersBriefInfo();
		//作业服务器数据更新
		for(ServerBriefInfo serv:servers){
			Machine machine=machineDao.get(serv.getServerIp());
			if (machine==null){
				machine=new Machine();
				machine.setUpdater(cuser);
				machine.setUpdateDate(new Date());
				machine.setCreater(cuser);
				machine.setCreateDate(new Date());
			}else{
				machine.setUpdater(cuser);
				machine.setUpdateDate(new Date());
			}
			machine.setAddress(serv.getServerIp());
			machine.setHostName(serv.getServerHostName());
			if (serv.getStatus()==ServerBriefStatus.OK){
				machine.setCheckLabel(1);
			}else if  (serv.getStatus()==ServerBriefStatus.PARTIAL_ALIVE){
				machine.setCheckLabel(2);
			}else if  (serv.getStatus()==ServerBriefStatus.ALL_CRASHED){
				machine.setCheckLabel(0);
			}
			machineDao.save(machine);
		}
		Collection<JobBriefInfo> jobs=jobDimensionService.getAllJobsBriefInfo();
		for(JobBriefInfo thejob:jobs){
			
		}
		return result;
	}

	@Override
	public RegistryCenterClient connect(Long id) {
		RegCenter regCenter = regCenterDao.get(id);
		if (null == regCenter) {
			return new RegistryCenterClient(id.toString());
		}
		return connect(regCenter);
	}

}
