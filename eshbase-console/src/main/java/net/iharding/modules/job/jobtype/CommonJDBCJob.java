package net.iharding.modules.job.jobtype;

import com.dangdang.ddframe.job.api.JobExecutionMultipleShardingContext;
import com.dangdang.ddframe.job.plugin.job.type.AbstractSimpleElasticJob;
/**
 * 通用jdbc命令调度
 * @author  Joe.zhang
 *
 */
public class CommonJDBCJob extends AbstractSimpleElasticJob {

	@Override
	public void process(JobExecutionMultipleShardingContext shardingContext) {
		// TODO Auto-generated method stub
		
	}

}
