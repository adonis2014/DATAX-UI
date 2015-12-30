package net.iharding.modules.sys.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;

import net.iharding.modules.sys.dao.MultiLangDao;
import net.iharding.modules.sys.model.MultiLang;

import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: MultiLang
* @Description: MultiLangdaoImpl
* @author Joe.zhang
* @date  2015-12-23 17:50:20
*
*/
@Repository
public class MultiLangDaoImpl extends HibernateDao<MultiLang,Long> implements MultiLangDao {

	@Override
	public String get(String langKey, String langArg) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getLang(String lang_key) {
		// TODO Auto-generated method stub
		return null;
	}

}
