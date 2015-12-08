package com.taobao.datax.common.model;

import java.util.Comparator;

public class DataFieldSortByID implements Comparator<DataProcessField> {
	
	public int compare(DataProcessField o1, DataProcessField o2) {
		if (o1.getSortId() > o2.getSortId())return 1;
		return 0;
	}

}
