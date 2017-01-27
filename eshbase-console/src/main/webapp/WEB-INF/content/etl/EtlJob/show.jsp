<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'ETL调度作业设置详细信息'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<%@ include file="/WEB-INF/content/etl/EtlPlugin/selPlugin.jsp"%>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="ETL管理-调度作业管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>ETL调度作业设置详细信息
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
										<td class="fieldvalue">${obj.jobName }</td>
										<td class="fieldtitle">ETL类型:</td>
										<td class="fieldvalue"><mytags:dictSelect field="etlType" id="etlType" type="label" hasLabel="false" defaultVal="${obj.etlType}" codeType="1034" /></td>
									</tr>
									<c:if test="${not empty obj}">
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
									<tr>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue" colspan="3">${obj.remark }</td>
									</tr>

								</table>

							</form>
						</div>
						<c:if test="${not empty obj}">
							<div class="portlet-title">
								<h4>
									<i class="icon-reorder"></i>执行任务
								</h4>
								<div class="tools"></div>
							</div>
							<div class="portlet-body form">
								<table width="100%" class="dbgrid">
									<thead>
										<tr>
											<th></th>
											<th></th>
											<th></th>
											<th>数据集</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${obj.tasks}" var="task">
										<tr>
											<td class="fieldtitle">任务名</td>
											<td class="fieldvalue">${task.taskName}</td>
											<td class="fieldtitle">备注</td>
											<td class="fieldvalue">${task.remark}</td>
										</tr>
										<tr>
											<td class="fieldtitle">插件</td>
											<td class="fieldvalue">${task.plugin.pluginName}</td>
											<td class="fieldtitle">插件类别</td>
											<td class="fieldvalue"><mytags:dictSelect field="pluginType" id="pluginType" type="label" hasLabel="false" codeType="1031" defaultVal="${task.plugin.pluginType}" /></td>
										</tr>
										<tr>
											<td colspan="4">插件参数<table width="100%" class="dbform">
														<tr>
															<c:forEach items="${task.taskParams}" var="taskParam" varStatus="status">
																<td class="fieldtitle">${taskParam.remark}[${taskParam.paramKey}]</td>
																<td class="fieldvalue">${taskParam.paramValue}</td>
																<c:if test="${status.index%2==1}">
														</tr>
														<tr>
															</c:if>
															</c:forEach>
														</tr>
													</table></td>
										</tr>
											<tr>
												<td colspan="4">数据集：${task.dataset.datasetName}
												<table width="100%" class="dbform">
									<tr>
										<td class="fieldtitle">数据库说明:</td>
										<td class="fieldvalue">${task.dataset.database.remark}</td>
										<td class="fieldtitle">数据库名:</td>
										<td class="fieldvalue"><a href="${ctx}/meta/Database/show/${task.dataset.database.id}">${task.dataset.database.dbname}</a></td>
									</tr>
									<tr>
										<td class="fieldtitle">数据集:</td>
										<td class="fieldvalue">${task.dataset.datasetName }</td>
										<td class="fieldtitle">逻辑名:</td>
										<td class="fieldvalue">${task.dataset.datasetPname}</td>
									</tr>
								<c:if test="${not empty task.dataset}">
									<tr>
										<td class="fieldtitle">建立者:</td>
										<td class="fieldvalue">${task.dataset.creater.name}</td>
										<td class="fieldtitle">更新者:</td>
										<td class="fieldvalue">${task.dataset.updater.name}</td>
									</tr>
									<tr>
										<td class="fieldtitle">建立时间:</td>
										<td class="fieldvalue">${task.dataset.createDate }</td>
										<td class="fieldtitle">更新时间:</td>
										<td class="fieldvalue">${task.dataset.updateDate }</td>
									</tr>
									<tr>
										<td class="fieldtitle">类名:</td>
										<td class="fieldvalue">${task.dataset.className}</td>
										<td class="fieldtitle">启用标记:</td>
										<td class="fieldvalue">
										<mytags:dictSelect field="checkLabel" type="label" id="checkLabel" defaultVal="${task.dataset.checkLabel}" hasLabel="false" codeType="17" />
										</td>
									</tr>
								</c:if>
								<tr>
									<td class="fieldtitle">数据集类别:</td>
									<td class="fieldvalue"><mytags:dictSelect field="tableType" type="label" id="tableType" defaultVal="${task.dataset.datasetType}" hasLabel="false" codeType="12" /></td>
									<td class="fieldtitle">备注:</td>
									<td class="fieldvalue" >${task.dataset.remark}</td>
								</tr>
								</table>
								<table class="table table-striped table-bordered table-hover" id="sample_2">
								<thead>
									<tr>
										<th>字段编码</th>
										<th>字段名</th>
										<th>逻辑名</th>
										<th>字段类别</th>
										<th>是否必须</th>
										<th>备注</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="column" items="${task.dataset.columns}">
									<tr>
										<td><a href='${ctx}/meta/DBColumn/show/${column.id}' >${column.fieldCode}</a></td>
										<td>${column.columnName}</td>
										<td>${column.columnPname}</td>
										<td>${column.type}</td>
										<td>${column.required}</td>
										<td>${table.remark}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</td>
											</tr>
											
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:if>
						<c:if test="${not empty obj.columnPairs}">
							<div class="portlet-title">
								<h4>
									<i class="icon-reorder"></i>字段映射关系列表
								</h4>
								<div class="tools"></div>
							</div>
							<div class="portlet-body form">
								<table width="100%" class="dbgrid">
									<thead>
										<tr>
											<th nowrap="nowrap">读入列</th>
											<th nowrap="nowrap">写入列</th>
											<th nowrap="nowrap">来源类别</th>
											<th nowrap="nowrap">处理类别</th>
											<th nowrap="nowrap">函数</th>
											<th nowrap="nowrap">脚本</th>
											<th nowrap="nowrap">脚本类别</th>
											<th nowrap="nowrap">自定义类</th>
											<th nowrap="nowrap">字段排序值</th>
											<th nowrap="nowrap">备注</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${obj.columnPairs}" var="taskColumn">
											<tr>
												<td nowrap="nowrap">${taskColumn.readColumnName}</td>
												<td nowrap="nowrap">${taskColumn.writeColumnName}</td>
												<td nowrap="nowrap"><mytags:dictSelect field="readerFieldType" codeType="1053" hasLabel="false" hasPSel="false" styleText="width:120px;"
														defaultVal="${taskColumn.readerFieldType}" type="label" /></td>
												<td nowrap="nowrap"><mytags:dictSelect field="writerFieldType" codeType="1054" hasLabel="false" hasPSel="false" styleText="width:120px;"
														defaultVal="${taskColumn.writerFieldType}" type="label" /></td>
												<td nowrap="nowrap"><mytags:dictSelect field="functionName" codeType="1067" hasLabel="false" hasPSel="true" styleText="width:120px;"
														defaultVal="${taskColumn.functionName}" type="label" /></td>
												
												<td nowrap="nowrap">${taskColumn.script}</td>
												<td nowrap="nowrap"><mytags:dictSelect field="scriptType" codeType="1063" hasLabel="false" hasPSel="false" styleText="width:120px;"
														defaultVal="${taskColumn.scriptType}" type="label" /></td>
												<td nowrap="nowrap">${taskColumn.class_name}</td>
												<td nowrap="nowrap">${taskColumn.sortId}</td>
												<td nowrap="nowrap">${taskColumn.remark}</td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("etl/EtlJob/list");
		});
	</script>
</body>
</html>
