package com.taobao.datax.plugins.writer.udawriter;

import java.util.Map;

import com.taobao.datax.common.model.AggregationRecord;
import com.taobao.datax.common.model.DataProcessEntity;
import com.taobao.datax.common.plugin.RecordValueProc;
import com.taobao.datax.common.util.ETLStringUtils;

public class AddressDetailRecordValueProc implements RecordValueProc {

	public AddressDetailRecordValueProc() {
	}

	@Override
	public void endProcRow(Map<String, AggregationRecord> aggRows, AggregationRecord curRow, DataProcessEntity dpEntity) {
		String createtime =(String)curRow.getValue("CREATETIME");
		String importtime=(String)curRow.getValue("IMPORTTIME");
		String updatetime=(String)curRow.getValue("UPDATETIME");
		if (ETLStringUtils.isEmpty(createtime)){
			try{
				curRow.putValue("CREATETIME",importtime.substring(0, 19));
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}else{
			try{curRow.putValue("CREATETIME",createtime.substring(0, 19));}catch(Exception ex){}
		}
		if (importtime!=null){
			try{curRow.putValue("IMPORTTIME",importtime.substring(0, 19));}catch(Exception ex){
			}
		}
		if (updatetime!=null){
			try{curRow.putValue("UPDATETIME",updatetime.substring(0, 19));}catch(Exception ex){
			}
		}
	}

	@Override
	public void initRow(Map<String, AggregationRecord> aggRows, Map<String, String> curRow, DataProcessEntity dpEntity) {
		
	}

}
