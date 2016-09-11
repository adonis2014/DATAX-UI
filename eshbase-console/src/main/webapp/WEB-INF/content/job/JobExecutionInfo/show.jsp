<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看作业任务日志'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-作业日志管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>${pageTitle }
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/job/JobExecutionInfo/show" class="form-horizontal form_sync" method="post" id="form1">
							<table class="dbform" width="100%">
								<tr>
									<th class="fieldtitle">ID:</th>
									<td class="fieldvalue">${obj.id}</td>
									<th class="fieldtitle">执行结果:</th>
									<td class="fieldvalue">${obj.exeResult}</td>
								</tr>
								<tr>
									<th class="fieldtitle">注册中心:</th>
									<td class="fieldvalue"><a href="${obj.regId}">${obj.regCenter.name}</a></td>
									<th class="fieldtitle">执行终端:</th>
									<td class="fieldvalue"><a href="${obj.machineId}">${obj.machine.machineName}</a></td>
								</tr>
								<tr>
									<th class="fieldtitle">调度作业:</th>
									<td class="fieldvalue"><a href="${obj.workerId}">${obj.worker.name}</a></td>
									<th class="fieldtitle">执行类:</th>
									<td class="fieldvalue"><a href="${obj.worker.jobclass.id}">${obj.worker.jobClassName}</a></td>
								</tr>
								<tr>
									<th class="fieldtitle">执行方法:</th>
									<td class="fieldvalue">${obj.worker.methodName}</td>
									<th class="fieldtitle">调度作业:</th>
									<td class="fieldvalue">${obj.worker.jobParameter}</td>
								</tr>
								<tr>
									<th class="fieldtitle">分片项:</th>
									<td class="fieldvalue">${obj.item}</td>
									<th class="fieldtitle">下次触发时间:</th>
									<td class="fieldvalue">${obj.nextFireTime}</td>
								</tr>
								<tr>
									<th class="fieldtitle">启动时间:</th>
									<td class="fieldvalue">${obj.lastBeginTime}</td>
									<th class="fieldtitle">完成时间:</th>
									<td class="fieldvalue">${obj.lastCompleteTime}</td>
								</tr>
								<tr>
									<th class="fieldtitle">日志:</th>
									<td class="fieldvalue" colspan="3">${obj.log}</td>
								</tr>
							</table>
								<div class="form-actions">
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
			App.activeMenu("job/JobExecutionInfo/list");
		});
	</script>
</body>
</html>