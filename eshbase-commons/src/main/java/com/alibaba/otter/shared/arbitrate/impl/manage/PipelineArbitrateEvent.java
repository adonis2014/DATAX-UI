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

package com.alibaba.otter.shared.arbitrate.impl.manage;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;

import org.I0Itec.zkclient.exception.ZkException;
import org.I0Itec.zkclient.exception.ZkNoNodeException;
import org.I0Itec.zkclient.exception.ZkNodeExistsException;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.zookeeper.CreateMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;

import com.alibaba.otter.shared.arbitrate.ArbitrateViewService;
import com.alibaba.otter.shared.arbitrate.exception.ArbitrateException;
import com.alibaba.otter.shared.arbitrate.impl.ArbitrateConstants;
import com.alibaba.otter.shared.arbitrate.impl.ArbitrateEvent;
import com.alibaba.otter.shared.arbitrate.impl.config.ArbitrateConfigUtils;
import com.alibaba.otter.shared.arbitrate.impl.manage.helper.ManagePathUtils;
import com.alibaba.otter.shared.arbitrate.impl.setl.helper.StagePathUtils;
import com.alibaba.otter.shared.arbitrate.impl.setl.zookeeper.termin.ErrorTerminProcess;
import com.alibaba.otter.shared.arbitrate.impl.setl.zookeeper.termin.WarningTerminProcess;
import com.alibaba.otter.shared.arbitrate.impl.zookeeper.ZooKeeperClient;
import com.alibaba.otter.shared.arbitrate.model.TerminEventData;
import com.alibaba.otter.shared.arbitrate.model.TerminEventData.TerminType;
import com.alibaba.otter.shared.common.model.config.node.Node;
import com.alibaba.otter.shared.common.model.config.pipeline.Pipeline;
import com.alibaba.otter.shared.common.model.config.pipeline.PipelineStatus;
import com.alibaba.otter.shared.common.model.statistics.stage.ProcessStat;
import com.alibaba.otter.shared.common.utils.JsonUtils;
import com.alibaba.otter.shared.common.utils.zookeeper.ZkClientx;

/**
 * 针对pipeline管理的相关信号操作
 * 
 * @author jianghang 2011-8-31 下午07:34:11
 * 
 * 仲裁器改为pipeline状态改变和启动，停止，暂停，去除原来channel的方式
 * 
 */
public class PipelineArbitrateEvent implements ArbitrateEvent {

    protected static final Logger logger    = LoggerFactory.getLogger(PipelineArbitrateEvent.class);

    private ZkClientx             zookeeper = ZooKeeperClient.getInstance();
    private ArbitrateViewService  arbitrateViewService;
    private NodeArbitrateEvent    nodeEvent;
    private ErrorTerminProcess    errorTerminProcess;
    private WarningTerminProcess  warningTerminProcess;
    private ExecutorService       arbitrateExecutor;

    /**
     * 初始化管道信息
     *
     * @param pipelineId
     */
    public void init(Long pipelineId) {
        Pipeline pipeline = ArbitrateConfigUtils.getPipeline(pipelineId);
        init(pipeline.getProjectId(), pipelineId);
    }

    /**
     * 初始化对应的pipeline节点,同步调用
     */
    public void init(Long projectId, Long pipelineId) {
        //建立Project的zk数据
        String prjpath = ManagePathUtils.getProjectByProjectId(projectId);
        byte[] data = JsonUtils.marshalToByte(PipelineStatus.STOP);// 初始化的数据对象
        try {
            zookeeper.create(prjpath, data, CreateMode.PERSISTENT);
        } catch (ZkNodeExistsException e) {
            // 如果节点已经存在，则不抛异常
            // ignore
        } catch (ZkNoNodeException e) {
            zookeeper.createPersistent(prjpath, data, true);//创建父节点
        } catch (ZkException e) {
            throw new ArbitrateException("Channel_init", projectId.toString(), e);
        }
        //建立pipeline的zk数据
        String path = ManagePathUtils.getPipeline(projectId, pipelineId);
        String processRootPath = ManagePathUtils.getProcessRoot(projectId, pipelineId);
        String terminRootPath = ManagePathUtils.getTerminRoot(projectId, pipelineId);
        String remedyRootPath = ManagePathUtils.getRemedyRoot(projectId, pipelineId);
        String lockRootPath = ManagePathUtils.getLockRoot(projectId, pipelineId);
        String loadLockPath = lockRootPath + "/" + ArbitrateConstants.NODE_LOCK_LOAD;
        try {
            zookeeper.createPersistent(path, true);//创建父节点
            zookeeper.create(processRootPath, new byte[0], CreateMode.PERSISTENT);
            zookeeper.create(terminRootPath, new byte[0], CreateMode.PERSISTENT);
            zookeeper.create(remedyRootPath, new byte[0], CreateMode.PERSISTENT);
            zookeeper.create(lockRootPath, new byte[0], CreateMode.PERSISTENT);
            zookeeper.create(loadLockPath, new byte[0], CreateMode.PERSISTENT);
        } catch (ZkNodeExistsException e) {
            // 如果节点已经存在，则不抛异常
            // ignore
        } catch (ZkException e) {
            throw new ArbitrateException("Pipeline_init", pipelineId.toString(), e);
        }
    }

    /**
     * 销毁对应的pipeline节点,同步调用
     */
    public void destory(Long projectId, Long pipelineId) {
        String path = ManagePathUtils.getPipeline(projectId, pipelineId);
        String processRootPath = ManagePathUtils.getProcessRoot(projectId, pipelineId);
        String terminRootPath = ManagePathUtils.getTerminRoot(projectId, pipelineId);
        String remedyRootPath = ManagePathUtils.getRemedyRoot(projectId, pipelineId);
        String lockRootPath = ManagePathUtils.getLockRoot(projectId, pipelineId);
        String loadLockPath = lockRootPath + "/" + ArbitrateConstants.NODE_LOCK_LOAD;
        try {
            zookeeper.deleteRecursive(loadLockPath); // 删除节点，不关心版本
            zookeeper.deleteRecursive(lockRootPath); // 删除节点，不关心版本
            zookeeper.deleteRecursive(terminRootPath); // 删除节点，不关心版本
            zookeeper.deleteRecursive(remedyRootPath); // 删除节点，不关心版本
            zookeeper.deleteRecursive(processRootPath); // 删除节点，不关心版本
            zookeeper.deleteRecursive(path); // 删除节点，不关心版本
        } catch (ZkNoNodeException e) {
            // 如果节点已经不存在，则不抛异常
            // ignore
        } catch (ZkException e) {
            throw new ArbitrateException("Pipeline_destory", pipelineId.toString(), e);
        }
    }

    /**
     * 启动对应的channel同步,是个同步调用
     */
    public void start(Long pipelineId) {
        updateStatus(pipelineId, PipelineStatus.START);
    }

    /**
     * 停止对应的channel同步,是个异步调用
     */
    public boolean pause(Long pipelineId) {
        return pause(pipelineId, true);
    }

    /**
     * 停止对应的channel同步,是个异步调用
     */
    public boolean pause(Long pipelineId, boolean needTermin) {
        PipelineStatus currstatus = status(pipelineId);
        boolean status = false;
        boolean result = !needTermin;
        if (currstatus.isStart()) { // stop的优先级高于pause，这里只针对start状态进行状态更新
            updateStatus(pipelineId, PipelineStatus.PAUSE);
            status = true; // 避免stop时发生rollback报警
        }

        if (needTermin) {
            try {
                // 调用termin进行关闭
                result |= termin(pipelineId, TerminType.ROLLBACK);
            } catch (Throwable e) {
                updateStatus(pipelineId, PipelineStatus.PAUSE); // 出错了，直接挂起
                throw new ArbitrateException(e);
            }
        }

        return result && status;
    }

    /**
     * 停止对应的channel同步,是个异步调用
     */
    public boolean stop(Long pipelineId) {
        return stop(pipelineId, true);
    }

    /**
     * 停止对应的channel同步,是个异步调用
     */
    public boolean stop(Long pipelineId, boolean needTermin) {
        // stop优先级高于pause
        updateStatus(pipelineId, PipelineStatus.STOP);

        boolean result = !needTermin;

        if (needTermin) {
            try {
                result |= termin(pipelineId, TerminType.SHUTDOWN);
            } catch (Throwable e) {
                updateStatus(pipelineId, PipelineStatus.STOP); // 出错了，直接挂起
                throw new ArbitrateException(e);
            }
        }

        return result;
    }

    public boolean restart(final Long pipelineId) {
        return restart(pipelineId, true);
    }

    /**
     * 停止对应的channel同步,是个异步调用
     */
    public boolean restart(final Long pipelineId, boolean needTermin) {
        boolean result = !needTermin;
        boolean status = false;
        if (status(pipelineId).isStop() == false) { // stop的优先级高于pause
            updateStatus(pipelineId, PipelineStatus.PAUSE);
            status = true;
        }

        if (needTermin) {
            try {
                result |= termin(pipelineId, TerminType.RESTART);
            } catch (Throwable e) {
                updateStatus(pipelineId, PipelineStatus.PAUSE); // 出错了，直接挂起
                throw new ArbitrateException(e);
            }

        }

        // 处理一下重启操作，只处理pause状态
        if (status || result) {
            // 异步启动
            arbitrateExecutor.submit(new Runnable() {
                public void run() {
                    // sleep一段时间，保证rollback信息有足够的时间能被处理完成
                    try {
                        Thread.sleep(5000L + RandomUtils.nextInt(2000));
                    } catch (InterruptedException e) {
                        // ignore
                    }
                    Pipeline pipeline = ArbitrateConfigUtils.getPipeline(pipelineId);
                    PipelineStatus status = status(pipeline.getId());
                    if (status.isStop()) {
                        // stop优先级最高，不允许自动重启
                        logger.info("pipeline[{}] is already stop , restart is ignored", pipeline.getId());
                    } else if (canStart(pipeline)) { // 出现stop，就不允许进行自动重启，stop优先级最高
                        start(pipelineId);
                    }
                }
            });
        }
        return result && status;
    }

    /**
     * 查询当前channel的运行状态，是否同步调用
     */
    public PipelineStatus status(Long pipelineId) {
        String path = StagePathUtils.getPipeline(pipelineId);
        byte[] data = null;
        try {
            data = zookeeper.readData(path);
        } catch (ZkNoNodeException e) {
            // 如果节点已经不存在，则不抛异常  ignore
            init(pipelineId);
            data = zookeeper.readData(path);
        } catch (ZkException e) {
            throw new ArbitrateException("Pipeline_status", pipelineId.toString(), e);
        }
        return JsonUtils.unmarshalFromByte(data, PipelineStatus.class);
    }

    /**
     * 销毁对应的channel节点,同步调用
     */
    public void destory(Long pipelineId) {
        Pipeline pipeline = ArbitrateConfigUtils.getPipeline(pipelineId);
        String path = ManagePathUtils.getPipeline(pipeline.getProjectId(), pipelineId);
        try {
            zookeeper.delete(path); // 删除节点，不关心版本
        } catch (ZkNoNodeException e) {
            // 如果节点已经不存在，则不抛异常
            // ignore
        } catch (ZkException e) {
            throw new ArbitrateException("Channel_destory", pipelineId.toString(), e);
        }
    }

    // ===================== help method =================

    /**
     * 执行结束同步任务操作
     */
    private Boolean termin(Long pipelineId, final TerminType type) throws Exception {
        Pipeline pipeline = ArbitrateConfigUtils.getPipeline(pipelineId);
        List<Future<Boolean>> futures = new ArrayList<Future<Boolean>>();
        futures.add(arbitrateExecutor.submit(new Callable<Boolean>() {
            public Boolean call() {
                TerminEventData data = new TerminEventData();
                data.setPipelineId(pipeline.getId());
                data.setType(type);
                data.setCode("channel");
                data.setDesc(type.toString());
                return errorTerminProcess.process(data); // 处理关闭
            }
        }));
        boolean result = false;
        Exception exception = null;
        for (Future<Boolean> future : futures) {
            try {
                result |= future.get(); // 进行处理
            } catch (InterruptedException e) {
                // ignore
                Thread.currentThread().interrupt();
            } catch (ExecutionException e) {
                sendWarningMessage(pipeline.getId(), e);
                exception = e;
            }
        }
        if (exception != null) {
            throw exception;
        } else {
            return result;
        }
    }

    private void sendWarningMessage(Long pipelineId, Exception e) {
        sendWarningMessage(pipelineId, ExceptionUtils.getFullStackTrace(e));
    }

    private void sendWarningMessage(Long pipelineId, String message) {
        TerminEventData eventData = new TerminEventData();
        eventData.setPipelineId(pipelineId);
        eventData.setType(TerminType.WARNING);
        eventData.setCode("pipeline");
        eventData.setDesc(message);
        warningTerminProcess.process(eventData);
    }

    private boolean canStart(Pipeline pipeline) {
        // 判断机器节点是否有存活的通路
        // 查询一下最新的存活的node列表，可能channel取出来的数据为cache的结果
        List<Long> liveNodes = nodeEvent.liveNodes();
        //todo
        // 判断select
        List<Long> nids = getNids(pipeline.getSelectNodes());
        if (!CollectionUtils.containsAny(liveNodes, nids)) {
            logger.error("current live nodes:{} , but select nids:{} , result:{}",
                new Object[] { liveNodes, nids, CollectionUtils.containsAny(liveNodes, nids) });
            sendWarningMessage(pipeline.getId(), "can't restart by no select live node");
            return false;
        }

        // 判断extract
        nids = getNids(pipeline.getExtractNodes());
        if (!CollectionUtils.containsAny(liveNodes, nids)) {
            logger.error("current live nodes:{} , but extract nids:{} , result:{}",
                new Object[] { liveNodes, nids, CollectionUtils.containsAny(liveNodes, nids) });
            sendWarningMessage(pipeline.getId(), "can't restart by no extract live node");
            return false;
        }

        // 判断transform/load
        nids = getNids(pipeline.getLoadNodes());
        if (!CollectionUtils.containsAny(liveNodes, nids)) {
            logger.error("current live nodes:{} , but transform nids:{} , result:{}",
                new Object[] { liveNodes, nids, CollectionUtils.containsAny(liveNodes, nids) });
            sendWarningMessage(pipeline.getId(), "can't restart by no transform live node");
            return false;
        }

        // 判断当前没有未清理的process
        List<ProcessStat> stats = arbitrateViewService.listProcesses(pipeline.getId(), pipeline.getId());
        if (!stats.isEmpty() && !status(pipeline.getId()).isStart()) {
            List<Long> processIds = new ArrayList<Long>();
            for (ProcessStat stat : stats) {
                processIds.add(stat.getProcessId());
            }
            sendWarningMessage(pipeline.getId(),
                "can't restart by exist process[" + StringUtils.join(processIds, ',') + "]");
            return false;
        }
        return true;
    }

    private List<Long> getNids(List<Node> nodes) {
        List<Long> nids = new ArrayList<Long>();
        for (Node node : nodes) {
            nids.add(node.getId());
        }

        return nids;
    }

    private void updateStatus(Long pipelineId, PipelineStatus status) {
        Pipeline pipeline= ArbitrateConfigUtils.getPipeline(pipelineId);
        String path = ManagePathUtils.getPipeline(pipeline.getProjectId(), pipelineId);
        byte[] data = JsonUtils.marshalToByte(status);// 初始化的数据对象
        try {
            zookeeper.writeData(path, data);
        } catch (ZkException e) {
            throw new ArbitrateException("Pipeline_init", pipelineId.toString(), e);
        }
    }

    // ====================== setter / getter =================

    public void setErrorTerminProcess(ErrorTerminProcess errorTerminProcess) {
        this.errorTerminProcess = errorTerminProcess;
    }

    public void setWarningTerminProcess(WarningTerminProcess warningTerminProcess) {
        this.warningTerminProcess = warningTerminProcess;
    }

    public void setArbitrateExecutor(ExecutorService arbitrateExecutor) {
        this.arbitrateExecutor = arbitrateExecutor;
    }

    public void setArbitrateViewService(ArbitrateViewService arbitrateViewService) {
        this.arbitrateViewService = arbitrateViewService;
    }

    public void setNodeEvent(NodeArbitrateEvent nodeEvent) {
        this.nodeEvent = nodeEvent;
    }

}
