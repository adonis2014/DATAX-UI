package com.taobao.datax.plugins.reader.hbasereader;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.NavigableMap;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.HConstants;
import org.apache.hadoop.hbase.client.Durability;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.filter.BinaryPrefixComparator;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.hbase.util.Pair;
import org.apache.log4j.Logger;

import com.taobao.datax.common.exception.DataExchangeException;
import com.taobao.datax.common.plugin.Line;
import com.taobao.datax.common.plugin.LineSender;
import com.taobao.datax.common.util.ETLStringUtils;

public class EnNiuHBaseProxy {

	private Configuration config;

	private HTable htable;

	private HBaseAdmin admin;

	private String encode = "UTF-8";

	private byte[] startKey = null;

	private byte[] endKey = null;

	private Scan scan = null;

	private String[] families = null;

	private String[] columns = null;

	private ResultScanner rs = null;

	private static final int SCAN_CACHE = 256;

	private String isSaveOneObj = "false";

	private String oneObjColName = "data";

	private List<String> ooColumnNames = null;

	private String oneObjName = "EN_User";

	private String oneObjFamilyName = "cf";

	private long minStamp = 0l;

	private long maxStamp = 0l;

	private int maxversion = 0;

	private Put p;
	private static final int BUFFER_LINE = 1024;

	private List<Put> buffer = new ArrayList<Put>(BUFFER_LINE);
	private List<Get> gets = new ArrayList<Get>(BUFFER_LINE);
	private String familyName;
	private String fieldName;
	private String startDate;
	private String endDate;
	private String[] column_version = null;
	private String columnProcRule = "";
	private int partColumnIdx = 0;
	private int bakPartColumnIdx = 1;
	private int partRuleId = 0;
	private String partFormat = "";
	private String primaryKey;

	public String getPrimaryKey() {
		return primaryKey;
	}

	public void setPrimaryKey(String primaryKey) {
		this.primaryKey = primaryKey;
	}

	public String getColumnProcRule() {
		return columnProcRule;
	}

	public void setColumnProcRule(String columnProcRule) {
		this.columnProcRule = columnProcRule;
	}

	public int getPartColumnIdx() {
		return partColumnIdx;
	}

	public void setPartColumnIdx(int partColumnIdx) {
		this.partColumnIdx = partColumnIdx;
	}

	public int getBakPartColumnIdx() {
		return bakPartColumnIdx;
	}

	public void setBakPartColumnIdx(int bakPartColumnIdx) {
		this.bakPartColumnIdx = bakPartColumnIdx;
	}

	public int getPartRuleId() {
		return partRuleId;
	}

	public void setPartRuleId(int partRuleId) {
		this.partRuleId = partRuleId;
	}

	public String getPartFormat() {
		return partFormat;
	}

	public void setPartFormat(String partFormat) {
		this.partFormat = partFormat;
	}

	public int getMaxversion() {
		return maxversion;
	}

	public void setMaxversion(int maxversion) {
		this.maxversion = maxversion;
	}

	public String[] getColumn_version() {
		return column_version;
	}

	public void setColumn_version(String[] column_version) {
		this.column_version = column_version;
	}

	private Logger logger = Logger.getLogger(EnNiuHBaseProxy.class);

	public static EnNiuHBaseProxy newProxy(String hbase_conf, String tableName, String isSaveOneObj, String oneObjFamilyName, String oneObjColName, List<String> ooColumnNames,
			String oneObjName) throws IOException {
		return new EnNiuHBaseProxy(hbase_conf, tableName, isSaveOneObj, oneObjFamilyName, oneObjColName, ooColumnNames, oneObjName);
	}

	private EnNiuHBaseProxy(String hbase_conf, String tableName, String isSaveOneObj, String oneObjFamilyName, String oneObjColName, List<String> ooColumnNames, String oneObjName)
			throws IOException {
		Configuration conf = new Configuration();
		conf.addResource(new Path(hbase_conf));
		config = new Configuration(conf);
		config.setLong(HConstants.HBASE_CLIENT_SCANNER_TIMEOUT_PERIOD, 240000);
		htable = new HTable(config, tableName);
		admin = new HBaseAdmin(config);
		this.isSaveOneObj = isSaveOneObj;
		this.oneObjFamilyName = oneObjFamilyName;
		this.oneObjColName = oneObjColName;
		this.ooColumnNames = ooColumnNames;
		this.oneObjName = oneObjName;
		if (!this.check()) {
			throw new IllegalStateException("DataX try to build HBaseProxy failed !");
		}
	}

	public String getFamilyName() {
		return familyName;
	}

	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public long getMinStamp() {
		return minStamp;
	}

	public void setMinStamp(long minStamp) {
		this.minStamp = minStamp;
	}

	public long getMaxStamp() {
		return maxStamp;
	}

	public void setMaxStamp(long maxStamp) {
		this.maxStamp = maxStamp;
	}

	public Pair<byte[][], byte[][]> getStartEndKeys() throws IOException {
		return this.htable.getStartEndKeys();
	}

	public void setEncode(String encode) {
		this.encode = encode;
		return;
	}

	public void setStartRange(byte[] startKey) {
		this.startKey = startKey;
		return;
	}

	public void setEndRange(byte[] endKey) {
		this.endKey = endKey;
		return;
	}

	public void setStartEndRange(byte[] startKey, byte[] endKey) {
		this.startKey = startKey;
		this.endKey = endKey;
		return;
	}

	/*
	 * Must be sure that column is in format like 'family: column'
	 */
	public void prepare(String[] columns) throws IOException {
		this.scan = new Scan();
		if (this.startKey != null) {
			logger.info(String.format("HBaseReader set startkey to %s .", Bytes.toString(this.startKey)));
			scan.setStartRow(startKey);
		}
		if (this.endKey != null) {
			logger.info(String.format("HBaseReader set endkey to %s .", Bytes.toString(this.endKey)));
			scan.setStopRow(endKey);
		}
		if (this.minStamp > 0 && this.maxStamp > 0) {
			scan.setTimeRange(minStamp, maxStamp);
			if (StringUtils.isNotEmpty(primaryKey)) {
				String[] cs = StringUtils.split(primaryKey, ":");
				scan.addColumn(cs[0].getBytes(), cs[1].getBytes());
			}
		} else if (ETLStringUtils.isNotEmpty(startDate) && ETLStringUtils.isNotEmpty(familyName) && ETLStringUtils.isNotEmpty(fieldName)) {
			SingleColumnValueFilter scvf = new SingleColumnValueFilter(Bytes.toBytes(familyName), Bytes.toBytes(fieldName), CompareOp.GREATER_OR_EQUAL, new BinaryPrefixComparator(
					startDate.getBytes()));
			scvf.setFilterIfMissing(true);
			scvf.setLatestVersionOnly(true);
			if (ETLStringUtils.isNotEmpty(endDate)) {
				SingleColumnValueFilter scvf1 = new SingleColumnValueFilter(Bytes.toBytes(familyName), Bytes.toBytes(fieldName), CompareOp.LESS_OR_EQUAL,
						new BinaryPrefixComparator(endDate.getBytes()));
				scvf1.setFilterIfMissing(true);
				scvf1.setLatestVersionOnly(true);
				List<Filter> filters = new ArrayList<Filter>();
				filters.add(scvf);
				filters.add(scvf1);
				FilterList fl = new FilterList(FilterList.Operator.MUST_PASS_ALL, filters);
				scan.setFilter(fl);
			} else {
				scan.setFilter(scvf);
			}
		}
		this.families = new String[columns.length];
		this.columns = new String[columns.length];

		int idx = 0;
		for (String column : columns) {
			this.families[idx] = column.split(":")[0].trim();
			this.columns[idx] = column.split(":")[1].trim();
			if (!(this.minStamp > 0 && this.maxStamp > 0)) {
				scan.addColumn(this.families[idx].getBytes(), this.columns[idx].getBytes());
			}
			idx++;
		}
		if ("true".equalsIgnoreCase(this.isSaveOneObj)) {
			scan.addColumn(this.oneObjFamilyName.getBytes(), this.oneObjColName.getBytes());
		}
		if (this.maxversion > 0) {
			scan.setMaxVersions(this.maxversion);
		} else {
			scan.setMaxVersions();
		}

		htable.setScannerCaching(SCAN_CACHE);
		this.rs = htable.getScanner(this.scan);
	}

	public void flush() throws IOException {
		if (!buffer.isEmpty()) {
			htable.put(buffer);
			buffer.clear();
		}
		htable.flushCommits();
	}

	public boolean fetchLine(Line line) throws IOException {
		if (null == this.rs) {
			throw new IllegalStateException("HBase Client try to fetch data failed .");
		}
		Result result = this.rs.next();
		if (null == result) {
			return false;
		}
		if (this.maxversion == -1) {// 多版本记录,按照每个字段的设置获取不同版本数据
			NavigableMap<byte[], NavigableMap<byte[], NavigableMap<Long, byte[]>>> nMap = result.getMap();
			this.p = new Put(result.getRow());
			this.p.setDurability(Durability.SKIP_WAL);
			for (int i = 0; i < this.families.length; i++) {
				NavigableMap<Long, byte[]> vmap = nMap.get(this.families[i].getBytes()).get(this.columns[i].getBytes());
				byte[] value = null;
				byte[] firstValue = null;
				if (vmap == null || vmap.size() == 0) {// 无记录，判断后获取替换的字段值
					line.addField(null);
					continue;
				} else if (vmap.size() > 1) {// 多个版本
					if ("1".equalsIgnoreCase(this.column_version[i])) {
						Iterator<Map.Entry<Long, byte[]>> iter = vmap.entrySet().iterator();
						int id = 0;
						while (iter.hasNext()) {
							if (id == 0) {
								firstValue = iter.next().getValue();
								value = firstValue;
							} else {
								value = iter.next().getValue();
							}
							id++;
						}
						if (id > 0) {
							this.p.addColumn(families[i].getBytes(), this.columns[i].getBytes(), value);
						}
					} else {// 取第一个最新版本的值
						value = vmap.entrySet().iterator().next().getValue();
					}
				} else {// 单个版本
					value = vmap.entrySet().iterator().next().getValue();
				}
				if (null == value) {
					line.addField(null);
				} else {
					line.addField(new String(value, encode));
				}
			}
			// 判断是否将hbase值替换和修改
			if (ETLStringUtils.isNotEmpty(this.columnProcRule) && this.partRuleId == 1) {// 需要替换字段
				if (ETLStringUtils.isEmpty(line.getField(this.partColumnIdx))) {// 需要替换的字段为空，则替换字段
					line.addField(line.getField(this.bakPartColumnIdx), this.partColumnIdx);
					this.p.addColumn(families[partColumnIdx].getBytes(), this.columns[partColumnIdx].getBytes(), line.getField(this.bakPartColumnIdx).getBytes());
				}
			}
			if (this.p.size() > 0) {
				buffer.add(this.p);
			}
			if (buffer.size() >= BUFFER_LINE) {
				htable.put(buffer);
				htable.flushCommits();
				buffer.clear();
			}
		} else {
			for (int i = 0; i < this.families.length; i++) {
				byte[] value = result.getValue(this.families[i].getBytes(), this.columns[i].getBytes());
				if (null == value) {
					line.addField(null);
				} else {
					line.addField(new String(value, encode));
				}
			}
		}
		//
		line.addField(new String(result.getRow(), encode));
		return true;
	}

	public void close() throws IOException {
		if (null != rs) {
			rs.close();
		}
		if (null != htable) {
			htable.close();
		}
	}

	private boolean check() throws DataExchangeException, IOException {
		if (!admin.isMasterRunning()) {
			throw new IllegalStateException("HBase master is not running!");
		}
		if (!admin.tableExists(htable.getTableName())) {
			throw new IllegalStateException("HBase table " + Bytes.toString(htable.getTableName()) + " is not existed!");
		}
		if (!admin.isTableAvailable(htable.getTableName())) {
			throw new IllegalStateException("HBase table " + Bytes.toString(htable.getTableName()) + " is not available!");
		}
		if (!admin.isTableEnabled(htable.getTableName())) {
			throw new IllegalStateException("HBase table " + Bytes.toString(htable.getTableName()) + " is disable!");
		}

		return true;
	}

	public boolean fetchReadAllFieldLine(List<Line> lines,LineSender sender) throws IOException {
		if (null == this.rs) {
			throw new IllegalStateException("HBase Client try to fetch data failed .");
		}
		for (Result result = rs.next(); result != null; result = rs.next()) {
			Get get = new Get(result.getRow());
			for (int i = 0; i < this.families.length; i++) {
				get.addColumn(this.families[i].getBytes(), this.columns[i].getBytes());
			}
			gets.add(get);
			if (gets.size()>this.BUFFER_LINE){
				Result[] getResults = this.htable.get(gets);
				for(Result resu:getResults){
					if (null != resu) {
						Line line=sender.createLine();
						for (int i = 0; i < this.families.length; i++) {
							byte[] value = resu.getValue(this.families[i].getBytes(), this.columns[i].getBytes());
							if (null == value) {
								line.addField(null);
							} else {
								line.addField(new String(value, encode));
							}
						}
						line.addField(new String(resu.getRow(), encode));
					}
				}
				return true;
			}
		}
		return false;
	}

}
