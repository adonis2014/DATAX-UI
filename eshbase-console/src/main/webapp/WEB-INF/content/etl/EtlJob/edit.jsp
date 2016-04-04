<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加ETL调度作业':'修改ETL调度作业' }" scope="page" />
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
				pageTitleContent="ETL管理-调度管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>请填写表单
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> 
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/etl/EtlJob/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id">
								<table class="dbform" width="100%">
									<tr>
										<td class="fieldtitle">调度作业名:</td>
										<td class="fieldvalue"><input type="text" validate="{required:true}" name="jobName" value="${obj.jobName }" /></td>
										<td class="fieldtitle">ETL类型:</td>
										<td class="fieldvalue"><mytags:dictSelect field="etlType" id="etlType" type="select" hasLabel="false" defaultVal="${obj.etlType}" codeType="1034" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">调度设置:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="cronTrigger" value="${obj.cronTrigger }" /></td>
										<c:if test="${not empty obj}">
										<td class="fieldtitle">下次执行时间:</td>
										<td class="fieldvalue">${obj.nextExeDate}</td>
									</tr>
									<tr>
										<td class="fieldtitle">状态:</td>
										<td class="fieldvalue"><mytags:dictSelect field="status" id="status" type="label" hasLabel="false" defaultVal="${obj.status}" codeType="1003" /></td>
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
									<td class="fieldvalue" colspan="3"><input type="text"  validate="{required:true}" name="remark" value="${obj.remark }" /></td>
								</tr>
									<tr>	
										<td style="text-align:center;" colspan="4">
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
								<i class="icon-reorder"></i>执行任务
							</h4>
							<div class="tools">
							</div>
						</div>
						<form action="${ctx}/etl/EtlTask/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="job.id">
								<input type="hidden" value="1" name="isEdit">
						<div class="portlet-body form">
							<table width="100%" class="dbgrid">
									<thead>
										<tr>
											<th>任务名</th>
											<th>插件</th>
											<th>插件类别</th>
											<th>备注</th>
											<th>操作 </th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${obj.tasks}" var="task">
									<tr>
										<td>${task.taskName}</td>
										<td>${task.plugin.pluginName}</td>
										<td><mytags:dictSelect field="pluginType" id="pluginType" type="label" hasLabel="false" codeType="1031" defaultVal="${task.plugin.pluginType}"/></td>
										<td>${task.remark}</td>
										<td><button type="button" class="btn blue" onclick="javascript:delTask(${task.id});">删除</button>&nbsp;<button type="button"  onclick="javascript:setupTask(${task.id});" class="btn blue">设置</button></td>
									</tr>
									</c:forEach>
									<tr>
									<input type="hidden" value="" name="plugin.id" id="pluginId"/>
										<td><input type="text" style="width:95%;"  validate="{required:true}" name="taskName"/></td>
										<td><input type="text" style="width:95%;" id="plugin"  validate="{required:true}" name="plugin.pluginName"  readonly="readonly" onfocus="showPlugins()" /></td>
										<td><span id="pluginType"></span></td>
										<td><input type="text"  style="width:95%;" validate="{required:true}" name="remark"/></td>
										<td><button type="submit" class="btn blue">添加</button></td>
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
		App.activeMenu("etl/EtlJob/list");
	});
	function setupTask(taskId){
		
	}
	function delTask(taskId){
		self.location.href="${ctx}/etl/EtlTask/delete/"+taskId+"?isEdit=true";
	}
	function showPlugins() {
		$("#pluginList").modal();
	}
	function selPlugin(obj) {
			var flag = Page.selectsPrompt();
			if (!flag)
				return;

			var obj = $("#sample_1").find("td :checkbox:checked");
			alert(obj.first().attr("data-type"));
			$('input[id=plugin]').val(obj.first().attr("data-text"));
			$('input[id=pluginId]').val(flag);
			
			$('input[id=pluginType]').val(obj.first().attr("data-type"));
			
			$('#pluginList').modal('hide');
	}
</script>
</body>
</html>
