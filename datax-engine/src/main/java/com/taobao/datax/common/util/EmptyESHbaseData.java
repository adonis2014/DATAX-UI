package com.taobao.datax.common.util;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;
import org.apache.hadoop.hbase.filter.SubstringComparator;
import org.apache.hadoop.hbase.util.Bytes;
import org.elasticsearch.action.bulk.BulkRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;

import com.taobao.datax.common.model.CommonQueryParams;


/**
 * 删除错误导入的es和hbase数据
 * 
 * @author admin
 * 
 */
public class EmptyESHbaseData {

	private Configuration config;

	private Connection connection;

	private Table htable;

	// 批量提交的记录数
	private int bulksize;
	// 索引名称
	private String indexname;
	// 类型名称(类似表名)
	private String typename;

	private Client client;

	private BulkRequestBuilder bulkRequestBuilder;

	private String hosts;

	// elasticsearch 参数 群组名称
	private String clustername;

	public EmptyESHbaseData(String hbase_conf, String tableName, String hosts,String clusterName, int bulksize, String indexname, String typename) {
		Configuration conf = new Configuration();
		conf.addResource(new Path(hbase_conf));
		config = new Configuration(conf);
		htable = getTable(tableName);
		this.hosts=hosts;
		this.clustername=clusterName;
		String[] hs = ETLStringUtils.split(this.hosts, ";");
		int id = 0;
		InetSocketTransportAddress[] transportAddress = new InetSocketTransportAddress[hs.length];
		for (String host : hs) {
			String[] hp = ETLStringUtils.split(host, ":");
			try {
				transportAddress[id] = new InetSocketTransportAddress(InetAddress.getByName(hp[0]), NumberUtils.toInt(hp[1], 9300));
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}
			id++;
		}
		Settings settings = Settings.settingsBuilder().put("cluster.name", this.clustername).put("client.transport.sniff", true).build();
		client =TransportClient.builder().settings(settings).build().addTransportAddresses(transportAddress);
//		this.client = new TransportClient(settings).addTransportAddresses(transportAddress);
		this.bulksize = bulksize;
		this.indexname = indexname;
		this.typename = typename;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		String[] columns={"creditReportCreateTime","hasCreditReport"};
//		EmptyESHbaseData empty=new EmptyESHbaseData("/Users/admin/datax/jobs/product/nginxLogURLDate/hbase-site.xml","User","d28-84.hadoop:9300;d28-81.hadoop:9300;d28-82.hadoop:9300;d28-15.hadoop:9300;d28-16.hadoop:9300;d28-21.hadoop:9300",
//				"vdata",4096,"enuser","user");
		EmptyESHbaseData empty=new EmptyESHbaseData("/Users/admin/datax/jobs/product/nginxLogURLDate/hbase-site.xml","User","127.0.0.1:9300",
				"enniu-data",4096,"enuser","user");
		String[] columns={"RPBCardBindingCreateDate","hasRPBCardBinding"};
		try {
			empty.emptyHbase("hasRPBCardBinding",columns);
		} catch (IOException e) {
			e.printStackTrace();
		}
//		CommonQueryParams params=new CommonQueryParams();
//		params.setEsIndexName("enuser");
//		params.setHtableName("User");
//		params.setEsTypeName("user");
//		List<WhereFieldParam> wfps=new ArrayList<WhereFieldParam>();
//		WhereFieldParam fp1=new WhereFieldParam();
//		fp1.setFieldName("hasCreditReport");
//		fp1.setParamValue("1");
//		wfps.add(fp1);
//		params.setExactFieldParams(wfps);
//		try {
//			empty.emptyESHbaseData(params, columns);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
	}
	
	public void  emptyHbase(String columnName,String[] columns) throws IOException{
		Scan s1 = new Scan();
		byte[] cf=Bytes.toBytes("cf");
		FilterList filterList = new FilterList(); 
		SingleColumnValueFilter filter=new SingleColumnValueFilter(Bytes.toBytes("cf"),Bytes.toBytes(columnName),CompareOp.EQUAL,
				new SubstringComparator("1"));  
		filter.setLatestVersionOnly(true);
		filter.setFilterIfMissing(true);
		filterList.addFilter(filter);
		s1.setFilter(filterList);
		 for(String column:columns){
			 s1.addColumn(cf, Bytes.toBytes(column));
		 }
		ResultScanner ResultScannerFilterList = htable.getScanner(s1);
		List<Delete> dels=new ArrayList<Delete>();
		for(Result rr=ResultScannerFilterList.next();rr!=null;rr=ResultScannerFilterList.next()){  
	         for(Cell kv:rr.listCells()){  
	                Delete d = new Delete(kv.getRow());//Bytes.toString(kv.getRow());
	                for(String column:columns){
						d.addColumn(cf,Bytes.toBytes(column));
					}
	                dels.add(d);
					if (dels.size()>this.bulksize){
						htable.delete(dels);
						dels.clear();
					}
	         }
	    } 
		if (!dels.isEmpty()){
			htable.delete(dels);
			htable.close();
			dels.clear();
		}
	}

	public void emptyESHbaseData(CommonQueryParams params,String[] columns) throws IOException {
		SearchResponse esResponse =  client.prepareSearch(indexname).setTypes(typename)
				.setQuery(params.toQueryBuilder()).setSize(this.bulksize).setSearchType(SearchType.SCAN).setScroll(TimeValue.timeValueMinutes(10))
			.execute().actionGet();
		SearchHits hits = esResponse.getHits();
		System.out.println(hits.getTotalHits());
		if (hits.getTotalHits() > 0) {// 处理查询结果
			byte[] cf=Bytes.toBytes("cf");
			List<Delete> dels=new ArrayList<Delete>();
			bulkRequestBuilder = client.prepareBulk();
			while(true){
				esResponse = client.prepareSearchScroll(esResponse.getScrollId()).setScroll(TimeValue.timeValueMinutes(10))
						.execute().actionGet();
				if (esResponse.getHits().getHits().length==0){
					break;
				}
				for (SearchHit hit : esResponse.getHits()) {
					Delete d = new Delete(Bytes.toBytes(hit.getId()));
					Map esmap=new HashMap();
					for(String column:columns){
						d.addColumn(cf,Bytes.toBytes(column));
						esmap.put(column, "");
					}
					dels.add(d);
					if (dels.size()>this.bulksize){
						htable.delete(dels);
						dels.clear();
					}
					bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename,hit.getId()).setSource(esmap).request());
					if (bulkRequestBuilder.numberOfActions()>this.bulksize){
						bulkRequestBuilder.execute().actionGet();
						bulkRequestBuilder = client.prepareBulk();
					}
				}
			}
			if (!dels.isEmpty()){
				htable.delete(dels);
				dels.clear();
			}
			if (bulkRequestBuilder.numberOfActions()>0){
				bulkRequestBuilder.execute().actionGet();
			}
		}
		
		
	}

	public Table getTable(String tableName) {
		try {
			return getHBaseConnection().getTable(TableName.valueOf(tableName));
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

	private Connection getHBaseConnection() {
		if (connection == null) {
			try {
				connection = ConnectionFactory.createConnection(config);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return connection;
	}

}
