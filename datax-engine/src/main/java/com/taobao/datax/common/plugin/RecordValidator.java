package com.taobao.datax.common.plugin;

import java.util.Map;

import com.taobao.datax.common.model.DataProcessEntity;

public interface RecordValidator {
	/**
     * 验证本对象是否合法
     * @return
     */
    boolean validate(Map<String, String> curRow, DataProcessEntity dpEntity);
    
}
