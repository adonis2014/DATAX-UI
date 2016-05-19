package net.iharding.datax.engine;

/**
 * 实现处理从数据库读取配置，调度执行datax任务类
 * 
 * @author admin
 *
 */
public interface ProcessDataxJob {
	/**
	 * 按照数据库配置的ID增加调度任务
	 * 
	 * @param jobId
	 */
	public void addJob(long jobId);

	/**
	 * 增加调度任务，如果存在覆盖原有同ID的任务
	 * 
	 * @param jobId
	 */
	public void overWriteJob(long jobId);

	/**
	 * 增加调度所有有效的任务
	 */
	public void addAllJobs();

	/**
	 * 停止调度任务
	 * 
	 * @param jobId
	 */
	public void shutdownJob(long jobId);

	/**
	 * 停止清理所有的调度任务
	 */
	public void shutdownAllJobs();

}
