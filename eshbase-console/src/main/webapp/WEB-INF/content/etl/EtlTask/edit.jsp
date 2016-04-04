<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加ETL任务':'修改ETL任务' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"

				pageTitleContent="ETL管理-任务管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>请填写表单
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/etl/EtlTask/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id">
								<table class="dbform" width="100%">
									<tr>
										<td class="fieldtitle">任务名:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="taskName" value="${obj.taskName }" /></td>
										<td class="fieldtitle">调度工作:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="jobId" value="${obj.job.jobName}" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">插件:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="pluginId" value="${obj.plugin.pluginName}" /></td>
										<c:if test="${not empty obj}">
										<td class="fieldtitle">启用标记:</td>
										<td class="fieldvalue"><mytags:dictSelect field="checkLabel" id="checkLabel" type="label" hasLabel="false" defaultVal="${obj.checkLabel}" codeType="17" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">建立者:</td>
										<td class="fieldvalue">${obj.creater.name}</td>
										<td class="fieldtitle">更新者:</td>
										<td class="fieldvalue">${obj.updater.name}</td>
									</tr>
									<tr>
										<td class="fieldtitle">建立时间:</td>
										<td class="fieldvalue">${obj.createDate }</td>
										<td class="fieldtitle">更新时间:</td>
										<td class="fieldvalue">"${obj.updateDate }</td>
									</tr>
									</c:if>
									<c:if test="${empty obj}"></tr></c:if>
									<tr>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue" colspan="3"><input type="text"  validate="{required:true}" name="remark" value="${obj.remark }" /></td>
									</tr>
									<tr>
										<td colspan="4" align="center">
										<button type="submit" class="btn blue">提交</button>
									<a class='btn' href="${header.Referer }">返回</a>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
<script type="text/javascript">
	$(function(){
		App.activeMenu("etl/EtlTask/list");
	});
</script>
</body>
</html>
