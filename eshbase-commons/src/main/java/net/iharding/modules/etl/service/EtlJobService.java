package net.iharding.modules.etl.service;

import org.guess.core.service.BaseService;

import net.iharding.modules.etl.model.EtlJob;

/**
* 
* @ClassName: EtlJob
* @Description: EtlJobservice
* @author Joe.zhang
* @date 2014-8-5 下午02:04:46
*
*/
public interface EtlJobService extends BaseService<EtlJob, Long>{

	public void saveJob(EtlJob etlJob)throws Exception;
}
