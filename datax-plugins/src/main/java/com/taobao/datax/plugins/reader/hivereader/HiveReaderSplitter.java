
package com.taobao.datax.plugins.reader.hivereader;

import static java.text.MessageFormat.format;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.common.plugin.PluginStatus;
import com.taobao.datax.common.plugin.Splitter;
import com.taobao.datax.common.util.SplitUtils;
import com.taobao.datax.common.util.SqlTemplateUtil;


public class HiveReaderSplitter extends Splitter {
	
	private List<String> tableNames;

	private static final String SQL_WITHOUT_WHERE_PATTERN = "select {0} from {1}";

	private static final String SQL_WITH_WHERE_PATTERN = "select {0} from {1} where {2}";

	private Logger logger = Logger.getLogger(HiveReaderSplitter.class);
	
	public HiveReaderSplitter(PluginParam iParam){
		param = iParam;
	}
	                                           
	
	@Override
	public int init() {
		String tables = param.getValue(ParamKey.tables);
		tableNames = SplitUtils.splitTables(tables);
		logger.info("hiveReaderSpliter initialize successfully.");
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public List<PluginParam> split() {
		return this.splitParamsList(param);
	}

	private List<PluginParam> splitParamsList(PluginParam iParams) {
		ArrayList<PluginParam> listParms = new ArrayList<PluginParam>();
		
		String where = iParams.getValue(ParamKey.where, null);
		String isVelocity=iParams.getValue(ParamKey.isVelocity, null);
		String columns = iParams.getValue(ParamKey.columns,
				"*");
		for (String table : tableNames) {
			PluginParam oParams = SplitUtils.copyParam(iParams);
			String sql;
			if (StringUtils.isBlank(where)) {
				sql = format(SQL_WITHOUT_WHERE_PATTERN, columns, table);
			} else {
				if ( "true".equalsIgnoreCase(isVelocity)){
					sql = format(SQL_WITH_WHERE_PATTERN, columns, table,SqlTemplateUtil.getTemplateSql(where));
				}else{
					sql = format(SQL_WITH_WHERE_PATTERN, columns, table,where);
				}				
			}
			oParams.putValue(ParamKey.sql, sql);
			listParms.add(oParams);
		}
		logger.info(" hiveReaderSpliter splits successfully.");
		return listParms;
	}
}
