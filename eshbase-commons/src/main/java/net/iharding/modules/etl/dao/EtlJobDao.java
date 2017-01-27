package net.iharding.modules.etl.dao;

import org.guess.core.orm.EntityDao;
import net.iharding.modules.etl.model.EtlJob;

/**
* 
* @ClassName: EtlJob
* @Description: EtlJobdao
* @author Joe.zhang
* @date  2016-1-30 12:11:47
*
*/
public interface EtlJobDao extends EntityDao<EtlJob, Long>{
	public void saveOrUpdate(EtlJob etljob);
}
