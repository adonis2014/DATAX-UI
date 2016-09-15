<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>正在运行的任务列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="正在运行的任务列表" pageTitleContent="作业管理-正在运行的任务列表" titleIcon="icon-home"/>
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="icon-globe"></i>正在运行的任务列表
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a><a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body">
							<table class="table table-striped table-bordered table-hover" id="sample_1">
								<table class="table table-striped table-bordered table-hover" id="workers" width="100%">
											<thead>
												<tr>
													<th>名称</th>
													<th>类名</th>
													<th>方法</th>
													<th>参数</th>
													<th>作业启动时间的cron表达式</th>
													<th>下次执行时间</th>
													<th>启用标记</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${workers}" var="worker">
												<tr>
													<td>${worker.name}</td>
													<td>${worker.jobClassName}</td>
													<td>${worker.methodName}</td>
													<td>${worker.jobParameter}</td>
													<td>${worker.cron}</td>
													<td>${worker.nextExeDate}</td>
													<td><mytags:dictSelect field="checkLabel" codeType="17" defaultVal="${worker.checkLabel}" type="label" hasLabel="false"/> </td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(document).ready(function() {
	App.activeMenu("job/RunningExecutions/list");
});
</script>
</body>
</html>