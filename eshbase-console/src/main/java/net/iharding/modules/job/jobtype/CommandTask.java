package net.iharding.modules.job.jobtype;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import net.iharding.utils.HBStringUtils;

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
			String line = null;  
			while((line = read.readLine()) != null) {  
				log += line;  
			}  
			return Constants.RET_SUCCESS+"";
		} catch (Exception e) {
			log=HBStringUtils.getErrorInfoFromException(e);
			return Constants.RET_FAIL+"";
		}
	}

	

}
