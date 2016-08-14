
package com.taobao.datax.plugins.reader.hdfsreader;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;

import com.taobao.datax.common.exception.DataExchangeException;
import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.common.plugin.PluginStatus;
import com.taobao.datax.common.plugin.Splitter;
import com.taobao.datax.common.util.ETLDateUtils;
import com.taobao.datax.common.util.ETLStringUtils;
import com.taobao.datax.common.util.SplitUtils;
import com.taobao.datax.plugins.common.DFSUtils;


public class EnNiuHdfsDirSplitter extends Splitter {
	private List<Path> p = null;
	
	private List<String> patterns = null;

	private List<FileSystem> fs = null;

	@Override
	public int init() {
		String dir = param.getValue(ParamKey.dir);
		p=new ArrayList<Path>();
		patterns=new ArrayList<String>();
		fs=new ArrayList<FileSystem>();
		String ugi = param.getValue(ParamKey.ugi, null);
		String configure = param.getValue(ParamKey.hadoop_conf, "");
		//是否正则表达式扩展
//		if (ETLStringUtils)
		//;间隔多个目录
		String[] dirs=ETLStringUtils.split(dir,";");
		for(String dd:dirs){
			if (dd == null) {
				throw new DataExchangeException("Can't find the param ["
						+ ParamKey.dir + "] in hdfs-spliter-param.");
			}
			if (dd.endsWith("*")) {//需要获取符合该表达式的所有目录
				String dt= dd.substring(dd.lastIndexOf("/")+1,dd.length()-1);
				dd = dd.substring(0, dd.lastIndexOf("/"));
				Path p0=new Path(dd);
				p.add(p0);
				patterns.add(dt);
				try {
					FileSystem fs0 = FileSystem.get(DFSUtils.getConf(dd, ugi, configure));
					if (!fs0.exists(p0)) {
						IOUtils.closeStream(fs0);
						throw new DataExchangeException("the path[" + dir
								+ "] does not exist.");
					}
					fs.add(fs0);
				} catch (Exception e) {
					throw new DataExchangeException("Can't create the HDFS file system:"
							+ e);
				}
			}else{
				patterns.add(null);
				//判断是否有通配符植入时间日期字符串
				if (dd.indexOf("{currDate}")>=0){
					String format=param.getValue(ParamKey.format,"yyyy-MM-dd");
					String days=param.getValue(ParamKey.days,"-1");
					String isJob=param.getValue(ParamKey.isJob,"0");
					if ("1".equalsIgnoreCase(isJob)){
						String currDate=ETLDateUtils.dateAddDays(ETLDateUtils.getCurrTimestamp(), NumberUtils.toInt(days,-1), format);
						dd=ETLStringUtils.replace(dd,"{currDate}", currDate);
					}
				}
				Path p0=new Path(dd);
				p.add(p0);
				try {
					FileSystem fs0 = FileSystem.get(DFSUtils.getConf(dd, ugi, configure));
					if (!fs0.exists(p0)) {
						IOUtils.closeStream(fs0);
						throw new DataExchangeException("the path[" + dd
								+ "] does not exist.");
					}
					fs.add(fs0);
				} catch (Exception e) {
					throw new DataExchangeException("Can't create the HDFS file system:"
							+ e);
				}
			}
		}
		return PluginStatus.SUCCESS.value();
	}
	
	private List<PluginParam> getSplitFiles(FileSystem theFs ,Path path,String pattern){
		List<PluginParam> v = new ArrayList<PluginParam>();
		try {
			FileStatus[]  status = theFs.listStatus(path);
			for (FileStatus state : status) {
				if (state.isFile()) {
					String file = state.getPath().toString();
					PluginParam oParams = SplitUtils.copyParam(param);
					oParams.putValue(ParamKey.dir, file);
					v.add(oParams);
				}else if (state.isDirectory()){
					if (pattern!=null){//需要过滤子目录
						if (state.getPath().toString().indexOf(pattern)>=0){//符合前缀过滤
							v.addAll(getSplitFiles(theFs,new Path(state.getPath().toString()),pattern));
						}
					}else{
						v.addAll(getSplitFiles(theFs,new Path(state.getPath().toString()),pattern));
					}
				}
			}
		}catch (IOException e) {
			e.printStackTrace();
			throw new DataExchangeException(
					"some errors have happened in fetching the file-status:"
							+ e.getCause());
		}
		return v;
	}

	@Override
	public List<PluginParam> split() {
		List<PluginParam> v = new ArrayList<PluginParam>();
		for(int i=0;i<fs.size();i++){
			v.addAll(getSplitFiles(fs.get(i),p.get(i),patterns.get(i)));
		}
		return v;
	}

}
