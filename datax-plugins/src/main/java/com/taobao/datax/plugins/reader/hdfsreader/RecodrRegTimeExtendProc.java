package com.taobao.datax.plugins.reader.hdfsreader;

import java.io.IOException;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.HConstants;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;

import com.taobao.datax.common.plugin.Line;
import com.taobao.datax.common.plugin.RecordReaderExtendProc;

public class RecodrRegTimeExtendProc implements RecordReaderExtendProc {

	private HTable table = null;

	@Override
	public Line extendRow(Line currLine) {
		Get get = new Get(Bytes.toBytes(StringUtils.reverse(currLine.getField(0))));
		get.addColumn("cf".getBytes(), "REGTIME".getBytes());
		Result rs;
		try {
			rs = getHTable().get(get);
			if (rs != null && !rs.isEmpty()) {
				byte[] val= rs.getValue("cf".getBytes(),Bytes.toBytes("REGTIME"));
				if (val!=null){
					currLine.addField(StringUtils.substring(Bytes.toString(val),0,10));
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return currLine;
	}

	private HTable getHTable() {
		if (table == null) {
			try {
				Configuration conf = new Configuration();
				conf.addResource(new Path("/opt/tools/datax/jobs/product/oriuser/hbase-site.xml"));
				Configuration config = new Configuration(conf);
				config.setLong(HConstants.HBASE_CLIENT_SCANNER_TIMEOUT_PERIOD, 240000);
				table = new HTable(config, "DA.USER");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return table;
	}

}
