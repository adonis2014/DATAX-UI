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

package com.alibaba.otter.shared.common.model.statistics.table;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.alibaba.otter.shared.common.utils.OtterToStringStyle;

import net.iharding.core.orm.IdEntity;

/**
 * @author jianghang 2011-9-8 下午06:28:18
 * 
 * 改造为hibernate方式
 * 
 */
@Entity
@Table(name = "stream_stat_table")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class TableStat  extends IdEntity {
    
    @Column(name = "PIPELINE_ID")
    private Long              pipelineId;                              // 同步任务组
    
    @Column(name = "INSERT_COUNT")
    private Long              insertCount;
    @Column(name = "UPDATE_COUNT")
    private Long              updateCount;
    @Column(name = "DELETE_COUNT")
    private Long              deleteCount;
    @Column(name = "DATA_MEDIA_PAIR_ID")
    private Long              dataMediaPairId;
    // add by ljh at 2012-07-13
    private Date              startTime;                               // 批次开始时间
    private Date              endTime;                                 // 批次结束时间
    @Column(name = "GMT_CREATE")
    private Date gmtCreate;   // 创建时间

    @Column(name = "GMT_MODIFIED")
    private Date gmtModified; // 修改时间

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPipelineId() {
        return pipelineId;
    }

    public void setPipelineId(Long pipelineId) {
        this.pipelineId = pipelineId;
    }

    public Long getDataMediaPairId() {
        return dataMediaPairId;
    }

    public void setDataMediaPairId(Long dataMediaPairId) {
        this.dataMediaPairId = dataMediaPairId;
    }

    public Long getDeleteCount() {
        return deleteCount;
    }

    public void setDeleteCount(Long deleteCount) {
        this.deleteCount = deleteCount;
    }

    public Long getUpdateCount() {
        return updateCount;
    }

    public void setUpdateCount(Long updateCount) {
        this.updateCount = updateCount;
    }

    public Long getInsertCount() {
        return insertCount;
    }

    public void setInsertCount(Long insertCount) {
        this.insertCount = insertCount;
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

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, OtterToStringStyle.DEFAULT_STYLE);
    }

}
