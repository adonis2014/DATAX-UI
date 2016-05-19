package net.iharding.modules.job.jobtype;

import com.dangdang.ddframe.job.api.JobExecutionMultipleShardingContext;
import com.dangdang.ddframe.job.plugin.job.type.AbstractSimpleElasticJob;
/**
 * 批量执行hive任务调度任务
 * @author Joe.zhang
 *
 */
public class HiveJob extends AbstractSimpleElasticJob{

	@Override
	public void process(JobExecutionMultipleShardingContext shardingContext) {
		// TODO Auto-generated method stub
		
	}

}
