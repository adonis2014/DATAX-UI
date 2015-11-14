package com.taobao.datax.plugins.writer.hbasewriter;

import java.util.ArrayList;
import java.util.List;

import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.common.plugin.PluginStatus;
import com.taobao.datax.common.plugin.Splitter;
import com.taobao.datax.common.util.SplitUtils;

public class HBaseWriterSplitter  extends Splitter{

	private int splitnum = 1;

	@Override
	public int init() {
		splitnum = param.getIntValue(ParamKey.concurrency, splitnum);
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public List<PluginParam> split() {
		List<PluginParam> v = new ArrayList<PluginParam>();	
		for (int i = 0; i < splitnum; i++) {
			PluginParam oParams = SplitUtils.copyParam(param);
			v.add(oParams);
		}				
		return v;
	}

}
