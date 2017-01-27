package com.github.esadmin.meta.model.wrapper;

import com.github.esadmin.meta.model.Node;
/**
 * 节点信息扩展
 * @author admin
 *
 */
public class EsNodeWrapper extends Node {
	
	public EsNodeWrapper() {
	}
	
	public EsNodeWrapper(Node node) {
		this.setCheckLabel(node.getCheckLabel());
		this.setCreateDate(node.getCreateDate());
		this.setId(node.getId());
		this.setIp(node.getIp());
		this.setStatus(node.getStatus());
		this.setPort(node.getPort());
		this.setNodeName(node.getNodeName());
		this.setRemark(node.getRemark());
		this.setUpdateDate(node.getUpdateDate());
	}
	
	private String transportAddress;

	private long docnum;
	private long fsbyte;
	private long warmer;
	private long queryCache;
	private long fielddataByte;
	private long segmentsByte;
	private long requestCache;
	private long memtotal;
	private long memfree;
	private long memused;
	private long heapused;
	private long buffer;

	public String getTransportAddress() {
		return transportAddress;
	}

	public void setTransportAddress(String transportAddress) {
		this.transportAddress = transportAddress;
	}

	public long getDocnum() {
		return docnum;
	}

	public void setDocnum(long docnum) {
		this.docnum = docnum;
	}

	public long getFsbyte() {
		return fsbyte;
	}

	public void setFsbyte(long fsbyte) {
		this.fsbyte = fsbyte;
	}

	public long getWarmer() {
		return warmer;
	}

	public void setWarmer(long warmer) {
		this.warmer = warmer;
	}

	public long getQueryCache() {
		return queryCache;
	}

	public void setQueryCache(long queryCache) {
		this.queryCache = queryCache;
	}

	public long getFielddataByte() {
		return fielddataByte;
	}

	public void setFielddataByte(long fielddataByte) {
		this.fielddataByte = fielddataByte;
	}

	public long getSegmentsByte() {
		return segmentsByte;
	}

	public void setSegmentsByte(long segmentsByte) {
		this.segmentsByte = segmentsByte;
	}

	public long getRequestCache() {
		return requestCache;
	}

	public void setRequestCache(long requestCache) {
		this.requestCache = requestCache;
	}

	public long getMemtotal() {
		return memtotal;
	}

	public void setMemtotal(long memtotal) {
		this.memtotal = memtotal;
	}

	public long getMemfree() {
		return memfree;
	}

	public void setMemfree(long memfree) {
		this.memfree = memfree;
	}

	public long getMemused() {
		return memused;
	}

	public void setMemused(long memused) {
		this.memused = memused;
	}

	public long getHeapused() {
		return heapused;
	}

	public void setHeapused(long heapused) {
		this.heapused = heapused;
	}

	public long getBuffer() {
		return buffer;
	}

	public void setBuffer(long buffer) {
		this.buffer = buffer;
	}

}
