package com.github.eswrapper.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.guess.core.orm.Page;
import org.guess.core.orm.PropertyFilter;
import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.core.utils.AssertUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import com.github.eswrapper.dao.MonitorLogDetailDao;
import com.github.eswrapper.model.MonitorLogDetail;
import com.google.common.collect.Maps;

import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: MonitorLogDetail
* @Description: MonitorLogDetaildaoImpl
* @author Joe.zhang
* @date  2016-8-5 11:36:13
*
*/
@Repository
public class MonitorLogDetailDaoImpl extends HibernateDao<MonitorLogDetail,Long> implements MonitorLogDetailDao {

	@Override
	public Page<MonitorLogDetail> findFilterPage(Page<MonitorLogDetail> page, List<PropertyFilter> filters) {
		AssertUtils.notNull(page, "page不能为空");
		Criterion[] criterions = buildCriterionByPropertyFilter(filters);
		Criteria c = createCriteria(criterions);
		Map<String, String> alias = Maps.newHashMap();
		for (PropertyFilter filter : filters) {
			if (!filter.hasMultiProperties()) {
				if (filter.getPropertyName().indexOf(".") != -1) {
					String objName = StringUtils.substringBefore(
							filter.getPropertyName(), ".");
					alias.put(objName, objName);
				}
			} else {
				for (String param : filter.getPropertyNames()) {
					if (param.indexOf(".") != -1) {
						String objName = StringUtils
								.substringBefore(param, ".");
						alias.put(objName, objName);
					}
				}
			}
		}

		for (String key : alias.keySet()) {
			c.createAlias(key, alias.get(key));
		}
		c.add(Restrictions.isNull("clusterName"));
		if (page.isCountTotal()) {
			long totalCount = countCriteriaResult(c);
			page.setTotalItems(totalCount);
		}
		setPageRequestToCriteria(c, page);

		List result = c.list();
		page.setResult(result);
		return page;
	}

	@Override
	public Page<MonitorLogDetail> find(Page<MonitorLogDetail> pageRequest, String success, String failure, String search_GTD_logTime, String search_LTD_logTime) {
		AssertUtils.notNull(pageRequest, "page不能为空");
		Page<MonitorLogDetail> page = new Page<MonitorLogDetail>(pageRequest);
		String hql=" from MonitorLogDetail where clusterName is null ";
		if (StringUtils.isNotEmpty(success)){
			hql=hql+" and successCount >="+success;
		}
		if (StringUtils.isNotEmpty(failure)){
			hql=hql+" and failureCount >="+failure;
		}
		if (StringUtils.isNotEmpty(search_GTD_logTime)){
			hql=hql+" and log.logTime >='"+StringUtils.trim(search_GTD_logTime)+" 00:00:00'";
		}
		if (StringUtils.isNotEmpty(search_LTD_logTime)){
			hql=hql+" and log.logTime  <='"+StringUtils.trim(search_LTD_logTime)+" 23:59:59'";
		}
		if (pageRequest.isCountTotal()) {
			long totalCount = countHqlResult( hql);
			page.setTotalItems(totalCount);
		}
		hql=hql+" order by log.logTime desc ";
		if (pageRequest.isOrderBySetted()) {
			hql = setOrderParameterToHql(hql, pageRequest);
		}

		Query q = createQuery(hql);
		setPageParameterToQuery(q, pageRequest);

		List result = q.list();
		page.setResult(result);
		return page;
	}

}
