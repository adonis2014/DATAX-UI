package net.iharding.modules.etl.dao.impl;

import net.iharding.modules.etl.dao.EtlJobExecutionDao;
import net.iharding.modules.etl.model.EtlJobExecution;

import org.guess.core.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Repository;
@Repository
public class EtlJobExecutionDaoImpl  extends HibernateDao<EtlJobExecution,Long>  implements EtlJobExecutionDao {


}
