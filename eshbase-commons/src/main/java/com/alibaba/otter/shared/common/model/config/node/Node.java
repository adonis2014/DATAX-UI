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

package com.alibaba.otter.shared.common.model.config.node;

import java.util.Date;

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

import com.alibaba.otter.shared.common.model.autokeeper.AutoKeeperCluster;
import com.alibaba.otter.shared.common.utils.OtterToStringStyle;

import net.iharding.core.orm.IdEntity;

/**
 * Node数据对象
 * 
 * @author jianghang 2011-8-19 上午10:19:40
 * 
 * 日志抽取运行节点，可运行2种任务,改用hibernate实现
 * 
 * @author Joe.Zhang
 * 
 */
@Entity
@Table(name = "stream_node")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Node extends IdEntity {
    @Column(name = "NAME")
    private String            name;        // 机器名字
    @Column(name = "IP")
    private String            ip;          // 机器ip
    @Column(name = "PORT")
    private Long              port;        // 和manager对应的通讯端口

    private NodeStatus        status;      // 对应状态
    @Column(name = "DESCRIPTION")
    private String            description; // 详细描述

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ZK_CLUSTER_ID")
    @NotFound(action = NotFoundAction.IGNORE)
    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    private AutoKeeperCluster cluster;

    @Column(name = "GMT_CREATE")
    private Date              gmtCreate;   // 创建时间

    @Column(name = "GMT_MODIFIED")
    private Date              gmtModified; // 修改时间

    
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Long getPort() {
        return port;
    }

    public void setPort(Long port) {
        this.port = port;
    }

    public NodeStatus getStatus() {
        return status;
    }

    public void setStatus(NodeStatus status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public AutoKeeperCluster getCluster() {
        return cluster;
    }

    public void setCluster(AutoKeeperCluster cluster) {
        this.cluster = cluster;
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

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, OtterToStringStyle.DEFAULT_STYLE);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        Node other = (Node) obj;
        if (id == null) {
            if (other.id != null) {
                return false;
            }
        } else if (!id.equals(other.id)) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

}
