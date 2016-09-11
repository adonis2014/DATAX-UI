<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>调度服务器监控</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="调度服务器监控" pageTitleContent="调度服务器监控" titleIcon="icon-home"/>
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="icon-globe"></i>运行终端
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a><a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body" style="overflow:auto;">
							<table class="table table-striped table-bordered table-hover" id="machines" >
								<thead>
									<tr>
										<th nowrap="nowrap">UUID</th>
										<th nowrap="nowrap">IP</th>
										<th nowrap="nowrap">机器名称</th>
										<th nowrap="nowrap">服务开始时间</th>
										<th nowrap="nowrap">最后一次心跳通知时间</th>
										<th nowrap="nowrap">最后一次取数据时间</th>
										<th nowrap="nowrap">处理描述信息</th>
										<th nowrap="nowrap">当前时间</th>
										<th nowrap="nowrap">版本号</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${servers}" var="server">
									<tr>
										<td nowrap="nowrap"><a href="${ctx}/job/Machine/showByUUID/${server.uuid}">${server.uuid}</a></td>
										<td nowrap="nowrap">${server.ip}</td>
										<td nowrap="nowrap">${server.hostName}</td>
										<td nowrap="nowrap">${server.registerTime}</td>
										<td nowrap="nowrap">${server.heartBeatTime}</td>
										<td nowrap="nowrap">${server.lastFetchDataTime}</td>
										<td nowrap="nowrap">${server.dealInfoDesc}</td>
										<td nowrap="nowrap">${server.centerServerTime}</td>
										<td nowrap="nowrap">${server.version}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="icon-globe"></i>运行中任务
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a><a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body" style="overflow:auto;">
							<table class="table table-striped table-bordered table-hover" id="taskdefines" >
								<thead>
									<tr>
									<th nowrap="nowrap">操作</th>
										<th nowrap="nowrap">调度ID</th>
										<th nowrap="nowrap">目标bean</th>
										<th nowrap="nowrap">目标方法</th>
										<th nowrap="nowrap">参数</th>
										<th nowrap="nowrap">cron表达式</th>
										<th nowrap="nowrap">开始时间</th>
										<th nowrap="nowrap">周期（秒）</th>
										<th nowrap="nowrap">type</th>
										<th nowrap="nowrap">运行次数</th>
										<th nowrap="nowrap">最后运行时间</th>
										<th nowrap="nowrap">运行终端</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${tasks}" var="task">
									<tr>
										<td nowrap="nowrap"><a href="${ctx}/job/JobMonitor/delete?del=${task.targetBean}_${task.targetMethod}_${task.params}">删除</a></td>
										<td nowrap="nowrap"><a href="${ctx}/job/JobWorker/show/${task.workerId}">${task.workerId}</a></td>
										<td nowrap="nowrap">${task.targetBean}</td>
										<td nowrap="nowrap">${task.targetMethod}</td>
										<td nowrap="nowrap">${task.params}</td>
										<td nowrap="nowrap">${task.cronExpression}</td>
										<td nowrap="nowrap">${task.startTime}</td>
										<td nowrap="nowrap">${task.period}</td>
										<td nowrap="nowrap">${task.type}</td>
										<td nowrap="nowrap">${task.runTimes}</td>
										<td nowrap="nowrap">${task.lastRunningTime}</td>
										<td nowrap="nowrap"><a href="${ctx}/job/Machine/showByUUID/${task.currentServer}">${task.currentServer}</a></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	
	App.activeMenu("job/JobMonitor/list");
});
</script>
</body>
</html>