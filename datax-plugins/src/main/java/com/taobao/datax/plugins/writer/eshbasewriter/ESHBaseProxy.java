package com.taobao.datax.plugins.writer.eshbasewriter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Durability;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.elasticsearch.action.admin.indices.create.CreateIndexResponse;
import org.elasticsearch.action.admin.indices.delete.DeleteIndexResponse;
import org.elasticsearch.action.admin.indices.exists.indices.IndicesExistsResponse;
import org.elasticsearch.action.admin.indices.exists.types.TypesExistsResponse;
import org.elasticsearch.action.admin.indices.mapping.put.PutMappingRequest;
import org.elasticsearch.action.admin.indices.mapping.put.PutMappingResponse;
import org.elasticsearch.action.bulk.BulkItemResponse;
import org.elasticsearch.action.bulk.BulkRequestBuilder;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.Requests;
import org.elasticsearch.common.settings.Settings;

public class ESHBaseProxy {

	private Configuration config;

	private Connection connection;

	private Table htable;

	private Admin admin;

	private HTableDescriptor descriptor;

	// 批量提交的记录数
	private int bulksize;
	// 索引名称
	private String indexname;
	// 类型名称(类似表名)
	private String typename;

	private Client client;

	private BulkRequestBuilder bulkRequestBuilder;

	private static final int BUFFER_LINE = 1024;

	private List<Put> buffer = new ArrayList<Put>(BUFFER_LINE);

	private Put p;

	private Logger logger = Logger.getLogger(ESHBaseProxy.class);

	ObjectMapper mapper = new ObjectMapper();

	public static ESHBaseProxy newProxy(String hbase_conf, String table, Client client, int bulksize, String indexname, String typename) throws IOException {
		return new ESHBaseProxy(hbase_conf, table, client, bulksize, indexname, typename);
	}

	private ESHBaseProxy(String hbase_conf, String tableName, Client client, int bulksize, String indexname, String typename) throws IOException {
		Configuration conf = new Configuration();
		conf.addResource(new Path(hbase_conf));
		config = new Configuration(conf);
		htable = getTable(tableName);
		htable.setWriteBufferSize(1024 * 1024 * 10);
		admin = getHBaseConnection().getAdmin();
		descriptor = htable.getTableDescriptor();
		this.client = client;
		this.bulksize = bulksize;
		this.indexname = indexname;
		this.typename = typename;
	}

	private Table getTable(String tableName) throws IOException {
		return getHBaseConnection().getTable(TableName.valueOf(tableName));
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

	public void setBufferSize(int bufferSize) throws IOException {
		this.htable.setWriteBufferSize(bufferSize);
	}

	public void setHTable(String tableName) throws IOException {
		this.htable = getTable(tableName);
	}

	public void setAutoFlush(boolean autoflush) {
		// this.htable.setAutoFlush(autoflush);
	}

	public boolean check() throws IOException {
		// if (!admin.isMasterRunning()) {
		// throw new IllegalStateException("hbase master is not running!");
		// }
		if (!admin.tableExists(htable.getName())) {
			throw new IllegalStateException("hbase table " + Bytes.toString(htable.getName().getName()) + " is not existed!");
		}
		if (!admin.isTableAvailable(htable.getName())) {
			throw new IllegalStateException("hbase table " + Bytes.toString(htable.getName().getName()) + " is not available!");
		}
		if (!admin.isTableEnabled(htable.getName())) {
			throw new IllegalStateException("hbase table " + Bytes.toString(htable.getName().getName()) + " is disable!");
		}

		return true;
	}

	public void close() throws IOException {
		htable.close();
		if (this.bulkRequestBuilder != null) {
			this.bulkRequestBuilder = null;
		}
	}

	public void deleteESTable(String indexname, int number_of_shards, int number_of_replicas, String typename, String mapping_xml) throws Exception {
		IndicesExistsResponse exresponse = client.admin().indices().prepareExists(indexname).execute().actionGet();
		if (exresponse.isExists()) {
			try {
				DeleteIndexResponse delresponse = client.admin().indices().prepareDelete(indexname).execute().actionGet();
				if (!delresponse.isAcknowledged()) {
					throw new Exception(delresponse.toString());
				} else {
					logger.debug("删除索引：" + indexname + " 成功！");
				}
			} catch (Exception ex) {
			}
		} else {
//			DeleteMappingResponse response = client.admin().indices().prepareDeleteMapping(indexname).setType(typename).execute().actionGet();
//			if (!response.isAcknowledged()) {
//				throw new Exception(response.toString());
//			} else {
//				logger.debug("删除索引Type：" + indexname + "-" + typename + " 成功！");
//			}
		}
		CreateIndexResponse creaResp = client.admin().indices().prepareCreate(indexname)
				.setSettings(Settings.settingsBuilder().put("number_of_shards", number_of_shards).put("number_of_replicas", number_of_replicas)).execute().actionGet();
		if (!creaResp.isAcknowledged()) {
			throw new Exception(creaResp.toString());
		}
		TypesExistsResponse typeResp = client.admin().indices().prepareTypesExists(indexname).setTypes(typename).execute().actionGet();
		if (!typeResp.isExists()) {
			// 建立type和mapping
			PutMappingRequest mapping = Requests.putMappingRequest(indexname).type(typename).source(mapping_xml);
			PutMappingResponse respMap = client.admin().indices().putMapping(mapping).actionGet();
			if (!respMap.isAcknowledged()) {
				throw new Exception(respMap.toString());
			} else {
				logger.debug("新建索引：" + indexname + "下的type:" + typename + " 成功！mapping格式为:" + mapping_xml);
			}
		}

	}

	public void createESTable(String indexname, int number_of_shards, int number_of_replicas, String typename, int bulksize, String mapping_xml) throws Exception {
		// 判断是否已经存在索引
		IndicesExistsResponse response = client.admin().indices().prepareExists(indexname).execute().actionGet();
		if (!response.isExists()) {
			// 建立索引
			CreateIndexResponse creaResp = client.admin().indices().prepareCreate(indexname)
					.setSettings(Settings.settingsBuilder().put("number_of_shards", number_of_shards).put("number_of_replicas", number_of_replicas)).execute().actionGet();
			if (!creaResp.isAcknowledged()) {
				throw new Exception(creaResp.toString());
			}
		} else {
			logger.debug("新建索引：" + indexname + " 成功！");
		}
		// TypesExistsResponse typeResp =
		// client.admin().indices().prepareTypesExists(indexname).setTypes(typename)
		// .execute().actionGet();
		// if (!typeResp.isExists()){
		// 建立type和mapping
		PutMappingRequest mapping = Requests.putMappingRequest(indexname).type(typename).source(mapping_xml);
		PutMappingResponse respMap = client.admin().indices().putMapping(mapping).actionGet();
		if (!respMap.isAcknowledged()) {
			throw new Exception(respMap.toString());
		} else {
			logger.debug("新建索引：" + indexname + "下的type:" + typename + " 成功！mapping格式为:" + mapping_xml);
		}
		// }

	}

	public void truncateESTable(String indexname, int number_of_shards, int number_of_replicas, String typename, String mapping_xml) throws Exception {
		IndicesExistsResponse exresponse1 = client.admin().indices().prepareExists(indexname).execute().actionGet();
		if (!exresponse1.isExists()) {
			CreateIndexResponse creaResp = client.admin().indices().prepareCreate(indexname)
					.setSettings(Settings.settingsBuilder().put("number_of_shards", number_of_shards).put("number_of_replicas", number_of_replicas)).execute().actionGet();
			if (!creaResp.isAcknowledged()) {
				throw new Exception(creaResp.toString());
			}
		}
		// 删除type
		TypesExistsResponse exresponse = client.admin().indices().prepareTypesExists(indexname).setTypes(typename).execute().actionGet();
		if (exresponse.isExists()) {// 删除type
			try {
//				DeleteMappingResponse delresponse = client.admin().indices().prepareDeleteMapping(indexname).setType(typename).execute().actionGet();
//				if (!delresponse.isAcknowledged()) {
//					throw new Exception(delresponse.toString());
//				} else {
//					logger.debug("删除索引的type：" + indexname + "-" + typename + " 成功！");
//				}
			} catch (Exception ex) {
			}
		}
		PutMappingRequest mapping = Requests.putMappingRequest(indexname).type(typename).source(mapping_xml);
		PutMappingResponse respMap = client.admin().indices().putMapping(mapping).actionGet();
		if (!respMap.isAcknowledged()) {
			throw new Exception(respMap.toString());
		} else {
			logger.debug("新建索引：" + indexname + "下的type:" + typename + " 成功！mapping格式为:" + mapping_xml);
		}
	}

	public void deleteTable() throws IOException {
		Scan s = new Scan();
		ResultScanner scanner = htable.getScanner(s);
		for (Result rr = scanner.next(); rr != null; rr = scanner.next()) {
			htable.delete(new Delete(rr.getRow()));
		}
		scanner.close();
	}

	public void truncateTable() throws IOException {
		// admin.disableTable(htable.getName());
		// admin.deleteTable(htable.getName());
		// admin.createTable(descriptor);
	}

	public void flush() throws IOException {
		if (!buffer.isEmpty()) {
			htable.put(buffer);
			buffer.clear();
		}
		admin.flush(htable.getName());
		// elasticsearch 提交
		if (bulkRequestBuilder.numberOfActions() > 0) {
			BulkResponse response = bulkRequestBuilder.execute().actionGet();
			logger.debug(getFailueMessage(response));
		}
		bulkRequestBuilder = null;
		// htable.flushCommits();
	}

	private String getFailueMessage(BulkResponse response) {
		StringBuilder sb = new StringBuilder();
		boolean havFailure = false;
		for (BulkItemResponse item : response.getItems()) {
			if (item.isFailed()) {
				havFailure = true;
				sb.append("\n[").append("]: index [").append(item.getIndex()).append("], type [").append(item.getType()).append("], id [").append(item.getId())
						.append("], itemid:" + item.getItemId() + " message [").append(item.getFailureMessage()).append("]");
			}
		}
		if (havFailure) {
			return "failure in bulk execution:" + sb.toString();
		} else {
			return "";
		}
	}

	public void prepare(byte[] rowKey) {
		this.p = new Put(rowKey);
		p.setDurability(Durability.SKIP_WAL);
	}

	public void prepareEs() {
		this.bulkRequestBuilder = client.prepareBulk();
	}

	public Put add(byte[] family, byte[] qualifier, long timeStamp, byte[] value) {
		return this.p.addColumn(family, qualifier, timeStamp, value);
	}

	public Put add(byte[] family, byte[] qualifier, byte[] value) {
		return this.p.addColumn(family, qualifier, value);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void insert(String id, Map map, String parent,String routing) throws IOException {
		
		if (!p.isEmpty()) {
			buffer.add(this.p);
		}
		if (buffer.size() >= BUFFER_LINE) {
			try {
				htable.put(buffer);
				buffer.clear();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		try {
			if (StringUtils.isEmpty(id)) {
				bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename).setSource(map).request());
			} else {
				if (StringUtils.isNotEmpty(parent)) {
					if (parent.startsWith("4:")) {
						String[] dd = StringUtils.split(parent, ":");
//						bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename, id).setParent(StringUtils.reverse((String) map.get(dd[1]))).setSource(map)
//								.request());
						if (StringUtils.isEmpty(routing)){
							bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename,id).setParent(StringUtils.reverse((String)map.get(dd[1]))).setSource(map).request());
						}else{
							bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename,id).setRouting(routing).setParent(StringUtils.reverse((String)map.get(dd[1]))).setSource(map).request());
						}
					} else {
						if (StringUtils.isEmpty(routing)){
							bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename, id).setParent((String) map.get(parent)).setSource(map).request());
						}else{
							bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename, id).setRouting(routing).setParent((String) map.get(parent)).setSource(map).request());
						}
					}
				} else {
					if (StringUtils.isEmpty(routing)){
						bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename, id).setSource(map).request());
					}else{
						bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename, id).setRouting(routing).setSource(map).request());
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (bulkRequestBuilder.numberOfActions() >= this.bulksize) {
			BulkResponse response = bulkRequestBuilder.execute().actionGet();
			String err = getFailueMessage(response);
			if (err.length() > 0) {
				System.out.println(err);
			}
			this.prepareEs();
		}
	}
}
