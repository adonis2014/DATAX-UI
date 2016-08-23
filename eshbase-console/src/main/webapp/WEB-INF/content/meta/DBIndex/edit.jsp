<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加索引对象':'修改索引对象' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
<%@ include file="/WEB-INF/content/meta/DBTable/selTable.jsp" %>
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
								<table width="100%" class="dbform">
									<tr>
										<td class="fieldtitle">索引库名:</td>
										<td class="fieldvalue"><input type="text" class="span6 m-wrap" validate="{required:true}" name="index_name" value="${obj.index_name }" /></td>
										<td class="fieldtitle">索引表名:</td>
										<td class="fieldvalue">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="type_name" value="${obj.type_name }" />
										</td>
									</tr>
									<tr>
										<td class="fieldtitle">索引类别:</td>
										<td class="fieldvalue"><mytags:dictSelect field="indexType" id="indexType" defaultVal="${obj.indexType}" hasLabel="false" codeType="13" /></td>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue"><input type="text" class="span6 m-wrap" name="remark" value="${obj.remark }" /></td>
									</tr>
									<c:if test="${not empty obj}">
									<tr>
											<th class="fieldtitle">建立者:</th><td class="fieldvalue">${obj.creater.name}</td>
											<th class="fieldtitle">更新者:</th><td class="fieldvalue">${obj.updater.name}</td>
									</tr>
									<tr>
											<th class="fieldtitle">建立时间:</th>
											<td class="fieldvalue">${obj.createDate }</td>
											<th class="fieldtitle">更新时间:</th>
											<td class="fieldvalue">${obj.updateDate }</td>
									</tr>
									</c:if>
								</table>
								<div class="form-actions">
									<button type="submit" class="btn blue">提交</button>
									<button type="button" class="btn yellow" onclick="javascript:showTree();">添加表单</button>
									<a class='btn' href="${header.Referer }">返回</a>
								</div>
								<div class="portlet-body">
								<table width="100%" class="dbgrid">
									<thead>
										<tr>
											<th>数据源</th>
											<th>表名</th>
											<th>逻辑名</th>
											<th>建立者</th>
											<th>最后更新者</th>
											<th>最后更新时间</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${obj.tables}" var="table">
										<tr>
											<td><a href="${ctx}/meta/Database/show/${table.database.id}">${table.database.dbname}</a></td>
											<td><a href='${ctx}/meta/DBTable/show/${table.id}' >${table.tableName}</a></td>
											<td>${table.tablePname}</td>
											<td>${table.creater.name}</td>
											<td>${table.updater.name}</td>
											<td>${table.updateDate}</td>
											<td><a href='${ctx}/meta/DBIndex/removeIndexTable/${obj.id}/${table.id}'>删除</a></td>
										</tr>
									</c:forEach>
									</tbody>
							</table>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
	<%@ include file="/WEB-INF/content/common/plugins/bootstrap-tree.jsp"%>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("meta/DBIndex/list");
		});
		function showTree(){
			$("#metaDBTree").modal();
		}
		
		function selTable(){
			$obj = $("#tree_1").find("a.selected:first");
			$('#metaDBTree').modal('hide');
			window.location.href="${ctx}/meta/DBIndex/addIndexTable/${obj.id}/"+$obj.attr("data-id");
		}
	</script>
</body>
</html>