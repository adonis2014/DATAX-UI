package com.github.eswrapper.controller;

import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.eswrapper.model.Response;
import com.github.eswrapper.service.HSSplitIndexManager;

@Controller
@RequestMapping("/hssplitIndex")
public class HSSplitIndexController {

	@Autowired
	private HSSplitIndexManager hssplitIndexManager;

	/**
	 * 建立实时读写分离索引
	 * 
	 * @param clusterName
	 * @param indexName
	 * @param shardNum
	 * @param replicas
	 * @param delayUnAssign
	 * @param hotZoneName
	 * @param stableZoneName
	 * @return
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public Response<String> createHSSplitIndex(@RequestParam(required = true) String clusterName, @RequestParam String indexName, @RequestParam(required = false) String shardNum,
			@RequestParam(required = false) String replicas, @RequestParam(required = false) String delayUnAssign, @RequestParam(required = false) String hotZoneName,
			@RequestParam(required = false) String stableZoneName) {
		return hssplitIndexManager.createHSSplitIndex(clusterName, indexName, NumberUtils.toInt(shardNum, 12), NumberUtils.toInt(replicas, 1), delayUnAssign == null ? "10M"
				: delayUnAssign, hotZoneName == null ? "hot" : hotZoneName, stableZoneName == null ? "stable" : stableZoneName);
	}

	/**
	 * etl等大批量数据全量导入时，建立读写分离的index库的初始化操作
	 * 
	 * @param indexName
	 * @param shardNum
	 * @param replicas
	 * @param delayUnAssign
	 * @param hotZoneName
	 * @return
	 */
	@RequestMapping(value = "/init", method = RequestMethod.POST)
	@ResponseBody
	public Response<String> initHSSplitIndex(@RequestParam(required = true) String clusterName, @RequestParam String indexName, @RequestParam(required = false) String shardNum,
			@RequestParam(required = false) String replicas, @RequestParam(required = false) String delayUnAssign, @RequestParam(required = false) String hotZoneName) {
		return hssplitIndexManager.initHSSplitIndex(clusterName, indexName, NumberUtils.toInt(shardNum, 12), NumberUtils.toInt(replicas, 1), delayUnAssign == null ? "10M"
				: delayUnAssign, hotZoneName == null ? "hot" : hotZoneName);
	}

	/**
	 * ETL等大批量数据全量导入时，建立读写分离的index库的结束动作
	 * 
	 * @param indexName
	 * @param hotZoneName
	 * @param stableZoneName
	 * @return
	 */
	@RequestMapping(value = "/finish", method = RequestMethod.POST)
	@ResponseBody
	public Response<String> destoryHSSplitIndex(@RequestParam(required = true) String clusterName, @RequestParam String indexName,
			@RequestParam(required = false) String hotZoneName, @RequestParam(required = false) String stableZoneName) {
		return hssplitIndexManager.finishHSSplitIndex(clusterName, indexName, hotZoneName == null ? "hot" : hotZoneName, stableZoneName == null ? "stable" : stableZoneName);
	}

}
