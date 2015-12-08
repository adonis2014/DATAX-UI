package com.taobao.datax.utils;

import com.taobao.datax.common.constants.Constants;

public class ETLConstants extends Constants{

	

	
	public static final int FIELD_SOURCETYPE_INITVALUE = 0;// 0-原始字段，从ID取值
	public static final int FIELD_SOURCETYPE_THIRD = 1;//1-第三方获取的字段
	public static final int FIELD_SOURCETYPE_AGGS = 2;//1-纯聚合处理字段，无原始数据字段
	
	public static final int FIELD_TYPE_ORI = 0;//原始字段
	public static final int FIELD_TYPE_VALUE = 1;// 1-取值字段
	public static final int FIELD_TYPE_PRIMKEY = 2;//2-主键组合字段
	public static final int FIELD_TYPE_SUMMARY = 3;//3-统计聚合字段

	
}
