package com.taobao.datax.common.plugin;

import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.taobao.datax.common.model.DataProcessEntity;
import com.taobao.datax.common.model.DataProcessField;
import com.taobao.datax.utils.ETLConstants;

public abstract class BaseRecordValidator implements RecordValidator {
	/**
	 * 判读主键值是否存在，不存在则忽略该记录
	 * 
	 * @param curRow
	 * @param dpEntity
	 * @return
	 */
	protected boolean ValidatePrimaryKey(Map<String, String> curRow, DataProcessEntity dpEntity) {
		// 判断主键是否有值，没有则忽略该记录
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
