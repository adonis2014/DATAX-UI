package com.taobao.datax.plugins.writer.agghbasewriter;

import java.util.Map;

import com.taobao.datax.common.model.AggregationRecord;
import com.taobao.datax.common.model.DataProcessEntity;
import com.taobao.datax.common.plugin.RecordValueProc;

public class AddressDetailRecordValueProc implements RecordValueProc {

	public AddressDetailRecordValueProc() {
	}

	@Override
	public void endProcRow(Map<String, AggregationRecord> aggRows,AggregationRecord curRow, DataProcessEntity dpEntity) {
		
	}

	@Override
	public void initRow(Map<String, AggregationRecord> aggRows, Map<String, String> curRow, DataProcessEntity dpEntity) {
		String createtime = curRow.get("CREATETIME");
		if (createtime==null){
			curRow.put("CREATETIME", curRow.get("IMPORTTIME"));
		}
	}

}
