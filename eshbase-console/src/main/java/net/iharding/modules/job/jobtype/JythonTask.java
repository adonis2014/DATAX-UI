package net.iharding.modules.job.jobtype;

import org.springframework.stereotype.Component;

@Component("JythonTask")
public class JythonTask  extends AbstractTask {

	/**
	 * 执行python脚本
	 * 
	 * @param pythonStr
	 */
	@Override
	public String execute(String pythonStr) {
		return null;
	}

}
