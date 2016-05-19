package net.iharding.modules.job.jobtype;

import net.iharding.datax.engine.DataExector;

import com.dangdang.ddframe.job.api.JobExecutionMultipleShardingContext;
import com.dangdang.ddframe.job.plugin.job.type.AbstractSimpleElasticJob;
/**
 * 执行单个datax engine任务
 * @author  Joe.zhang
 *
 */
public class DataxETLJob  extends AbstractSimpleElasticJob{

	@Override
	public void process(JobExecutionMultipleShardingContext shardingContext) {
		try {
			String jobId=shardingContext.getJobParameter();
			DataExector exector=new DataExector(jobId);
			exector.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
