package net.iharding.core.timer;


import java.util.Set;

import net.iharding.modules.task.model.TimeTask;
import net.iharding.modules.task.service.TimeTaskService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
/**
 * 读取数据库 然后判断是否启动任务
 * @author zhangxuhui
 * @date 2015-9-22
 * @version 1.0
 */
public class DataBaseSchedulerFactoryBean extends SchedulerFactoryBean {
	
	@Autowired
	private TimeTaskService timeTaskService;
	/**
	 * 读取数据库判断是否开始定时任务
	 */
	public void afterPropertiesSet() throws Exception {
		super.afterPropertiesSet();
		GroupMatcher<TriggerKey> gm=GroupMatcher.anyTriggerGroup();
		Set<TriggerKey> trigerrNames = this.getScheduler().getTriggerKeys(gm);
		TimeTask task;
		
		for (TriggerKey tk : trigerrNames) {
			task = timeTaskService.findUniqueBy("taskId",tk.getName());
			//数据库查询不到的定时任务或者定时任务的运行状态不为1时，都停止
			//TASK #327 定时器任务默认未启动 
			if(task==null || !"1".equals(task.getIsStart())){
				this.getScheduler().pauseTrigger(tk);
			}
		}
	}

}
