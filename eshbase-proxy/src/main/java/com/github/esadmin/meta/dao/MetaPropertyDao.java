package com.github.esadmin.meta.dao;

import java.util.List;

import org.guess.core.orm.EntityDao;

import com.github.esadmin.meta.model.MetaProperty;


/**
 * 
 * @ClassName: MetaProperty
 * @Description: MetaPropertydao
 * @author Joe.zhang
 * @date 2016-5-18 14:20:22
 *
 */
public interface MetaPropertyDao extends EntityDao<MetaProperty, Long> {
	/**
	 * 根据类别和对象id获取属性设置列表
	 * 
	 * @param refType
	 * @param refId
	 * @return
	 */
	public List<MetaProperty> getProperties(int refType, long refId);

}
