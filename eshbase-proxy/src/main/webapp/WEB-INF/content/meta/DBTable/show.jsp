<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看表对象'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
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
								<i class="icon-reorder"></i>表单设置信息
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/meta/DBTable/edit" class="form-horizontal form_sync" method="post" id="form1">
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >数据库:</label>
											<div class="controls">
												<span class="text">${obj.database.dbname}</span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >类名:</label>
											<div class="controls">
												<span class="text">${obj.className}</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >表名:</label>
											<div class="controls">
												<span class="text">${obj.tableName}</span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >逻辑名:</label>
											<div class="controls">
												<span class="text">${obj.tablePname}</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >表类别:</label>
											<div class="controls">
												<span class="text"><mytags:dictSelect field="tableType" id="tableType" type="label" defaultVal="${obj.tableType}" hasLabel="false" codeType="12" /></span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >备注:</label>
											<div class="controls">
												<span class="text">${obj.remark}</span>
											</div>
										</div>
									</div>
								</div>
								
								<c:if test="${not empty obj}">
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >建立者:</label>
											<div class="controls">
												<span class="text">${creater.name}</span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >建立时间:</label>
											<div class="controls">
												<span class="text">${obj.createDate }</span>
											</div>
										</div>
									</div>
								</div>
								
								</c:if>
							</form>
						</div>
					</div>
					<c:if test="${not empty obj.dbIndexs}">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>索引
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<table class="table table-striped table-bordered table-hover" id="sample_1">
								<thead>
									<tr>
									<th>索引库名</th>
									<th>索引名</th>
									<th>索引类别</th>
									<th>建立时间</th>
									<th>更新时间</th>
									<th>备注</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${obj.dbIndexs}" var="dbindex">
									<tr>
										<td>${dbindex.index_name}</td>
										<td>${dbindex.type_name}</td>
										<td>${dbindex.indexType}</td>
										<td>${dbindex.createDate}</td>
										<td>${dbindex.updateDate}</td>
										<td>${dbindex.remark}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					</c:if>
					<c:if test="${not empty obj.columns}">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>字段
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<table class="table table-striped table-bordered table-hover" id="sample_1">
								<thead>
									<tr>
									<th>字段属性编码</th>
									<th>字段名</th>
									<th>逻辑名</th>
									<th>字段类别</th>
									<th>是否存储</th>
									<th>格式</th>
									<th>备注</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${obj.columns}" var="dbcolumn">
									<tr>
										<td>${dbcolumn.fieldCode}</td>
										<td>${dbcolumn.familyName}&nbsp; ${dbcolumn.columnName}</td>
										<td>${dbcolumn.columnPname}</td>
										<td>${dbcolumn.type}</td>
										<td>${dbcolumn.store}</td>
										<td>${dbcolumn.format}</td>
										<td>${dbcolumn.remark}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("meta/DBTable/list");
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