package net.iharding.modules.job.jobtype;

import org.springframework.stereotype.Component;

import cn.uncode.schedule.core.TaskDefine;

/**
 * 根据上一个任务结果使用if设置不同的调度任务
 * 
 * @author admin
 *
 */
@Component("IfControllerTask")
public class IfControllerTask {

	/**
	 * 执行调度任务
	 * 
	 * @param taskDefine
	 */
	public void executeTask(TaskDefine taskDefine) {

	}
}
