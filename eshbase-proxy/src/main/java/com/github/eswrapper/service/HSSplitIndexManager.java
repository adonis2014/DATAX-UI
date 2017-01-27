package com.github.eswrapper.service;

import com.github.eswrapper.model.Response;

/**
 * 读写分离索引相关操作
 * @author admin
 *
 */
public interface HSSplitIndexManager {
	
	/**
	 * 建立实时读写分离索引
	 * 
	 * @param indexName
	 * @param shardNum
	 * @param replicas
	 * @param delayUnAssign
	 * @param hotZoneName
	 * @param stableZoneName
	 * @return
	 */
	public Response<String> createHSSplitIndex(String clustername,String indexName, int shardNum, int replicas, String delayUnAssign, String hotZoneName, String stableZoneName);
	
	/**
	 * etl等大批量数据全量导入时，建立读写分离的index库的初始化操作
	 * @param indexName
	 * @param shardNum
	 * @param replicas
	 * @param delayUnAssign
	 * @param hotZoneName
	 * @return
	 */
	public Response<String> initHSSplitIndex(String clustername,String indexName, int shardNum, int replicas, String delayUnAssign, String hotZoneName);
	/**
	 * ETL等大批量数据全量导入时，建立读写分离的index库的结束动作
	 * @param indexName
	 * @param hotZoneName
	 * @param stableZoneName
	 * @return
	 */
	public Response<String> finishHSSplitIndex(String clustername,String indexName, String hotZoneName, String stableZoneName);
	
	
}
