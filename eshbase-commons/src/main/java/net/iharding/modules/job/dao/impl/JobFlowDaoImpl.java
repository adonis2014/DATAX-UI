package net.iharding.modules.job.dao.impl;

import java.util.List;

import net.iharding.modules.job.dao.JobFlowDao;
import net.iharding.modules.job.model.JobExecutionInfo;
import net.iharding.modules.job.model.JobFlow;

import org.guess.core.orm.Page;
import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.core.utils.AssertUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: JobFlow
* @Description: JobFlowdaoImpl
* @author Joe.zhang
* @date  2016-5-19 23:56:47
*
*/
@Repository
public class JobFlowDaoImpl extends HibernateDao<JobFlow,Long> implements JobFlowDao {

	@Override
	public void save(JobFlow jobFlow) {
		Session session = getSession();
		session.merge(jobFlow);
	}

	@Override
	public Page<JobExecutionInfo> findExecutionPage(Page<JobExecutionInfo> pageRequest, Long flowId) {
		AssertUtils.notNull(pageRequest, "page不能为空");
		String hql="select exe from JobExecutionInfo as exe inner join  exe.worker as worker  with worker.jobFlowId = ? order by exe.lastBeginTime desc ";
		Page<JobExecutionInfo> page = new Page<JobExecutionInfo>(pageRequest);
		if (pageRequest.isCountTotal()) {
			long totalCount = countHqlResult(hql, flowId);
			page.setTotalItems(totalCount);
		}
		Query q = createQuery(hql, flowId);
		setPageParameterToQuery(q, pageRequest);
		List result = q.list();
		page.setResult(result);
		return page;
	}

	
}
