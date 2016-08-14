package com.taobao.datax.plugins.writer.agghbasewriter;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

import com.taobao.datax.common.model.AggregationRecord;
import com.taobao.datax.common.model.DataProcessEntity;
import com.taobao.datax.common.plugin.RecordValueProc;

public class BillTypeRecordValueProc implements RecordValueProc{

	@Override
	public void endProcRow(Map<String, AggregationRecord> aggRows, AggregationRecord curRow, DataProcessEntity dpEntity) {
		
	}

	@Override
	public void initRow(Map<String, AggregationRecord> aggRows, Map<String, String> curRow, DataProcessEntity dpEntity) {
		String mailid = curRow.get("mailid");
		int mid=NumberUtils.toInt(mailid,-9);
		if (mid==0){
			curRow.put("billtype", "0");//手输账单
		}else if (mid>0){
			curRow.put("billtype", "1");//转发账单
		}else if (mid==-1){
			String outbillid=curRow.get("outbillid");
			if (StringUtils.isEmpty(outbillid)){
				curRow.put("BILLTYPE", "5");//其它账单
			}else if (outbillid.matches("^[0-9]*$")){
				curRow.put("BILLTYPE", "2");//网银信用卡账单
			}else if (outbillid.matches("^[0-9]{1,}\\_[0-9]{1,}\\_[0-9]{1,}")){
				String AutoReturnCard=curRow.get("autoreturncard");
				if ("1".equalsIgnoreCase(AutoReturnCard)){
					curRow.put("BILLTYPE", "3");//一手邮件账单
				}else{
					curRow.put("BILLTYPE", "4");//非一手邮件账单
				}
			}else{
				curRow.put("BILLTYPE", "5");//其它账单
			}
		}else{
			curRow.put("BILLTYPE", "5");//其它账单
		}
	}

}
