package com.github.esadmin.meta.model.wrapper;

import com.github.esadmin.meta.model.DataSource;

/**
 * es集群状态信息
 * @author admin
 *
 */
public class EsClusterWrapper  extends DataSource{
	
	public EsClusterWrapper() {
	}
	
	public EsClusterWrapper(DataSource ds) {
		this.setCheckLabel(ds.getCheckLabel());
		this.setCreateDate(ds.getCreateDate());
		this.setCreater(ds.getCreater());
		this.setDatabases(ds.getDatabases());
		this.setDbType(ds.getDbType());
		this.setDsName(ds.getDsName());
		this.setId(ds.getId());
		this.setRemark(ds.getRemark());
		this.setSchemaName(ds.getSchemaName());
		this.setUpdateDate(ds.getUpdateDate());
		this.setUpdater(ds.getUpdater());
	}
	
	private String status;
	private Integer indicesnum;
	private Integer shardnum;
	private long docsnum;
	private String storesize;
	private Integer nodesnum;
	private String osmem;
	private Integer cpunum;
	private String fstotal;
	private String fsavailable;
	private String heapmax;
	private String heapused;
	private long heapmaxbyte;
	private long heapusedbyte;
	
	private String segmentsMemory;
	private long segmentsMemoryByte;
	
	private String queryCacheMemory;
	private long queryCacheMemoryByte;
	
	private String fielddataMemory;
	private long fielddataMemoryByte;
	
	private String bufferMemory;
	private long bufferMemoryByte;
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getIndicesnum() {
		return indicesnum;
	}

	public void setIndicesnum(Integer indicesnum) {
		this.indicesnum = indicesnum;
	}

	public Integer getShardnum() {
		return shardnum;
	}

	public void setShardnum(Integer shardnum) {
		this.shardnum = shardnum;
	}

	public long getDocsnum() {
		return docsnum;
	}

	public void setDocsnum(long docsnum) {
		this.docsnum = docsnum;
	}

	public String getStoresize() {
		return storesize;
	}

	public void setStoresize(String storesize) {
		this.storesize = storesize;
	}

	public Integer getNodesnum() {
		return nodesnum;
	}

	public void setNodesnum(Integer nodesnum) {
		this.nodesnum = nodesnum;
	}

	public String getOsmem() {
		return osmem;
	}

	public void setOsmem(String osmem) {
		this.osmem = osmem;
	}

	public Integer getCpunum() {
		return cpunum;
	}

	public void setCpunum(Integer cpunum) {
		this.cpunum = cpunum;
	}

	public String getFstotal() {
		return fstotal;
	}

	public void setFstotal(String fstotal) {
		this.fstotal = fstotal;
	}

	public String getFsavailable() {
		return fsavailable;
	}

	public void setFsavailable(String fsavailable) {
		this.fsavailable = fsavailable;
	}

	public String getHeapmax() {
		return heapmax;
	}

	public void setHeapmax(String heapmax) {
		this.heapmax = heapmax;
	}

	public String getHeapused() {
		return heapused;
	}

	public void setHeapused(String heapused) {
		this.heapused = heapused;
	}

	public long getHeapmaxbyte() {
		return heapmaxbyte;
	}

	public void setHeapmaxbyte(long heapmaxbyte) {
		this.heapmaxbyte = heapmaxbyte;
	}

	public long getHeapusedbyte() {
		return heapusedbyte;
	}

	public void setHeapusedbyte(long heapusedbyte) {
		this.heapusedbyte = heapusedbyte;
	}

	public String getSegmentsMemory() {
		return segmentsMemory;
	}

	public void setSegmentsMemory(String segmentsMemory) {
		this.segmentsMemory = segmentsMemory;
	}

	public long getSegmentsMemoryByte() {
		return segmentsMemoryByte;
	}

	public void setSegmentsMemoryByte(long segmentsMemoryByte) {
		this.segmentsMemoryByte = segmentsMemoryByte;
	}

	public String getQueryCacheMemory() {
		return queryCacheMemory;
	}

	public void setQueryCacheMemory(String queryCacheMemory) {
		this.queryCacheMemory = queryCacheMemory;
	}

	public long getQueryCacheMemoryByte() {
		return queryCacheMemoryByte;
	}

	public void setQueryCacheMemoryByte(long queryCacheMemoryByte) {
		this.queryCacheMemoryByte = queryCacheMemoryByte;
	}

	public String getFielddataMemory() {
		return fielddataMemory;
	}

	public void setFielddataMemory(String fielddataMemory) {
		this.fielddataMemory = fielddataMemory;
	}

	public long getFielddataMemoryByte() {
		return fielddataMemoryByte;
	}

	public void setFielddataMemoryByte(long fielddataMemoryByte) {
		this.fielddataMemoryByte = fielddataMemoryByte;
	}

	public String getBufferMemory() {
		return bufferMemory;
	}

	public void setBufferMemory(String bufferMemory) {
		this.bufferMemory = bufferMemory;
	}

	public long getBufferMemoryByte() {
		return bufferMemoryByte;
	}

	public void setBufferMemoryByte(long bufferMemoryByte) {
		this.bufferMemoryByte = bufferMemoryByte;
	}
	
	
}
