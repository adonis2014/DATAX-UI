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

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.util.ReflectionUtils;

import com.alibaba.otter.shared.common.utils.OtterToStringStyle;

/**
 * pipeline相关的参数类
 * 
 * @author jianghang 2011-9-2 上午10:42:27
 * 
 * 去除不需要的文件传输等相关参数，该pipeline仅仅需要从log导向kafka，修改相关参数
 */
public class PipelineParameter implements Serializable {

    private static final long     serialVersionUID           = 8112362911827913152L;
    private Long                  pipelineId;
    private Long                  parallelism                = 3L;                          // 并行度
    private LoadBanlanceAlgorithm lbAlgorithm                = LoadBanlanceAlgorithm.Random; // 负载均衡算法
    private Boolean               home                       = false;                       // 是否为主站点
    private SelectorMode          selectorMode               = SelectorMode.Canal;          // 数据获取方式
    private String                destinationName;
    private Short                 mainstemClientId;                                         // mainstem订阅id
    private Integer               mainstemBatchsize          = 10000 * 10;                  // mainstem订阅批次大小
    private Integer               extractPoolSize            = 1;                           // extract模块载入线程数，针对单个载入通道
    private Integer               loadPoolSize               = 5;                           // load模块载入线程数，针对单个载入通道

    private Boolean               dumpEvent                  = true;                        // 是否需要dumpevent对象
    private Boolean               dumpSelector               = true;                        // 是否需要dumpSelector信息
    private Boolean               dumpSelectorDetail         = true;                        // 是否需要dumpSelector的详细信息
    private PipeChooseMode        pipeChooseType             = PipeChooseMode.AUTOMATIC;    // pipe传输模式
    private Boolean               skipSelectException        = false;                       // 是否跳过select时的执行异常
    private Boolean               skipLoadException          = false;                       // 是否跳过load时的执行异常
    private ArbitrateMode         arbitrateMode              = ArbitrateMode.ZOOKEEPER;     // 调度模式，默认进行自动选择
    private Long                  batchTimeout               = -1L;                         // 获取批量数据的超时时间,-1代表不进行超时控制，0代表永久，>0则表示按照指定的时间进行控制(单位毫秒)
                                                                                             



    /**
     * 合并pipeline参数设置
     */
    public void merge(PipelineParameter pipelineParameter) {
        try {
            Field[] fields = this.getClass().getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                Field field = fields[i];
                // Skip static and final fields.
                if (Modifier.isStatic(field.getModifiers()) || Modifier.isFinal(field.getModifiers())) {
                    continue;
                }

                ReflectionUtils.makeAccessible(field);
                Object srcValue = field.get(pipelineParameter);
                if (srcValue != null) { // 忽略null值
                    field.set(this, srcValue);
                }
            }
        } catch (Exception e) {
            // ignore
        }
    }

    public static enum LoadBanlanceAlgorithm {
        /** 轮询 */
        RoundRbin,
        /** 随机 */
        Random,
        /** Stick */
        Stick;

        public boolean isRoundRbin() {
            return this.equals(LoadBanlanceAlgorithm.RoundRbin);
        }

        public boolean isRandom() {
            return this.equals(LoadBanlanceAlgorithm.Random);
        }

        public boolean isStick() {
            return this.equals(LoadBanlanceAlgorithm.Stick);
        }
    }

    public static enum ArbitrateMode {
        /** 内存调度 */
        MEMORY,
        /** rpc调度 */
        RPC,
        /** zk watcher调度 */
        ZOOKEEPER,
        /** 自动选择 */
        AUTOMATIC;

        public boolean isMemory() {
            return this.equals(ArbitrateMode.MEMORY);
        }

        public boolean isRpc() {
            return this.equals(ArbitrateMode.RPC);
        }

        public boolean isZookeeper() {
            return this.equals(ArbitrateMode.ZOOKEEPER);
        }

        public boolean isAutomatic() {
            return this.equals(ArbitrateMode.AUTOMATIC);
        }
    }

    public static enum PipeChooseMode {
        /** 自动选择 */
        AUTOMATIC,
        /** RPC */
        RPC,
        /** HTTP */
        HTTP;

        public boolean isAutomatic() {
            return this.equals(PipeChooseMode.AUTOMATIC);
        }

        public boolean isRpc() {
            return this.equals(PipeChooseMode.RPC);
        }

        public boolean isHttp() {
            return this.equals(PipeChooseMode.HTTP);
        }
    }

    public static enum SelectorMode {

        Eromanga, Canal;

        public boolean isEromanga() {
            return this.equals(SelectorMode.Eromanga);
        }

        public boolean isCanal() {
            return this.equals(SelectorMode.Canal);
        }

    }

    // ======================== setter / getter ===========================

    public Long getPipelineId() {
        return pipelineId;
    }

    public void setPipelineId(Long pipelineId) {
        this.pipelineId = pipelineId;
    }

    public Long getParallelism() {
        return parallelism;
    }

    public void setParallelism(Long parallelism) {
        this.parallelism = parallelism;
    }

    public LoadBanlanceAlgorithm getLbAlgorithm() {
        return lbAlgorithm;
    }

    public void setLbAlgorithm(LoadBanlanceAlgorithm lbAlgorithm) {
        this.lbAlgorithm = lbAlgorithm;
    }

    public Short getMainstemClientId() {
        return mainstemClientId;
    }

    public void setMainstemClientId(short mainstemClientId) {
        this.mainstemClientId = mainstemClientId;
    }

    public Integer getMainstemBatchsize() {
        return mainstemBatchsize;
    }

    public Boolean isHome() {
        return home;
    }

    public void setHome(Boolean home) {
        this.home = home;
    }

    public Integer getLoadPoolSize() {
        return loadPoolSize;
    }

    public void setLoadPoolSize(Integer loadPoolSize) {
        this.loadPoolSize = loadPoolSize;
    }

    public Integer getExtractPoolSize() {
        return extractPoolSize;
    }

    public void setExtractPoolSize(int extractPoolSize) {
        this.extractPoolSize = extractPoolSize;
    }

    public Boolean isDumpEvent() {
        return dumpEvent;
    }

    public void setDumpEvent(Boolean dumpEvent) {
        this.dumpEvent = dumpEvent;
    }

    public PipeChooseMode getPipeChooseType() {
        return pipeChooseType;
    }

    public void setPipeChooseType(PipeChooseMode pipeChooseType) {
        this.pipeChooseType = pipeChooseType;
    }

    public Boolean getSkipLoadException() {
        // 兼容性处理
        return skipLoadException == null ? false : skipLoadException;
    }

    public void setSkipLoadException(Boolean skipLoadException) {
        this.skipLoadException = skipLoadException;
    }

    public void setSelectorMode(SelectorMode selectorMode) {
        this.selectorMode = selectorMode;
    }

    public Boolean getHome() {
        return home;
    }

    public Boolean getDumpEvent() {
        return dumpEvent;
    }

    public void setExtractPoolSize(Integer extractPoolSize) {
        this.extractPoolSize = extractPoolSize;
    }

    public Boolean getDumpSelector() {
        // 兼容性处理
        return dumpSelector == null ? true : dumpSelector;
    }

    public void setDumpSelector(Boolean dumpSelector) {
        this.dumpSelector = dumpSelector;
    }

    public Boolean getDumpSelectorDetail() {
        // 兼容性处理
        return dumpSelectorDetail == null ? true : dumpSelectorDetail;
    }

    public void setDumpSelectorDetail(Boolean dumpSelectorDetail) {
        this.dumpSelectorDetail = dumpSelectorDetail;
    }

    public SelectorMode getSelectorMode() {
        return selectorMode;
    }

    public ArbitrateMode getArbitrateMode() {
        return arbitrateMode == null ? ArbitrateMode.ZOOKEEPER : arbitrateMode;
    }

    public void setArbitrateMode(ArbitrateMode arbitrateMode) {
        this.arbitrateMode = arbitrateMode;
    }

    public Long getBatchTimeout() {
        return batchTimeout == null ? -1 : batchTimeout;
    }

    public void setBatchTimeout(Long batchTimeout) {
        this.batchTimeout = batchTimeout;
    }

    public String getDestinationName() {
        return destinationName;
    }

    public void setDestinationName(String destinationName) {
        this.destinationName = destinationName;
    }

    public void setMainstemClientId(Short mainstemClientId) {
        this.mainstemClientId = mainstemClientId;
    }

    public void setMainstemBatchsize(Integer mainstemBatchsize) {
        this.mainstemBatchsize = mainstemBatchsize;
    }

    public Boolean getSkipSelectException() {
        return skipSelectException == null ? false : skipSelectException;
    }

    public void setSkipSelectException(Boolean skipSelectException) {
        this.skipSelectException = skipSelectException;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, OtterToStringStyle.DEFAULT_STYLE);
    }

}
