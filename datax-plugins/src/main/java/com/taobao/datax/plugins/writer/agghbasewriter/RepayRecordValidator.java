package com.taobao.datax.plugins.writer.agghbasewriter;

import java.util.Map;

import net.iharding.utils.ETLConstants;

import org.apache.commons.lang.StringUtils;

import com.taobao.datax.common.model.DataProcessEntity;
import com.taobao.datax.common.model.DataProcessField;
import com.taobao.datax.common.plugin.BaseRecordValidator;

public class RepayRecordValidator extends BaseRecordValidator {

	@Override
	public boolean validate(Map<String, String> curRow, DataProcessEntity dpEntity) {
		// userid=-1,取消
		if (null==curRow.get("USERID")) {
			return false;
		}
		if (!"2".equalsIgnoreCase(curRow.get("STATE"))){
			return false;
		}
		// 判断UserId,pk是否有值，没有则忽略该记录
		for (DataProcessField field : dpEntity.getFields()) {
			if (field.getFieldType() == ETLConstants.FIELD_TYPE_PRIMKEY) {
				if (StringUtils.isEmpty(curRow.get(field.getColumnName()))) {
					return false;
				}
				
			}
		}
		return true;
	}

}
