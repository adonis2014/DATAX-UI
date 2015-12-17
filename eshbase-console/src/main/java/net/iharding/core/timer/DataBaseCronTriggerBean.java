package net.iharding.core.timer;


import java.text.ParseException;

import net.iharding.modules.task.model.TimeTask;
import net.iharding.modules.task.service.TimeTaskService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
/**
 * spring4.1 数据库的读取配置任务触发器
 * @author zhangxuhui
 * @date 2013-9-22
 * @version 1.0
 */
public class DataBaseCronTriggerBean extends CronTriggerFactoryBean{

	
	@Autowired
	private TimeTaskService timeTaskService;
	/**
	 * 读取数据库更新文件
	 */
	public void afterPropertiesSet() throws ParseException {
		super.afterPropertiesSet();
		TimeTask task = timeTaskService.findUniqueBy("taskId",this.getObject().getKey().getName());
		if(task!=null && task.getIsEffect().equals("1") &&!task.getCronExpression().equals(this.getObject().getCronExpression())){
			this.setCronExpression(task.getCronExpression());
			DynamicTask.updateSpringMvcTaskXML(getObject(),task.getCronExpression());
		}
	}

}
