/*
 * Copyright (C) 2010-2101 Alibaba Group Holding Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.alibaba.otter.shared.common.model.config.pipeline;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.alibaba.otter.shared.common.model.config.node.Node;
import com.alibaba.otter.shared.common.utils.OtterToStringStyle;

import net.iharding.core.orm.IdEntity;
import net.iharding.modules.meta.model.DatasetPair;
import net.iharding.modules.meta.model.Project;

/**
 * 同步任务数据对象
 * 
 * @author jianghang 2011-8-31 下午07:35:38
 * 
 * 改造DataMediaPair为通用元数据模块的DatasetPair
 * 
 * @author Joe.Zhang
 */
@Entity
@Table(name = "stream_pipeline")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Pipeline  extends IdEntity {

    @Column(name="PROJECT_ID")
    private Long                projectId;                                 // 对应关联的channel唯一标示id
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PROJECT_ID")
    @NotFound(action = NotFoundAction.IGNORE)
    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    private Project           project;
    
    @Column(name="NAME")
    private String              name;
    
    @Column(name="DESCRIPTION")
    private String              description;                               // 描述信息
    
    private List<Node>          selectNodes;
    private List<Node>          extractNodes;
    private List<Node>          loadNodes;
    private List<DatasetPair> pairs;
    
    @Column(name="GMT_CREATE")
    private Date                gmtCreate;
    
    @Column(name="GMT_MODIFIED")
    private Date                gmtModified;
    
    @Column(name="PARAMETERS")
    private String              parameterStr; 
    
    private PipelineParameter   parameters       = new PipelineParameter();
    
    private PipelineStatus     status;

    public PipelineStatus getStatus() {
        return status;
    }

    public void setStatus(PipelineStatus status) {
        this.status = status;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public String getParameterStr() {
        return parameterStr;
    }

    public void setParameterStr(String parameterStr) {
        this.parameterStr = parameterStr;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Node> getSelectNodes() {
        return selectNodes;
    }

    public void setSelectNodes(List<Node> selectNodes) {
        this.selectNodes = selectNodes;
    }

    public List<Node> getExtractNodes() {
        return extractNodes;
    }

    public void setExtractNodes(List<Node> extractNodes) {
        this.extractNodes = extractNodes;
    }

    public List<Node> getLoadNodes() {
        return loadNodes;
    }

    public void setLoadNodes(List<Node> loadNodes) {
        this.loadNodes = loadNodes;
    }

    public List<DatasetPair> getPairs() {
        return pairs;
    }

    public void setPairs(List<DatasetPair> pairs) {
        this.pairs = pairs;
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

    public PipelineParameter getParameters() {
        return parameters;
    }

    public void setParameters(PipelineParameter parameters) {
        this.parameters = parameters;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, OtterToStringStyle.DEFAULT_STYLE);
    }
}
