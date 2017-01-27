package com.github.eswrapper.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Repository;

import com.github.eswrapper.dao.SlowLogDAO;
import com.github.eswrapper.model.SlowLog;

@Repository
public class SlowLogDAOImpl   extends HibernateDao<SlowLog,Long> implements SlowLogDAO {
}
