package com.taobao.datax.plugins.writer.pipehbasehdfswriter;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.taobao.datax.common.model.AggregationRecord;
import com.taobao.datax.common.model.DataFieldSortByID;
import com.taobao.datax.common.model.DataProcessEntity;
import com.taobao.datax.common.model.DataProcessField;
import com.taobao.datax.common.plugin.DataProcessUtils;
import com.taobao.datax.common.plugin.DataProcessor;
import com.taobao.datax.common.plugin.Line;
import com.taobao.datax.common.plugin.RecordValidator;
import com.taobao.datax.common.plugin.RecordValueProc;
import com.taobao.datax.common.util.ETLConstants;
import com.taobao.datax.common.util.ETLStringUtils;
import com.taobao.datax.common.util.ZipStrUtil;

/**
 * 数据预统计合并或者清洗处理
 * 
 * @author admin
 * 
 */
public class PipeDataProcessor extends DataProcessor {

	private String columnsDefineJson;

	private List<DataProcessField> fields;
	
	private DataProcessEntity dpEntity;
	
	private boolean havAggr=false;
	private List<DataProcessField> siFields=new ArrayList<DataProcessField>();
	private List<DataProcessField> pkFields=new ArrayList<DataProcessField>();

	private Logger logger = Logger.getLogger(PipeDataProcessor.class);

	private PipeHBaseHdfsProxy proxy;

	ObjectMapper mapper = new ObjectMapper();

	private String encode = "utf-8";

	public PipeDataProcessor(PipeHBaseHdfsProxy proxy) {
		this.proxy = proxy;
	}
	RecordValidator rvValidator=null;
	RecordValueProc rvProc=null;
	
	@Override
	public void init() {
		super.init();
		encode = param.getValue(ParamKey.encoding, "UTF-8");
		columnsDefineJson = param.getValue(ParamKey.columns_json);
		ObjectMapper mapper = new ObjectMapper();
		File jsonFile = new File(columnsDefineJson);
		if (!jsonFile.canRead()) {
			String msg = " column define file can't read:" + columnsDefineJson;
			logger.error(msg);
			throw new IllegalArgumentException(msg);
		}
		try {
			dpEntity = mapper.readValue(jsonFile, new TypeReference<DataProcessEntity>() {});
			fields=dpEntity.getFields();
			Collections.sort(fields, new DataFieldSortByID());
			for (DataProcessField field : fields) {
				if (field.getFieldSourceType() == ETLConstants.FIELD_SOURCETYPE_INITVALUE ) {
					siFields.add(field);
				}
				if (field.getFieldType() == ETLConstants.FIELD_TYPE_PRIMKEY) {
					pkFields.add(field);
				} 
				if (field.getFieldType()==ETLConstants.FIELD_TYPE_SUMMARY && (ETLStringUtils.isNotEmpty(field.getFunctionName()) 
						|| ETLStringUtils.isNotEmpty(field.getScript()))){
					havAggr=true;
				}
			}
			try {
				if (StringUtils.isNotEmpty(dpEntity.getValidatorClassName())){
					rvValidator=(RecordValidator)Class.forName(dpEntity.getValidatorClassName()).newInstance();
				}
			}catch (Exception e) {
			}
			try {
				if (StringUtils.isNotEmpty(dpEntity.getProcessClassName())){
					rvProc=(RecordValueProc)Class.forName(dpEntity.getProcessClassName()).newInstance();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		} catch (IOException e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			throw new IllegalArgumentException(e.getMessage());
		}
	}

	@Override
	public Map<String, AggregationRecord> getLines(List<Line> lines) {
		Map<String, AggregationRecord> aggRows = new ConcurrentHashMap<String, AggregationRecord>();
		Map<String, String> curRow = new ConcurrentHashMap<String, String>();
		List<String> rowKeyColumns = new ArrayList<String>();
		// 聚合数据集合
		for (Line row : lines) {
			for (DataProcessField field : siFields) {
				if (StringUtils.isNotEmpty(row.checkAndGetField(field.getId()))){
					curRow.put(field.getColumnName(), row.checkAndGetField(field.getId()));
				}
			}
			//初始化行集对象，可以根据字段获取join数据
			if (rvProc!=null)rvProc.initRow(aggRows,curRow,dpEntity);
			// 获取rowKey
			for (DataProcessField field : pkFields) {
				String pv=DataProcessUtils.processPKValue(null, curRow, field);
				if (pv!=null){
					rowKeyColumns.add(pv);
				}else{
					break;
				}
			}
			if (rowKeyColumns.size()!=pkFields.size()){
				rowKeyColumns.clear();
				continue;
			}
			String rowKey = this.getRowIdFromCloumn(rowKeyColumns);
			// 从集合中获取已经存在的聚合记录
			AggregationRecord record = aggRows.get(rowKey);
			if (record == null) {
				record = new AggregationRecord();
				record.setRowKey(rowKey);
			}
			record.setRowNum(record.getRowNum() + 1);
			if (havAggr)record.setAggRowNum(record.getAggRowNum() + 1);
			//处理获取列
			for (DataProcessField field : fields) {
				if (field.getFieldType() == ETLConstants.FIELD_TYPE_SUMMARY) {
					// 聚合记录
					DataProcessUtils.aggValue(record, curRow, field);
				} else {
					String pv=DataProcessUtils.processValue(record, curRow, field);
					if (StringUtils.isNotEmpty(pv)){
						record.putValue(field.getColumnName(),pv);
					}
				}
			}
			aggRows.put(rowKey, record);
			curRow.clear();
			rowKeyColumns.clear();
		}
		return aggRows;
	}

	
	public boolean validate(Line line) {
		if (rvValidator==null)return true;
		Map<String, String> curRow = new ConcurrentHashMap<String, String>();
		//判断主键是否有值，没有则忽略该记录
		for (DataProcessField field : fields) {
			curRow.put(field.getColumnName(), line.checkAndGetField(field.getId()));
		}
		return rvValidator.validate(curRow, dpEntity);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public int saveOrUpdate(Map<String, AggregationRecord> rows) {
		//批量获取原始记录集
		Map<String,AggregationRecord> oriRecords=proxy.getRecords(rows.keySet(), fields, encode);
		for (Map.Entry<String, AggregationRecord> entry : rows.entrySet()) {
			try {
				proxy.prepare(entry.getKey().getBytes());
				AggregationRecord orirecord = oriRecords.get(entry.getKey());
				AggregationRecord curRecord=entry.getValue();
				if (orirecord != null) {// 聚合记录
					curRecord=DataProcessUtils.aggRecord(curRecord,orirecord,fields);
				}
				//在所有数据取完后
				if (rvProc!=null)rvProc.endProcRow(rows,curRecord,dpEntity);
				for (DataProcessField field : fields) {
					if (field.getFieldType() != ETLConstants.FIELD_TYPE_ORI) {// 只保存聚合表字段数据
						Object lineValue = curRecord.getValue(field.getColumnName());
						if (lineValue!=null && ETLStringUtils.isNotEmpty(lineValue.toString())){
							if (field.getCompress()==1){
								proxy.add(field.getFamilyName().getBytes(encode), field.getColumnName().getBytes(encode),ZipStrUtil.compress(mapper.writeValueAsString(lineValue)).getBytes());
							}else if (lineValue instanceof String || lineValue instanceof Integer || lineValue instanceof Date
									|| lineValue instanceof Float || lineValue instanceof Double || lineValue instanceof Long){
								proxy.add(field.getFamilyName().getBytes(encode), field.getColumnName().getBytes(encode),lineValue.toString().getBytes());
							}else{
								proxy.add(field.getFamilyName().getBytes(encode), field.getColumnName().getBytes(encode),mapper.writeValueAsString(lineValue).getBytes());
							}
							
						}
					}
				}
				proxy.insert(entry.getKey(), null);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		try {
			proxy.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ETLConstants.RET_SUCCESS;
	}

}
