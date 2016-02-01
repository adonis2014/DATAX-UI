<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加作业执行定义':'修改作业执行定义' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-{functionName}管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>请填写表单
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/job/JobWorker/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id">
								<div class="control-group">
									<label class="control-label">名称:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="name" value="${obj.name }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">作业类ID:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="jobClassId" value="${obj.jobClassId }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">逻辑名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="logicName" value="${obj.logicName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">作业类名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="jobClassName" value="${obj.jobClassName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">作业分片总数:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="shardingTotalCount" value="${obj.shardingTotalCount }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">作业启动时间的cron表达式:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="cron" value="${obj.cron }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">分片序列号和个性化参数对照表:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="shardingItemParameters" value="${obj.shardingItemParameters }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">作业自定义参数:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="jobParameter" value="${obj.jobParameter }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">监控作业执行时状态:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="monitorExecution" value="${obj.monitorExecution }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">统计作业处理数据数量的间隔时间:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="processCountInterval" value="${obj.processCountInterval }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">处理数据的并发线程数:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="dataProcessThread" value="${obj.dataProcessThread }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">每次抓取的数据量:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="fetchDataCount" value="${obj.fetchDataCount }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">最大容忍的本机与注册中心的时间误差秒数:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="maxtimeDiff" value="${obj.maxtimeDiff }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">是否开启失效转移:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="failover" value="${obj.failover }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">是否开启misfire:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="misfire" value="${obj.misfire }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">作业分片策略实现类全路径:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="shardingStrategyClass" value="${obj.shardingStrategyClass }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">作业是否禁止启动:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="disabled" value="${obj.disabled }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">本地配置是否可覆盖注册中心配置:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="overwrite" value="${obj.overwrite }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">建立者:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="createbyId" value="${obj.createbyId }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">更新者:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="updatebyId" value="${obj.updatebyId }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">建立时间:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="createDate" value="${obj.createDate }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">更新时间:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="updateDate" value="${obj.updateDate }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">启用标记:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="checkLabel" value="${obj.checkLabel }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">备注:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="remark" value="${obj.remark }" />
									</div>
								</div>


								<div class="form-actions">
									<button type="submit" class="btn blue">提交</button>
									<a class='btn' href="${header.Referer }">返回</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("job/JobWorker/list");
		});
	</script>
</body>
</html>