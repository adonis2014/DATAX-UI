<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加索引对象':'修改索引对象' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<%@ include file="/WEB-INF/content/meta/DBTable/selTable.jsp"%>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="元素据管理-索引管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder">请填写表单</i>
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/meta/DBIndex/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id"> 
								<input type="hidden" value="${obj.dbtable.id}" name="dbtable.id" id="tableId"/>
								<div class="control-group">
									<label class="control-label">数据表:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" id="dbtable" name="dbtable.tablePname" value="${obj.dbtable.tablePname}" readonly="readonly" onfocus="showTable()" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">索引库名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="index_name" value="${obj.index_name }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">索引表名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="type_name" value="${obj.type_name }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">索引类别:</label>
									<div class="controls">
										<mytags:dictSelect field="indexType" id="indexType" defaultVal="${obj.indexType}" hasLabel="false" codeType="13" />
									</div>
								</div>
								<c:if test="${not empty obj}">
								<div class="control-group">
									<label class="control-label">建立者:</label>
									<div class="controls">
										${creater.name}
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">更新者:</label>
									<div class="controls">
										${updater.name}
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
			App.activeMenu("meta/dBIndex/list");
		});
		function showTable() {
			$("#tableList").modal();
		}
		function selTable(obj) {
			var flag = Page.selectsPrompt();
			if (!flag)
				return;

			var obj = $("#sample_1").find("td :checkbox:checked");
			$('input[id=dbtable]').val(obj.first().attr("data-text"));
			$('input[id=tableId]').val(flag);
			$('#tableList').modal('hide');
		}
	</script>
</body>
</html>