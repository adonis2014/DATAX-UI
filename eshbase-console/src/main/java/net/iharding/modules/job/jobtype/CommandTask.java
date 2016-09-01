package net.iharding.modules.job.jobtype;

import org.springframework.stereotype.Component;

/**
 * 执行shell 命令任务
 * 
 * @author Joe.zhang
 *
 */
@Component("CommandTask")
public class CommandTask {
	
	/**
	 * 执行命令 批量，多个命令按照\n换行符分割
	 * 
	 * @param cmd
	 */
	public void executeCmd(String cmd) {

	}

}
