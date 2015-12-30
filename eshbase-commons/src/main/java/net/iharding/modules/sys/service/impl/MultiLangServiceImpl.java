package net.iharding.modules.sys.service.impl;

import org.guess.core.service.BaseServiceImpl;

import net.iharding.modules.sys.dao.MultiLangDao;
import net.iharding.modules.sys.model.MultiLang;
import net.iharding.modules.sys.service.MultiLangService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: MultiLang
* @Description: MultiLangserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class MultiLangServiceImpl extends BaseServiceImpl<MultiLang, Long> implements MultiLangService {
	@Autowired
	private MultiLangDao multiLangDao;
	@Override
	public String getLang(String langKey, String langArg) {
		return multiLangDao.get(langKey,langArg);
	}

	@Override
	public String getLang(String lang_key) {
		return multiLangDao.getLang(lang_key);
	}

}
