package net.iharding.modules.job.dao.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.iharding.modules.job.dao.JobWorkerDao;
import net.iharding.modules.job.model.JobWorker;

import org.guess.core.orm.hibernate.NativeSqlQueryHibernateDao;
import org.guess.sys.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 
 * @ClassName: JobWorker
 * @Description: JobWorkerdaoImpl
 * @author Joe.zhang
 * @date 2016-1-31 17:34:42
 * 
 */
@Repository
public class JobWorkerDaoImpl extends NativeSqlQueryHibernateDao<JobWorker, Long> implements JobWorkerDao {

	@Autowired
	private UserDao userDao;
	
	@Override
	public JobWorker get(String jobName) {
		return this.findUniqueBy("name", jobName);
	}

	@Override
	public List<JobWorker> findByRegCenter(Long regId) {
		List<Map<String, Object>> list = this.findForJdbc("select distinct t1.* from job_task_define t,job_worker t1 where t.reg_id=1 and t1.id=t.worker_id and t.reg_id = ?", regId);
		List<JobWorker> workers = new ArrayList<JobWorker>();
		for (Map<String, Object> obj : list) {
			JobWorker worker = new JobWorker();
			worker.setCheckLabel((Integer) obj.get("check_label"));
			worker.setCreateDate((Date)obj.get("create_date"));
			if (obj.get("createby_id")!=null)worker.setCreater(userDao.get(((BigInteger)obj.get("createby_id")).longValue()));
			worker.setId(((BigInteger)obj.get("id")).longValue());
			worker.setRemark((String)obj.get("remark"));
			worker.setUpdateDate((Date)obj.get("update_date"));
			if (obj.get("updateby_id")!=null)worker.setUpdater(userDao.get(((BigInteger)obj.get("updateby_id")).longValue()));
			worker.setCron((String)obj.get("cron"));
			worker.setDataProcessThread((Integer)obj.get("data_process_thread"));
			worker.setDisabled((Integer)obj.get("disabled"));
			worker.setFailover((Integer)obj.get("failover"));
			worker.setFetchDataCount((Integer)obj.get("fetch_data_count"));
			if (obj.get("job_class_id")!=null)worker.setJobClassId(((BigInteger)obj.get("job_class_id")).longValue());
			worker.setJobClassName((String)obj.get("job_class_name"));
			worker.setJobParameter((String)obj.get("job_parameter"));
			worker.setLogicName((String)obj.get("logic_name"));
			worker.setMaxtimeDiff((Integer)obj.get("maxtime_diff"));
			worker.setMisfire((Integer)obj.get("mis_fire"));
			worker.setMonitorExecution((Integer)obj.get("monitor_execution"));
			worker.setName((String)obj.get("name"));
			worker.setOverwrite((Integer)obj.get("overwrite"));
			worker.setProcessCountInterval((Integer)obj.get("process_count_interval"));
			worker.setShardingItemParameters((String)obj.get("sharding_item_parameters"));
			worker.setShardingStrategyClass((String)obj.get("sharding_strategy_class"));
			worker.setShardingTotalCount((Integer)obj.get("sharding_total_count"));
			workers.add(worker);
		}
		return workers;
	}

}
