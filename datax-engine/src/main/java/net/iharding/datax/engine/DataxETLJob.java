package net.iharding.datax.engine;

import com.dangdang.ddframe.job.api.JobExecutionMultipleShardingContext;
import com.dangdang.ddframe.job.plugin.job.type.AbstractSimpleElasticJob;
/**
 * 执行datax engine任务
 * @author admin
 *
 */
public class DataxETLJob  extends AbstractSimpleElasticJob{

	@Override
	public void process(JobExecutionMultipleShardingContext shardingContext) {
		String jobId=shardingContext.getJobParameter();
		
		
	}

}
