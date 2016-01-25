package net.iharding.etl.jobs;

import net.iharding.etl.utils.PrintContext;

import com.dangdang.ddframe.job.api.JobExecutionMultipleShardingContext;
import com.dangdang.ddframe.job.plugin.job.type.AbstractSimpleElasticJob;

public class DataxJob  extends AbstractSimpleElasticJob {

	
    private PrintContext printContext = new PrintContext(DataxJob.class);
    
	@Override
	public void process(JobExecutionMultipleShardingContext shardingContext) {
		 printContext.printProcessJobMessage(shardingContext.getShardingItems());
		 
	}

}
