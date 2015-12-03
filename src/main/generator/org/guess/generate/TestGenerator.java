package org.guess.generate;

import java.util.Date;

import com.taobao.datax.common.util.ETLDateUtils;

public class TestGenerator {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(ETLDateUtils.formatToSolrDate(new Date(1447027528000l)));
	}

}
