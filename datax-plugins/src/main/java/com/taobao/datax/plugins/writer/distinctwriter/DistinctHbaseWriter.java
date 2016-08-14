package com.taobao.datax.plugins.writer.distinctwriter;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;

import com.taobao.datax.common.exception.DataExchangeException;
import com.taobao.datax.common.plugin.Line;
import com.taobao.datax.common.plugin.LineReceiver;
import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.common.plugin.PluginStatus;
import com.taobao.datax.common.plugin.Writer;
import com.taobao.datax.common.util.ETLConstants;
import com.taobao.datax.common.util.ETLDateUtils;
import com.taobao.datax.common.util.ETLStringUtils;

public class DistinctHbaseWriter extends Writer {

	private static final int DEFAULT_BUFFER_SIZE = 16 * 1024 * 1024;

	private String tablename;
	
	private String readTableName;

	private String encode = "utf-8";

	private DistinctHBaseProxy proxy;
	ObjectMapper mapper = new ObjectMapper();

	private boolean autoflush;

	private String hbase_conf;

	private String[] columnNames;
	
	private String[] readColumnNames;

	private int bufferSize;

	private String[] families = null;

	private String[] qualifiers = null;

	private int[] columnIndexes;

	private int rowkeyIndex;

	private String rowKeyRule = "0";

	// rowid设置方式
	private int rowKeyRuleValue = 0;
	// 求余数方式计算rowId的参数
	private Integer fieldvalueLen = 15;
	private Integer remainder = 200;
	private Integer remainderLen = 3;
	private String rowIdPattern = "yyyy-MM-dd";
	
	// 多个字段组合方式
	private int[] rowIdIdx;// 字段index值，数字集合
	private Logger logger = Logger.getLogger(DistinctHbaseWriter.class);

	@Override
	public List<PluginParam> split(PluginParam param) {
		DistinctHBaseWriterSplitter spliter = new DistinctHBaseWriterSplitter();
		spliter.setParam(param);
		spliter.init();
		return spliter.split();
	}

	@Override
	public int prepare(PluginParam param) {
		this.logger.info("DataX HBaseWriter do prepare work .");

		return this.finish();
	}

	@Override
	public int post(PluginParam param) {
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int init() {
		tablename = param.getValue(ParamKey.htable);
		readTableName=param.getValue(ParamKey.readtable);
		hbase_conf = param.getValue(ParamKey.hbase_conf);
		encode = param.getValue(ParamKey.encoding, "UTF-8");
		autoflush = param.getBoolValue(ParamKey.autoFlush, false);
		bufferSize = param.getIntValue(ParamKey.bufferSize, DEFAULT_BUFFER_SIZE);
		rowKeyRule = param.getValue(ParamKey.rowKeyRule, this.rowKeyRule);
		// 分解参数规则
		if ("0".equalsIgnoreCase(rowKeyRule)) {// 直接使用指定字段作为rowId
			this.rowKeyRuleValue = 0;
		} else if (rowKeyRule.startsWith("1")) {// 使用求余数方式计算rowId
			this.rowKeyRuleValue = 1;
			String[] rules = rowKeyRule.split(",");
			fieldvalueLen = NumberUtils.toInt(rules[1]);
			remainder = NumberUtils.toInt(rules[2]);
			remainderLen = NumberUtils.toInt(rules[3]);
		} else if (rowKeyRule.startsWith("2")) {// 使用组合字段方式计算rowId
			this.rowKeyRuleValue = 2;
			String[] rules = rowKeyRule.split(",");
			int id = 0;
			String[] rids = rules[1].split("/");
			this.rowIdIdx = new int[rids.length];
			for (String idx : rids) {
				this.rowIdIdx[id] = NumberUtils.toInt(idx);
				id++;
			}
		} else if (rowKeyRule.startsWith("3")) {
			this.rowKeyRuleValue = 3;
			String[] rules = rowKeyRule.split(",");
			rowIdPattern = rules[1];
		} else if (rowKeyRule.startsWith("4")) {
			this.rowKeyRuleValue = 4;
		} else if (rowKeyRule.startsWith("5")) {// 使用组合字段首字段倒序方式计算rowId
			this.rowKeyRuleValue = 5;
			String[] rules = rowKeyRule.split(",");
			int id = 0;
			String[] rids = rules[1].split("/");
			this.rowIdIdx = new int[rids.length];
			for (String idx : rids) {
				this.rowIdIdx[id] = NumberUtils.toInt(idx);
				id++;
			}
		}else if (rowKeyRule.startsWith("6")) {// 使用组合字段首字段倒序方式计算rowId
			this.rowKeyRuleValue = 6;
			String[] rules = rowKeyRule.split(",");
			int id = 0;
			String[] rids = rules[1].split("/");
			this.rowIdIdx = new int[rids.length];
			for (String idx : rids) {
				this.rowIdIdx[id] = NumberUtils.toInt(idx);
				id++;
			}
		}
		/* if user does not set rowkey index, use 0 for default. */
		rowkeyIndex = param.getIntValue(ParamKey.rowkey_index, 0, 0, Integer.MAX_VALUE);

		if (bufferSize < 0 || bufferSize >= 32 * 1024 * 1024) {
			throw new IllegalArgumentException("buffer size must be [0M-32M] .");
		}
		// 获取要写入hbase的字段，使用cf:fieldName方式写，","间隔
		try{
			columnNames = param.getValue(ParamKey.column_name).split(",");
			families = new String[columnNames.length];
			qualifiers = new String[columnNames.length];
			for (int i = 0; i < columnNames.length; i++) {
				if (!columnNames[i].contains(":")) {
					throw new IllegalArgumentException(String.format("Column %s must be like 'family:qualifier'", columnNames[i]));
				}
				String[] tmps = columnNames[i].split(":");
				families[i] = tmps[0].trim();
				qualifiers[i] = tmps[1].trim();
			}
		}catch(Exception ex){
		}
		try{
			readColumnNames = param.getValue(ParamKey.read_columns_value).split(",");
		}catch(Exception ex){
		}
		
		/*
		 * test if user has set column_value_index(读取的字段集合，按照数字集合，从0开始，使用","间隔)
		 * . if set, use the value set by user if not set, use the default
		 * value, [1, length of column_name]
		 */
		if (param.hasValue(ParamKey.column_value_index)) {
			String[] indexes = param.getValue(ParamKey.column_value_index).split(",");
			if (indexes.length != columnNames.length) {
				String msg = String.format("HBase column index is different form column name: \nColumnName %s\nColumnIndex %s\n", param.getValue(ParamKey.column_name),
						param.getValue(ParamKey.column_value_index));
				logger.error(msg);
				throw new IllegalArgumentException(msg);
			}
			columnIndexes = new int[indexes.length];
			for (int i = 0; i < indexes.length; i++) {
				columnIndexes[i] = Integer.valueOf(indexes[i]);
			}
		} else {// 默认从1到字段长度
			if (columnNames!=null){
				columnIndexes = new int[columnNames.length];
				for (int i = 0; i < rowkeyIndex; i++) {
					columnIndexes[i] = i;
				}
				for (int i = rowkeyIndex; i < columnIndexes.length; i++) {
					columnIndexes[i] = i + 1;
				}
			}
		}
		try {
			this.proxy = DistinctHBaseProxy.newProxy(hbase_conf, tablename,readTableName,readColumnNames);
			this.proxy.setAutoFlush(autoflush);
			this.proxy.setBufferSize(bufferSize);
			if (null == this.proxy || !this.proxy.check()) {
				throw new DataExchangeException("HBase Client initilize failed .");
			}
			return PluginStatus.SUCCESS.value();
		} catch (IOException e) {
			if (null != proxy) {
				try {
					proxy.close();
				} catch (IOException e1) {
				}
			}
			throw new DataExchangeException(e.getCause());
		}
	}

	@Override
	public int connect() {
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int startWrite(LineReceiver receiver) {
		Line line;
		int fieldNum;

		/*
		 * NOTE: field numbers in each line may be different
		 */
		while ((line = receiver.getFromReader()) != null) {
			try {
				fieldNum = line.getFieldNum();

				if (null == line.checkAndGetField(rowkeyIndex) || StringUtils.isEmpty(line.getField(rowkeyIndex))) {
					throw new IOException("rowkey is missing .");
				}

				if (0 == fieldNum || 1 == fieldNum) {
					logger.warn("HBaseWriter meets an empty line, ignore it .");
					continue;
				}
				// rowKey计算方式，可以自己定义增加多种方式
				switch (rowKeyRuleValue) {
				case 0:// 直接使用指定字段作为rowId
				{
					byte[] rk=line.getField(rowkeyIndex).getBytes(encode);
					proxy.prepare(rk,rk);
					break;
				}
				case 1:// 使用求余数方式计算rowId
				{
					String rowId = line.getField(rowkeyIndex);
					if (!NumberUtils.isDigits(rowId)) {
						logger.warn("rowid指定字段不是数字，不能求余数:" + rowId);
						continue;
					}
					//todo 反算求余数方式
					byte[] rds=ETLStringUtils.getReverseRemainderRowId(rowId, remainderLen).getBytes(encode);
					proxy.prepare(rds,rds);
					break;
				}
				case 2:// 使用组合字段方式计算rowId
				{
					String rowId = line.getField(rowkeyIndex);
					String[] rowIds=ETLStringUtils.split(rowId,ETLConstants.separator);
					proxy.prepare(rowId.getBytes(encode),rowIds[0].getBytes(encode));
					break;
				}
				case 3:// 日期+自增长方式
				{
					String rowId = line.getField(rowkeyIndex);
					String[] rowIds=ETLStringUtils.split(rowId,ETLConstants.separator);
					proxy.prepare(rowId.getBytes(encode),rowIds[0].getBytes(encode));
					break;
				}
				case 4:// 指定字段倒序方式
				{
					String rowId = line.getField(rowkeyIndex);
					proxy.prepare(rowId.getBytes(encode),ETLStringUtils.reverse(rowId).getBytes(encode));
					break;
				}
				case 5:// 首字段倒序不反转，组合字段
				{
					String rowId = line.getField(rowkeyIndex);
					String[] rowIds=ETLStringUtils.split(rowId,ETLConstants.separator);
					proxy.prepare(rowId.toString().getBytes(encode),rowIds[0].getBytes(encode));
					break;
				}case 6:// 首字段倒序反转计算，组合字段
				{
					String rowId = line.getField(rowkeyIndex);
					String[] rowIds=ETLStringUtils.split(rowId,ETLConstants.separator);
					proxy.prepare(rowId.toString().getBytes(encode),ETLStringUtils.reverse(rowIds[0]).getBytes(encode));
					break;
				}
				}
				if (columnIndexes!=null){
					for (int i = 0; i < columnIndexes.length; i++) {
						if (null == line.checkAndGetField(columnIndexes[i])) {
							continue;
						}
						if (StringUtils.isNotEmpty(line.getField(columnIndexes[i]))) {
							proxy.add(families[i].getBytes(encode), qualifiers[i].getBytes(encode), line.getField(columnIndexes[i]).getBytes(encode));
						}
					}
				}
				proxy.insert();
				this.monitor.lineSuccess();
			} catch (IOException e) {
				this.getMonitor().lineFail(e.getMessage());
			}
		}

		return PluginStatus.SUCCESS.value();
	}

	public String getDateStr(String dateStr) {
		Date day = ETLDateUtils.parseDate(dateStr, "yyyy-MM-dd HH:mm:ss SSS");
		if (day == null) {
			return dateStr;
		}
		return ETLDateUtils.formatDate(day, ETLConstants.DATE_FORMAT_SSS);
	}

	public static int daysBetween(String smdate, String bdate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		try {
			cal.setTime(sdf.parse(smdate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long time1 = cal.getTimeInMillis();
		try {
			cal.setTime(sdf.parse(bdate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);

		return Integer.parseInt(String.valueOf(between_days));
	}

	@Override
	public int commit() {
		this.logger.info("HBaseWriter starts to commit records .");
		try {
			proxy.flush();
			return PluginStatus.SUCCESS.value();
		} catch (IOException e) {
			try {
				proxy.close();
			} catch (IOException e1) {
			}
			throw new DataExchangeException(e.getCause());
		}
	}

	@Override
	public int finish() {
		try {
			proxy.close();
			return PluginStatus.SUCCESS.value();
		} catch (IOException e) {
			throw new DataExchangeException(e.getCause());
		}
	}


}
