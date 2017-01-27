package com.alibaba.otter.shared.common.model.config.pipeline;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import net.iharding.core.orm.IdEntity;

@Entity
@Table(name = "stream_pipeline_node_relation")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class PipelineNodeRelation   extends IdEntity{
    
    @Column(name="NODE_ID")
    private Long nodeId;
    
    @Column(name="PIPELINE_ID")
    private Long pipelineId;
    
    @Column(name="LOCATION")
    private String location;
    
    @Column(name="GMT_CREATE")
    private Date                gmtCreate;
    
    @Column(name="GMT_MODIFIED")
    private Date                gmtModified;

    public Long getNodeId() {
        return nodeId;
    }

    public void setNodeId(Long nodeId) {
        this.nodeId = nodeId;
    }

    public Long getPipelineId() {
        return pipelineId;
    }

    public void setPipelineId(Long pipelineId) {
        this.pipelineId = pipelineId;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }
    
    
    
}
