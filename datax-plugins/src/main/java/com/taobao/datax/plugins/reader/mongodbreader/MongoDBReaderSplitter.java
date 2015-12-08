package com.taobao.datax.plugins.reader.mongodbreader;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.common.plugin.PluginStatus;
import com.taobao.datax.common.plugin.Splitter;
import com.taobao.datax.common.util.SplitUtils;

public class MongoDBReaderSplitter extends Splitter {

	private List<String> collictions;

	private Logger logger = Logger.getLogger(MongoDBReaderSplitter.class);

	public MongoDBReaderSplitter(PluginParam iParam) {
		param = iParam;
	}

	@Override
	public int init() {
		String tables = param.getValue(ParamKey.collectionName);
		collictions = SplitUtils.splitTables(tables);
		logger.info("MysqlReaderSpliter initialize successfully.");
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public List<PluginParam> split() {
		ArrayList<PluginParam> listParms = new ArrayList<PluginParam>();
		for (String table : collictions) {
			PluginParam oParams = SplitUtils.copyParam(param);
			oParams.putValue(ParamKey.collectionName, table);
			listParms.add(oParams);
		}
		logger.info(" MongoDBReaderSplitter splits successfully.");
		return listParms;
	}

}
