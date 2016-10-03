<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加表对象':'修改表对象' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
<%@ include file="/WEB-INF/content/meta/DataSource/selDataSource.jsp" %>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="元数据管理-表单管理-${pageTitle }" titleIcon="icon-home" />
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
							<form action="${ctx}/meta/Dataset/saveTable" class="form-horizontal form_sync" method="post" id="form1">
							<input type="hidden" value="${obj.id}" name="id">
							<table width="100%" class="dbform">
									<tr>
										<td class="fieldtitle">数据库说明:</td>
										<td class="fieldvalue">${obj.database.remark}</td>
										<td class="fieldtitle">数据库名:</td>
										<td class="fieldvalue"><a href="${ctx}/meta/Database/show/${obj.database.id}">${obj.database.dbname}</a></td>
									</tr>
									<tr>
										<td class="fieldtitle">表名:</td>
										<td class="fieldvalue">${obj.datasetName }</td>
										<td class="fieldtitle">逻辑名:</td>
										<td class="fieldvalue"><input type="text" class="span6 m-wrap" validate="{required:true}" name="datasetPname" value="${obj.datasetPname}" /></td>
									</tr>
								<c:if test="${not empty obj}">
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
									<tr>
										<td class="fieldtitle">类名:</td>
										<td class="fieldvalue">${obj.className}</td>
										<td class="fieldtitle">启用标记:</td>
										<td class="fieldvalue">
										<mytags:dictSelect field="checkLabel" type="label" id="checkLabel" defaultVal="${obj.checkLabel}" hasLabel="false" codeType="17" />
										</td>
									</tr>
								</c:if>
								<tr>
									<td class="fieldtitle">表类别:</td>
									<td class="fieldvalue"><mytags:dictSelect field="datasetType" id="datasetType" defaultVal="${obj.datasetType}" hasLabel="false" codeType="12" /></td>
									<td class="fieldtitle">备注:</td>
									<td class="fieldvalue" ><input type="text" class="span12 m-wrap" name="remark" value="${obj.remark}"/></td>
								</tr>
								</table>
								<c:if test="${not empty obj.columns }">
									<br />
									<div class="row-fluid">
										<table width="100%" class="dbgrid">
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
												<c:forEach var="column" items="${obj.columns}">
													<tr>
														<td><a href='${ctx}/meta/DBColumn/show/${column.id}' >${column.fieldCode}</a></td>
														<td>${column.columnName}</td>
														<td><input type="text"  name="columnPname_${column.id}" value="${column.columnPname}"/></td>
														<td>${column.type}</td>
														<td>${column.required}</td>
														<td><input type="text"  name="remark_${column.id}" value="${table.remark}"/></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</c:if>
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
			App.activeMenu("meta/Dataset/list");
		});
		
		function showDatasource() {
			$("#datasourceList").modal();
		}
		function selDataSource(obj) {
			var flag = Page.selectsPrompt();
			if (!flag)
				return;

			var obj = $("#sample_1").find("td :checkbox:checked");
			$('input[id=datasource]').val(obj.first().attr("data-text"));
			$('input[id=datasourceId]').val(flag);
			$('#datasourceList').modal('hide');
		}
	</script>
</body>
</html>