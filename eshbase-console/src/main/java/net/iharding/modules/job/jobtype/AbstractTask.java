package net.iharding.modules.job.jobtype;

/**
 * 统一定义任务类抽象方法
 * 
 * @author admin
 *
 */
public abstract class AbstractTask {
	
	protected String log;
	/**
	 * 执行方法调度
	 * 
	 * @param param
	 * @return
	 */
	public abstract String execute(String param);

	/**
	 * 收集获取日志
	 * 
	 * @return
	 */
	public String collectLog() {
		return log;
	}
}
