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

package com.alibaba.otter.shared.common.model.autokeeper;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.alibaba.otter.shared.common.utils.OtterToStringStyle;

import net.iharding.core.orm.IdEntity;

/**
 * zk集群监控对象
 * 
 * @author jianghang 2012-9-21 下午01:54:17
 * @version 4.1.0
 */
@Entity
@Table(name = "stream_autokeeper_cluster")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class AutoKeeperCluster   extends IdEntity {
    
    @Column(name="CLUSTER_NAME")
    private String            clusterName;
    
    @Column(name="SERVER_LIST")
    private List<String>      serverList;                             // 机器列表
    
    @Column(name="DESCRIPTION")
    private String            description;                            // 描述
    
    @Column(name="GMT_CREATE")
    private Date              gmtCreate;
    
    @Column(name="GMT_MODIFIED")
    private Date              gmtModified;


    public String getClusterName() {
        return clusterName;
    }

    public void setClusterName(String clusterName) {
        this.clusterName = clusterName;
    }

    public List<String> getServerList() {
        return serverList;
    }

    public void setServerList(List<String> serverList) {
        this.serverList = serverList;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public String toString() {
        return ToStringBuilder.reflectionToString(this, OtterToStringStyle.DEFAULT_STYLE);
    }

}
