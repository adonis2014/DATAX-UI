package net.iharding.modules.meta.dao.impl;

import net.iharding.modules.meta.dao.DataModelDao;
import net.iharding.modules.meta.model.DataModel;

import org.guess.core.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Repository;
@Repository
public class DataModelDaoImpl   extends HibernateDao<DataModel, Long> implements DataModelDao{

}
