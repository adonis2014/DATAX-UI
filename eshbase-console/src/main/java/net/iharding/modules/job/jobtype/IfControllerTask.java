package net.iharding.modules.job.jobtype;

import org.springframework.stereotype.Component;

/**
 * 根据上一个任务结果使用if设置不同的调度任务
 * 
 * @author admin
 *
 */
@Component("IfControllerTask")
public class IfControllerTask  extends AbstractTask{

	/**
	 * 执行调度任务
	 * 
	 * @param taskDefine
	 */
	public String execute(String param) {
		return param;
	}
}
