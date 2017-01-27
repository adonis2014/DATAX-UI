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

package com.alibaba.otter.shared.common.model.statistics.delay;

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
 * 延迟状态
 * 
 * @author jianghang 2011-9-8 下午12:32:10
 * 
 *  改造为hibernate model
 */
@Entity
@Table(name = "stream_stat_delay")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class DelayStat extends IdEntity {
    
    @Column(name = "PIPELINE_ID")
    private Long pipelineId;
    
    @Column(name = "DELAY_NUMBER")
    private Long delayNumber; // 延迟数量
    
    @Column(name = "DELAY_TIME")
    private Long delayTime;   // 延迟时间
    
    @Column(name = "MIN_DELAY_TIME")
    private Long minDelayTime;
    
    @Column(name = "MAX_DELAY_TIME")
    private Long maxDelayTime;

    @Column(name = "GMT_CREATE")
    private Date gmtCreate;   // 创建时间

    @Column(name = "GMT_MODIFIED")
    private Date gmtModified; // 修改时间

    public Long getPipelineId() {
        return pipelineId;
    }

    public void setPipelineId(Long pipelineId) {
        this.pipelineId = pipelineId;
    }

    public Long getMinDelayTime() {
        return minDelayTime;
    }

    public void setMinDelayTime(Long minDelayTime) {
        this.minDelayTime = minDelayTime;
    }

    public Long getMaxDelayTime() {
        return maxDelayTime;
    }

    public void setMaxDelayTime(Long maxDelayTime) {
        this.maxDelayTime = maxDelayTime;
    }

    public Long getDelayNumber() {
        return delayNumber;
    }

    public void setDelayNumber(Long delayNumber) {
        this.delayNumber = delayNumber;
    }

    public Long getDelayTime() {
        return delayTime;
    }

    public void setDelayTime(Long delayTime) {
        this.delayTime = delayTime;
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

}
