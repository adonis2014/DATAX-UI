package net.iharding.modules.sys.service;

import java.util.List;
import java.util.Map;

import org.guess.core.service.BaseService;

import net.iharding.modules.sys.model.Dict;

/**
* 
* @ClassName: Dict
* @Description: Dictservice
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
public interface DictService extends BaseService<Dict, Long>{
/**
 * 从jdbc查询获取下拉列表
 * @param sql
 * @return
 */
	List<Map<String, Object>> findForJdbc(String sql);

}
