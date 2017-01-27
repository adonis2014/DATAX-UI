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

package com.alibaba.otter.shared.arbitrate.impl.setl.monitor;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ExecutorService;

import org.I0Itec.zkclient.IZkDataListener;
import org.I0Itec.zkclient.exception.ZkException;
import org.I0Itec.zkclient.exception.ZkNoNodeException;
import org.apache.commons.lang.ClassUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;

import com.alibaba.otter.shared.arbitrate.impl.ArbitrateConstants;
import com.alibaba.otter.shared.arbitrate.impl.config.ArbitrateConfigUtils;
import com.alibaba.otter.shared.arbitrate.impl.setl.ArbitrateLifeCycle;
import com.alibaba.otter.shared.arbitrate.impl.setl.helper.StagePathUtils;
import com.alibaba.otter.shared.arbitrate.impl.setl.monitor.listener.PermitListener;
import com.alibaba.otter.shared.arbitrate.impl.zookeeper.ZooKeeperClient;
import com.alibaba.otter.shared.arbitrate.model.MainStemEventData;
import com.alibaba.otter.shared.common.model.config.pipeline.PipelineStatus;
import com.alibaba.otter.shared.common.utils.JsonUtils;
import com.alibaba.otter.shared.common.utils.lock.BooleanMutex;
import com.alibaba.otter.shared.common.utils.zookeeper.ZkClientx;

/**
 * 同步任务状态的监控
 * 
 * <pre>
 * 监控数据内容：
 * 1. piepline的status状态
 * 2. 当前pipeline的mainStem状态 &　反向同步的pipeline的mainStem状态
 * </pre>
 * 
 * @author jianghang
 * 
 * 将channel状态监控值合并到pipeline.
 * 
 * @author Joe.Zhang
 * 
 */
public class PermitMonitor extends ArbitrateLifeCycle implements Monitor {

    private static final Logger      logger                 = LoggerFactory.getLogger(PermitMonitor.class);

    private ZkClientx                zookeeper              = ZooKeeperClient.getInstance();
    private PipelineStatus           pipelineStatus          = PipelineStatus.STOP;                                           // 标识pipeline的状态
    private MainStemEventData.Status mainStemStatus         = MainStemEventData.Status.TAKEING;                             // 当前pipeline的mainStem状态
    private MainStemEventData.Status oppositeMainStemStatus = MainStemEventData.Status.TAKEING;                             // 反方向的pipeline的mainStem状态

    private ExecutorService          arbitrateExecutor;
    private BooleanMutex             permitMutex            = new BooleanMutex(false);                                      // 控制器
    private BooleanMutex             channelMutex           = new BooleanMutex(false);
    private List<PermitListener>     listeners              = Collections.synchronizedList(new ArrayList<PermitListener>());
    private volatile boolean         existOpposite          = false;
    private IZkDataListener          pipelineDataListener;
    private IZkDataListener          mainstemDataListener;
    private IZkDataListener          oppositeMainstemDataListener;

    public PermitMonitor(Long pipelineId){
        super(pipelineId);
        existOpposite = (ArbitrateConfigUtils.getOppositePipeline(getPipelineId()) != null);
        // 开始同步
        pipelineDataListener = new IZkDataListener() {

            public void handleDataChange(String dataPath, Object data) throws Exception {
                initPipelineStatus((byte[]) data);
            }

            public void handleDataDeleted(String dataPath) throws Exception {
                pipelineStatus = PipelineStatus.STOP;
                permitSem();
            }
        };
        String path = StagePathUtils.getProject(getPipelineId());
        zookeeper.subscribeDataChanges(path, pipelineDataListener);

        mainstemDataListener = new IZkDataListener() {

            public void handleDataChange(String dataPath, Object data) throws Exception {
                initMainStemStatus((byte[]) data);
            }

            public void handleDataDeleted(String dataPath) throws Exception {
                // mainstem节点挂了后，状态直接修改为taking
                mainStemStatus = MainStemEventData.Status.TAKEING;
                permitSem();
            }
        };

        path = StagePathUtils.getMainStem(getPipelineId());
        zookeeper.subscribeDataChanges(path, mainstemDataListener);

        initPipelineStatus();
        initMainStemStatus();
        // syncChannelStatus();
        // syncMainStemStatus();
        if (existOpposite) {
            oppositeMainstemDataListener = new IZkDataListener() {

                public void handleDataChange(String dataPath, Object data) throws Exception {
                    initOppositeMainStemStatus((byte[]) data);
                }

                public void handleDataDeleted(String dataPath) throws Exception {
                    // mainstem节点挂了后，状态直接修改为taking
                    oppositeMainStemStatus = MainStemEventData.Status.TAKEING;
                    permitSem();
                }
            };

            path = StagePathUtils.getOppositeMainStem(getPipelineId());
            zookeeper.subscribeDataChanges(path, oppositeMainstemDataListener);
            initOppositeMainStemStatus();
            // syncOppositeMainStemStatus();
        }
        MonitorScheduler.register(this);
    }

    public void reload() {
        if (logger.isDebugEnabled()) {
            logger.debug("## reload Permit pipeline[{}]", getPipelineId());
        }

        try {
            initPipelineStatus();
        } catch (Exception e) {// 处理下异常
        }

        try {
            initMainStemStatus();
        } catch (Exception e) {// 处理下异常
        }

        boolean prev = existOpposite;
        existOpposite = (ArbitrateConfigUtils.getOppositePipeline(getPipelineId()) != null);
        if (existOpposite) {
            if (prev == false) {
                // syncOppositeMainStemStatus();// 是个变化的过程，开启反向同步
                String path = StagePathUtils.getOppositeMainStem(getPipelineId());
                zookeeper.subscribeDataChanges(path, oppositeMainstemDataListener);
            }

            try {
                initOppositeMainStemStatus();
            } catch (Exception e) {// 处理下异常
            }
        }

    }

    public void destory() {
        super.destory();

        if (logger.isDebugEnabled()) {
            logger.debug("## destory Permit pipeline[{}]", getPipelineId());
        }
        String path = StagePathUtils.getPipeline(getPipelineId());
        zookeeper.unsubscribeDataChanges(path, pipelineDataListener);

        path = StagePathUtils.getMainStem(getPipelineId());
        zookeeper.unsubscribeDataChanges(path, mainstemDataListener);

        if (existOpposite) {
            path = StagePathUtils.getOppositeMainStem(getPipelineId());
            zookeeper.unsubscribeDataChanges(path, oppositeMainstemDataListener);
        }

        MonitorScheduler.unRegister(this);
    }

    /**
     * 查询是否允许授权处理，非阻塞
     */
    public boolean isPermit() {
        return isPermit(false);
    }

    /**
     * 查询是否允许授权处理，非阻塞，指定是否强制刷新
     */
    public boolean isPermit(boolean reload) {
        if (reload) {// 判断是否需要重新reload
            reload();
        }

        boolean result = pipelineStatus.isStart() && mainStemStatus.isOverTake();
        if (existOpposite) {// 判断是否存在反向同步
            result &= oppositeMainStemStatus.isOverTake();
        }

        return result;
    }

    /**
     * 查询对应的channel授权状态
     */
    public PipelineStatus getPipelinePermit() {
        return getPipelinePermit(false);
    }

    /**
     * 查询对应的mainstem授权状态
     */
    public MainStemEventData.Status getMainStemPermit() {
        return getMainStemPermit(false);
    }

    /**
     * 查询对应的channel授权状态，指定是否强制刷新
     */
    public PipelineStatus getPipelinePermit(boolean reload) {
        if (reload) {
            initPipelineStatus();
        }

        return pipelineStatus;
    }

    /**
     * 查询对应的mainstem授权状态，指定是否强制刷新
     */
    public MainStemEventData.Status getMainStemPermit(boolean reload) {
        if (reload) {
            initMainStemStatus();
        }

        return mainStemStatus;
    }

    /**
     * 阻塞等待允许授权处理, 支持线程中断信号
     * 
     * @return
     */
    public void waitForPermit() throws InterruptedException {
        permitMutex.get();
    }

    /**
     * 阻塞等待允许channel的授权处理, 支持线程中断信号
     * 
     * @throws InterruptedException
     */
    public void waitForPipelinePermit() throws InterruptedException {
        channelMutex.get();
    }

    // ================ 状态数据同步 ================

    private void initPipelineStatus() {
        String path = null;
        try {
            path = StagePathUtils.getPipeline(getPipelineId());
            byte[] bytes = zookeeper.readData(path);
            initPipelineStatus(bytes);
        } catch (ZkNoNodeException e) {
            pipelineStatus = PipelineStatus.STOP;
            permitSem();
        } catch (ZkException e) {
            logger.error(path, e);
        }
    }

    private void initPipelineStatus(byte[] bytes) {
        PipelineStatus newPipelineStatus = JsonUtils.unmarshalFromByte(bytes, PipelineStatus.class);

        if (logger.isDebugEnabled()) {
            logger.debug("pipeline[{}] newChannelStatus is [{}]", getPipelineId(), newPipelineStatus);
        }

        synchronized (this) {
            // 发生变化，才触发权限检查
            if (!newPipelineStatus.equals(pipelineStatus)) {
                pipelineStatus = newPipelineStatus;
                permitSem();
            }
        }
    }

    

    private void initMainStemStatus() {
        String path = null;
        try {
            path = StagePathUtils.getMainStem(getPipelineId());
            byte[] bytes = zookeeper.readData(path);
            initMainStemStatus(bytes);
        } catch (ZkNoNodeException e) {
            // mainstem节点挂了后，状态直接修改为taking
            mainStemStatus = MainStemEventData.Status.TAKEING;
            permitSem();
        } catch (ZkException e) {
            logger.error(path, e);
        }
    }

    private void initMainStemStatus(byte[] bytes) {
        MainStemEventData eventData = JsonUtils.unmarshalFromByte(bytes, MainStemEventData.class);
        MainStemEventData.Status newStatus = eventData.getStatus();

        if (logger.isDebugEnabled()) {
            logger.debug("pipeline[{}] new mainStemStatus is [{}]", getPipelineId(), newStatus);
        }

        synchronized (this) {
            if (!mainStemStatus.equals(newStatus)) {
                mainStemStatus = newStatus;
                permitSem();
            }
        }
    }

    

    private void initOppositeMainStemStatus() {
        String path = null;
        try {
            path = StagePathUtils.getOppositeMainStem(getPipelineId());
            byte[] bytes = zookeeper.readData(path);
            initOppositeMainStemStatus(bytes);
        } catch (ZkNoNodeException e) {
            // mainstem节点挂了后，状态直接修改为taking
            oppositeMainStemStatus = MainStemEventData.Status.TAKEING;
            permitSem();
        } catch (ZkException e) {
            logger.error(path, e);
        }
    }

    private void initOppositeMainStemStatus(byte[] bytes) {
        MainStemEventData eventData = JsonUtils.unmarshalFromByte(bytes, MainStemEventData.class);
        MainStemEventData.Status newStatus = eventData.getStatus();

        if (logger.isDebugEnabled()) {
            logger.debug("pipeline[{}] new oppositeMainStemStatus is [{}]", getPipelineId(), newStatus);
        }

        synchronized (this) {
            if (!oppositeMainStemStatus.equals(newStatus)) {
                oppositeMainStemStatus = newStatus;
                permitSem();
            }
        }
    }

    

    /**
     * permit信号的处理
     */
    private void permitSem() {
        if (pipelineStatus.isStart()) {
            channelMutex.set(true);
            logger.debug("channel status is ok!");
        } else {
            channelMutex.set(false);
            logger.debug("channel status is fail!");
        }

        boolean permit = isPermit(false);
        if (permit == false) {
            if (logger.isDebugEnabled()) {
                logger.debug("Permit is fail!");
            }
            // 如果未授权，则设置信号量为0
            permitMutex.set(false);
        } else {
            // 信号量+1
            if (logger.isDebugEnabled()) {
                logger.debug("Permit is Ok!");
            }
            permitMutex.set(true);
        }

        processChanged(permit);// 通知下变化
    }

    // ======================== listener处理 ======================

    public void addListener(PermitListener listener) {
        if (logger.isDebugEnabled()) {
            logger.debug("## pipeline[{}] add listener [{}]", getPipelineId(),
                         ClassUtils.getShortClassName(listener.getClass()));
        }

        this.listeners.add(listener);
    }

    public void removeListener(PermitListener listener) {
        if (logger.isDebugEnabled()) {
            logger.debug("## pipeline[{}] remove listener [{}]", getPipelineId(),
                         ClassUtils.getShortClassName(listener.getClass()));
        }

        this.listeners.remove(listener);
    }

    private void processChanged(final boolean isPermit) {
        for (final PermitListener listener : listeners) {
            // 异步处理
            arbitrateExecutor.submit(new Runnable() {

                public void run() {
                    MDC.put(ArbitrateConstants.splitPipelineLogFileKey, String.valueOf(getPipelineId()));
                    listener.processChanged(isPermit);
                }
            });
        }
    }

    public void setArbitrateExecutor(ExecutorService arbitrateExecutor) {
        this.arbitrateExecutor = arbitrateExecutor;
    }

}
