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
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="内容管理-表单管理-${pageTitle }" titleIcon="icon-home" />
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
							<form action="${ctx}/meta/DBTable/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id">
								<input type="hidden" value="${obj.datasource.id}" name="datasource.id" id="datasourceId"/>
								<div class="control-group">
									<label class="control-label">数据源:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" id="datasource" name="datasource.dbName" value="${obj.datasource.dbName }" readonly="readonly" onfocus="showDatasource()" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">类名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="className" value="${obj.className }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">表名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="tableName" value="${obj.tableName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">逻辑名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="tablePname" value="${obj.tablePname }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">表类别:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="tableType" value="${obj.tableType }" />
									</div>
								</div>
								<c:if test="${not empty obj}">
								<div class="control-group">
									<label class="control-label">建立者:</label>
									<div class="controls">
										${obj.creater.name}
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">更新者:</label>
									<div class="controls">
										${obj.updater.name}
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">建立时间:</label>
									<div class="controls">
										${obj.createDate }
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">更新时间:</label>
									<div class="controls">
										${obj.updateDate }
									</div>
								</div>
								</c:if>
								<div class="control-group">
									<label class="control-label">备注:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="remark" value="${obj.remark }" />
									</div>
								</div>
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