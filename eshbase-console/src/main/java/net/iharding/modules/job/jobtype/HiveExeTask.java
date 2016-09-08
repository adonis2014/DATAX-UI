package net.iharding.modules.job.jobtype;

import org.springframework.stereotype.Component;

/**
 * 批量执行hive任务调度任务
 * 
 * @author Joe.zhang
 *
 */
@Component("HiveExeTask")
public class HiveExeTask  extends AbstractTask{
	/**
	 * 批量执行hql,多行采用换行符执行
	 * 
	 * @param hql
	 */
	public String execute(String hql) {
		return hql;
	}

}
