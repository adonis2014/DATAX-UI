package net.iharding.modules.job.jobtype;

import net.iharding.modules.meta.service.DataSourceService;

import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 元数据反转获取任务
 * @author admin
 *
 */
@Component("ImportMetaTask")
public class ImportMetaDataTask  extends AbstractTask {
	
	@Autowired
	private DataSourceService dataSourceService;

	/**
	 * 根据dsId执行反转数据导入
	 * @param dsId
	 */
	@Override
	public String execute(String dsId) {
		dataSourceService.importMeta(NumberUtils.toLong(dsId));
		return dsId;
	}
	
}
