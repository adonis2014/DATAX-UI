package net.iharding.modules.sys.dao;

import java.util.List;
import java.util.Map;

import org.guess.core.orm.EntityDao;
import org.guess.core.orm.Page;
import org.guess.core.orm.PageRequest;
import org.hibernate.SQLQuery;

import net.iharding.modules.sys.model.Dict;

/**
 * 
 * @ClassName: Dict
 * @Description: Dictdao
 * @author Joe.zhang
 * @date 2015-12-23 17:38:16
 *
 */
public interface DictDao extends EntityDao<Dict, Long> {
	
	public Page<Dict> findPageBySql(final PageRequest pageRequest, String sql,final Object... values);

	public Map findMapBySql(final PageRequest pageRequest, String sql,final Object... values);

	public List<Map<String, Object>> findForJdbc(String sql, Object... objs);

	public <X> X findUniqueBySql(final String sql, final Object... values);

	public SQLQuery createSqlQuery(String sql, Object[] values);

}
