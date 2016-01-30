<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看索引对象'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
<%@ include file="/WEB-INF/content/meta/DataSource/selDataSource.jsp" %>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="元数据管理-索引管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>索引信息
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
											<label class="control-label" >数据表:</label>
											<div class="controls">
												<span class="text">${obj.dbtable.tablePname}</span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >索引库名:</label>
											<div class="controls">
												<span class="text">${obj.index_name}</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >索引表名:</label>
											<div class="controls">
												<span class="text">${obj.type_name}</span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >索引类别:</label>
											<div class="controls">
												<span class="text"><mytags:dictSelect field="indexType" id="indexType" type="label" defaultVal="${obj.indexType}" hasLabel="false" codeType="13" /></span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
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
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >更新者:</label>
											<div class="controls">
												<span class="text">${updater.name}</span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >更新时间:</label>
											<div class="controls">
												<span class="text">${obj.updateDate }</span>
											</div>
										</div>
									</div>
								</div>
								</c:if>
							</form>
						</div>
					</div>
					
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
									<th>备注</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${obj.columns}" var="column">
									<tr>
										<td>${column.fieldCode}</td>
										<td>${column.columnName}</td>
										<td>${column.columnPname}</td>
										<td>${column.familyName}</td>
										<td>${column.type}</td>
										<td>${column.store}</td>
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
			App.activeMenu("meta/DBIndex/list");
		});
		
	</script>
</body>
</html>