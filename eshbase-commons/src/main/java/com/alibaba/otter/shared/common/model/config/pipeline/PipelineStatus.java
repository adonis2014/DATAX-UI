package com.alibaba.otter.shared.common.model.config.pipeline;

public enum PipelineStatus {
    /** 运行中 */
    START,
    /** 暂停(临时停止) */
    PAUSE,
    /** 停止(长时停止) */
    STOP;

    public boolean isStart() {
        return this.equals(PipelineStatus.START);
    }

    public boolean isPause() {
        return this.equals(PipelineStatus.PAUSE);
    }

    public boolean isStop() {
        return this.equals(PipelineStatus.STOP);
    }
}
