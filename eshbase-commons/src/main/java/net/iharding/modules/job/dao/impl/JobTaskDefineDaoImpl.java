package net.iharding.modules.job.dao.impl;

import java.util.List;

import org.guess.core.orm.hibernate.HibernateDao;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import net.iharding.modules.job.dao.JobTaskDefineDao;
import net.iharding.modules.job.model.JobTaskDefine;

import org.springframework.stereotype.Repository;

/**
 * 
 * @ClassName: JobTaskDefine
 * @Description: JobTaskDefinedaoImpl
 * @author Joe.zhang
 * @date 2016-1-31 17:39:36
 * 
 */
@Repository
public class JobTaskDefineDaoImpl extends HibernateDao<JobTaskDefine, Long> implements JobTaskDefineDao {

	@Override
	public JobTaskDefine get(Long machineId, Long jobWprkerId, Long regCenterId) {
		Criterion criterion1 = Restrictions.eq("machineId", machineId);
		Criterion criterion2 = Restrictions.eq("workerId", jobWprkerId);
		Criterion criterion3 = Restrictions.eq("regId", regCenterId);
		return this.findUnique(criterion1, criterion2, criterion3);
	}

	@Override
	public List<JobTaskDefine> findByRegCenter(Long regId) {
		return this.findBy("regId", regId);
	}

}
