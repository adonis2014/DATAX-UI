<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加ETL任务':'修改ETL任务' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
<%@ include file="/WEB-INF/content/etl/EtlPlugin/selPlugin.jsp" %>
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
								<input type="hidden" value="${obj.id}" name="id"/>
								<input type="hidden" value="${obj.job.id}" name="job.id" id="jobId"/>
								<input type="hidden" value="${obj.plugin.id}" name="plugin.id" id="pluginId"/>
								<table class="dbform" width="100%">
									<tr>
										<td class="fieldtitle">任务名:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="taskName" value="${obj.taskName }" /></td>
										<td class="fieldtitle">调度工作:</td>
										<td class="fieldvalue">${obj.job.jobName}</td>
									</tr>
									<tr>
										<td class="fieldtitle">插件:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" id="pluginName" name="plugin.pluginName" value="${obj.plugin.pluginName}"  onfocus="showPlugins()" /></td>
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
										<td class="fieldvalue">${obj.updateDate }</td>
									</tr>
									</c:if>
									<c:if test="${empty obj}"></tr></c:if>
									<tr>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue" colspan="3"><input type="text"   name="remark" value="${obj.remark }" /></td>
									</tr>
									<tr>
										<td colspan="4" style="text-align:center;" class="fieldvalue">
										<button type="submit" class="btn blue">提交</button>
									<a class='btn' href="${header.Referer }">返回</a>
										</td>
									</tr>
								</table>
							</form>
						</div>
						<c:if test="${not empty obj}">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>参数
							</h4>
							<div class="tools"></div>
						</div>
						<form action="${ctx}/etl/EtlTask/editParams" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id">
								<input type="hidden" value="1" name="isEdit">
						<div class="portlet-body form">
							<table width="100%" class="dbgrid">
									<thead>
										<tr>
											<th>插件参数ID</th>
											<th>参数Key</th>
											<th>参数值</th>
											<th>备注</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${obj.taskParams}" var="tparam">
									<tr>
										<td>${tparam.pluginParamId}</td>
										<td>${tparam.paramKey}</td>
										<td><input type="text" name="paramValue_${tparam.paramKey}" value="${tparam.paramValue}"/></td>
										<td>${tparam.remark}</td>
									</tr>
									</c:forEach>
									<tr>
										<td colspan="4" style="text-align:center;" class="fieldvalue">
										<button type="button" onclick="generateParams(${obj.id});" class="btn blue">自动生成</button>
										<button type="submit" class="btn blue">提交</button>
										<a class='btn' href="${header.Referer }">返回</a></td>
									</tr>
									</tbody>
								</table>
						</div>
						</form>
						</c:if>
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
	function generateParams(taskId){
		self.location.href="${ctx}/etl/EtlTask/generateParams/"+taskId;
	}
	function showPlugins() {
		$("#pluginList").modal();
	}
	function selPlugin(obj) {
			var flag = Page.selectsPrompt();
			if (!flag)
				return;
			var obj = $("#sample_1").find("td :checkbox:checked");
			$('input[id=pluginName]').val(obj.first().attr("data-text"));
			$('input[id=pluginId]').val(flag);
			$('#pluginList').modal('hide');
	}
	
</script>
</body>
</html>
