<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="查看数据库定义" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="元数据管理-{functionName}管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>数据库详细信息
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<div class="form-horizontal form-view">
								<h3 class="form-section">
									数据库定义<a class='btn purple pull-right' href="${header.Referer }">返回</a>
								</h3>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">数据库名:</label>
											<div class="controls">${obj.dbname }</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">schema名:</label>
											<div class="controls">${obj.schemaName}</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">建立者:</label>
											<div class="controls">
												<span class="text">${obj.creater.name}</span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">建立时间:</label>
											<div class="controls">
												<span class="text">${obj.createDate }</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">更新者:</label>
											<div class="controls">
												<span class="text">${obj.updater.name}</span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">更新时间:</label>
											<div class="controls">
												<span class="text">${obj.updateDate }</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">启用标记:</label>
											<div class="controls">
												<span class="text">${obj.checkLabel }</span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">备注:</label>
											<div class="controls">
												<span class="text">${obj.remark }</span>
											</div>
										</div>
									</div>
								</div>
<div class="row-fluid">
	<table width="100%" class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>表名</th>
				<th>逻辑名</th>
				<th>表类别</th>
				<th>更新时间</th>
				<th>建立时间</th>
				<th>备注</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="table" items="${obj.tables}">
			<tr>
				<td><a href='${ctx}/meta/DBTable/show/${table.id}' >${table.tableName}</a></td>
				<td><a href='${ctx}/meta/DBTable/show/${table.id}' >${table.tablePname}</a></td>
				<td>${table.tableType}</td>
				<td>${table.updateDate}</td>
				<td>${table.createDate}</td>
				<td>${table.remark}</td>
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
		</div>
		<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
		<script type="text/javascript">
			$(function() {
				App.activeMenu("meta/DBTable/list");
			});
		</script>
</body>
</html>