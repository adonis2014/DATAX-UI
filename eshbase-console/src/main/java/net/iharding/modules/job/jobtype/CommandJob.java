package net.iharding.modules.job.jobtype;

import com.dangdang.ddframe.job.api.JobExecutionMultipleShardingContext;
import com.dangdang.ddframe.job.plugin.job.type.AbstractSimpleElasticJob;
/**
 * 执行shell 命令任务
 * @author  Joe.zhang
 *
 */
public class CommandJob extends AbstractSimpleElasticJob{

	@Override
	public void process(JobExecutionMultipleShardingContext shardingContext) {
		
		
	}

}
