package net.iharding.modules.sys.service;

import org.guess.core.service.BaseService;

import net.iharding.modules.sys.model.MultiLang;

/**
* 
* @ClassName: MultiLang
* @Description: MultiLangservice
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
public interface MultiLangService extends BaseService<MultiLang, Long>{

	public String getLang(String langKey, String langArg);

	public String getLang(String lang_key);

}
