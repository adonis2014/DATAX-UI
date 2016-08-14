package com.taobao.datax.plugins.reader.hbasereader;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.hbase.util.Pair;
import org.apache.log4j.Logger;

import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.common.plugin.PluginStatus;
import com.taobao.datax.common.plugin.Splitter;
import com.taobao.datax.common.util.SplitUtils;

public class EnNiuHBaseReaderSplitter extends Splitter {

	private Logger logger = Logger.getLogger(this.getClass());

	private String tableName = null;

	private String columns = null;

	private String hbaseConf = null;

	private String rowkeyRange = null;

	private EnNiuHBaseProxy proxy = null;
	
	private String isSaveOneObj = "false";
	
	private String oneObjColName = "data";
	
	private String oneObjColumnNames = "";
	
	private List<String> ooColumnNames = null;
	
	private String oneObjName="EN_User";
	
	private String oneObjFamilyName="cf";
	@Override
	public int init() {
		this.tableName = this.param.getValue(ParamKey.htable);
		this.columns = this.param.getValue(ParamKey.columns_key);
		this.hbaseConf = this.param.getValue(ParamKey.hbase_conf);
		this.rowkeyRange = this.param.getValue(ParamKey.rowkey_range, "");
		this.isSaveOneObj =  param.getValue(ParamKey.isSaveOneObj, this.isSaveOneObj);
		this.oneObjColName = param.getValue(ParamKey.oneObjColName, this.oneObjColName);
		this.oneObjColumnNames = param.getValue(ParamKey.oneObjColumnNames, this.oneObjColumnNames);
		this.ooColumnNames=Arrays.asList(oneObjColumnNames.split(","));
		this.oneObjName=param.getValue(ParamKey.oneObjName,this.oneObjName);
		this.oneObjFamilyName=param.getValue(ParamKey.oneObjFamilyName,this.oneObjFamilyName);
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public List<PluginParam> split() {
		List<PluginParam> ret = new ArrayList<PluginParam>();

		try {
			this.proxy = EnNiuHBaseProxy.newProxy(hbaseConf, tableName,isSaveOneObj,oneObjFamilyName,oneObjColName,ooColumnNames,oneObjName);

			if (StringUtils.isBlank(rowkeyRange)) {
				rowkeyRange  = ",";
				param.putValue(ParamKey.rowkey_range, rowkeyRange);
			}
			
			Pair<byte[][], byte[][]> regionRanges = proxy.getStartEndKeys();
			if (null == regionRanges) {
				ret = super.split(param);
			} else {
				String userStartKey = null;
				String userEndKey = null;

				if (!StringUtils.isBlank(rowkeyRange)) {
					if (!rowkeyRange.contains(",")) {
						throw new IllegalArgumentException(
								"rowkeyrange must be like 'startkey,endkey'");
					}

					rowkeyRange = " " + rowkeyRange + " ";
					String[] tmps = rowkeyRange.split(",");
					if (!StringUtils.isBlank(tmps[0])) {
						userStartKey = tmps[0].trim();
					}

					if (!StringUtils.isBlank(tmps[1])) {
						userEndKey = tmps[1].trim();
					}
				}

				if (null != userEndKey
						&& null != userStartKey
						&& Bytes.compareTo(userStartKey.getBytes(),
								userEndKey.getBytes()) > 0) {
					throw new IllegalArgumentException(String.format(
							"startkey %s cannot be larger than endkey %s .",
							userStartKey, userEndKey));
				}

				logger.info(String.format(
						"HBaseReader split job into %d sub-jobs .",
						regionRanges.getFirst().length));

				for (int i = 0; i < regionRanges.getFirst().length; i++) {
					PluginParam p = SplitUtils.copyParam(param);

					String thisStartKey = null;
					if (null != userStartKey
							&& 0 != regionRanges.getFirst()[i].length) {
						if (Bytes.compareTo(userStartKey.getBytes(),
								regionRanges.getFirst()[i]) < 0) {
							thisStartKey = Bytes.toString(regionRanges.getFirst()[i]);
						} else {
							thisStartKey = userStartKey;
						}
					} else if (null == userStartKey
							&& 0 == regionRanges.getFirst()[i].length) {
						thisStartKey = null;
					} else if (0 != regionRanges.getFirst()[i].length) {
						thisStartKey = Bytes.toString(regionRanges.getFirst()[i]);
					} else {
						thisStartKey = userStartKey;
					}

					String thisEndKey = null;
					if (null != userEndKey
							&& 0 != regionRanges.getSecond()[i].length) {
						if (Bytes.compareTo(userEndKey.getBytes(),
								regionRanges.getSecond()[i]) > 0) {
							thisEndKey = Bytes.toString(regionRanges.getSecond()[i]);
						} else {
							thisEndKey = userEndKey;
						}
					} else if (null == userEndKey
							&& 0 == regionRanges.getSecond()[i].length) {
						thisEndKey = null;
					} else if (null != userEndKey) {
						thisEndKey = userEndKey;
					} else {
						thisEndKey = Bytes.toString(regionRanges.getSecond()[i]);
					}
					p.putValue(ParamKey.rowkey_range, (thisStartKey == null ? ""
							: thisStartKey) + "," + (thisEndKey == null ? ""
									: thisEndKey));
					ret.add(p);
				}
			}
		} catch (IOException e) {
			ret = super.split(param);
		} finally {
			try {
				if (null != proxy) {
					proxy.close();
				}
			} catch (IOException e) {
				/* swallow exception */
			}
		}

		return ret;
	}
}
