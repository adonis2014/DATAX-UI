package com.taobao.datax.common.plugin;

import java.util.Map;

import com.taobao.datax.common.model.DataProcessEntity;
/**
 * 主键验证公共类
 * @author admin
 *
 */
public class PrimaryKeyRecordValidator extends BaseRecordValidator {

	@Override
	public boolean validate(Map<String, String> curRow, DataProcessEntity dpEntity) {
		return this.ValidatePrimaryKey(curRow, dpEntity);
	}

}
