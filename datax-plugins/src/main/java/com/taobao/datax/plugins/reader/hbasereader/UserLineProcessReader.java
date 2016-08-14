package com.taobao.datax.plugins.reader.hbasereader;

import java.io.IOException;

import org.apache.commons.lang.StringUtils;

import com.taobao.datax.common.plugin.Line;
import com.taobao.datax.common.plugin.LineProcessReader;
import com.taobao.datax.common.plugin.PluginParam;

public class UserLineProcessReader implements LineProcessReader {

	private String tableName = null;

	private String hbaseConf = null;
	
	private HBaseFindProxy fproxy=null;
	
	@Override
	public boolean execute(Line line) {
		String row=StringUtils.reverse(line.getField(0));
		try {
			if (row==null){
				fproxy.delete(line.getField(94).getBytes());
				return false;
			}
			if (!fproxy.getRow(row.getBytes())){
				fproxy.delete(row.getBytes());
				return false;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return true;
	}

	@Override
	public boolean init(PluginParam param) {
		this.tableName = param.getValue(ParamKey.htable);
		this.hbaseConf = param.getValue(ParamKey.hbase_conf);
		try {
			this.fproxy=HBaseFindProxy.newProxy(hbaseConf,tableName,"DA.USER");
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public int finish() {
		try {
			fproxy.flush();
			fproxy.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
