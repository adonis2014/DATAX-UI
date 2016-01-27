package net.iharding.modules.sys.service.impl;

import java.util.List;
import java.util.Map;

import net.iharding.modules.sys.dao.DictDao;
import net.iharding.modules.sys.model.Dict;
import net.iharding.modules.sys.service.DictService;

import org.guess.core.Constants;
import org.guess.core.service.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* 
* @ClassName: Dict
* @Description: DictserviceImpl
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
@Service
public class DictServiceImpl extends BaseServiceImpl<Dict, Long> implements DictService {
	
	@Autowired
	private DictDao dictDao;
	
	@Override
	public List<Map<String, Object>> findForJdbc(String sql) {
		return dictDao.findForJdbc(sql);
	}
	
	@Override
	public void save(Dict dict) throws Exception {
		if (dict.getParent()!=null){
			dict.setCodeType(dict.getParent().getId());
		}else{
			dict.setCodeType(Constants.FIRST_CODE_TYPE);
		}
		super.save(dict);
	}

}
