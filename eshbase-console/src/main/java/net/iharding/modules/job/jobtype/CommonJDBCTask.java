package net.iharding.modules.job.jobtype;

import org.springframework.stereotype.Component;

/**
 * 通用jdbc命令调度
 * @author  Joe.zhang
 *
 */
@Component("CommonJDBCTask")
public class CommonJDBCTask   extends AbstractTask{

	/**
	 * 批量执行sql,按照\n换行符间隔
	 * @param sql
	 */
	public String execute(String sql) {
		return sql;
	}

	
}
