package net.iharding.modules.meta.dao.impl;

import net.iharding.modules.meta.dao.DatasetPairDao;
import net.iharding.modules.meta.model.DatasetPair;

import org.guess.core.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Repository;
@Repository
public class DatasetPairDaoImpl  extends HibernateDao<DatasetPair, Long> implements DatasetPairDao{

}
