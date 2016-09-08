package net.iharding.modules.job.jobtype;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.datanucleus.util.StringUtils;
import org.springframework.stereotype.Component;

import com.taobao.datax.common.constants.Constants;

/**
 * 执行shell 命令任务
 * 
 * @author Joe.zhang
 *
 */
@Component("CommandTask")
public class CommandTask extends AbstractTask{

	
	/**
	 * 执行命令 批量，多个命令按照\n换行符分割
	 * 
	 * @param cmd
	 */
	
	public String execute(String cmd) {
		InputStream in = null;
		try {
			String[] commands=StringUtils.split(cmd, ";");
			Process pro = Runtime.getRuntime().exec(commands);
			pro.waitFor();
			in = pro.getInputStream();
			BufferedReader read = new BufferedReader(new InputStreamReader(in));
			String result = read.readLine();
			log=result;
			return Constants.RET_SUCCESS+"";
		} catch (Exception e) {
			e.printStackTrace();
			return Constants.RET_FAIL+"";
		}
	}

	

}
