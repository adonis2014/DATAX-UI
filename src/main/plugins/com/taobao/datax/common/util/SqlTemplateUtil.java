package com.taobao.datax.common.util;

import java.io.StringWriter;

import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;

public class SqlTemplateUtil {

	private static VelocityEngine ve = new VelocityEngine();
	private static  VelocityContext velocityContext = new VelocityContext();
	 
	
	static{
		 ve.init();
		 velocityContext.put("StringUtils", new ETLStringUtils());
		 velocityContext.put("DateUtils", new ETLDateUtils());
	}
	
	public static String getTemplateSql(String sqlTemplate){
		 StringWriter sw = new StringWriter();
         ve.evaluate(velocityContext, sw,"",sqlTemplate);
        return sw.toString();
	}
}
