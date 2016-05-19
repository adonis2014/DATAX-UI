package net.iharding.modules.job.jobtype;

import com.dangdang.ddframe.job.api.JobExecutionMultipleShardingContext;
import com.dangdang.ddframe.job.plugin.job.type.AbstractSimpleElasticJob;
/**
 * 执行多个datax任务组成的流程job
 * @author  Joe.zhang
 *
 */
public class DataxFlowJob  extends AbstractSimpleElasticJob{

	@Override
	public void process(JobExecutionMultipleShardingContext shardingContext) {
		// TODO Auto-generated method stub
		
	}

}
