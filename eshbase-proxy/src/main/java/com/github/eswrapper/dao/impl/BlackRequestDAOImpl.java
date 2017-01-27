package com.github.eswrapper.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Repository;

import com.github.eswrapper.dao.BlackRequestDAO;
import com.github.eswrapper.model.BlackRequest;

@Repository
public class BlackRequestDAOImpl  extends HibernateDao<BlackRequest,Long> implements BlackRequestDAO {
}
