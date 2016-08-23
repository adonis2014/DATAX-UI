<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加模块对象':'修改模块对象' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
<%@ include file="/WEB-INF/content/meta/Project/selProject.jsp" %>
<%@ include file="/WEB-INF/content/meta/DBTable/selTable.jsp" %>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="元数据管理-模块管理-${pageTitle }" titleIcon="icon-home" />
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
							<form action="${ctx}/meta/Module/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id"/>
								<input type="hidden" value="${obj.project.id}" name="project.id" id="projectId"/>
								<table width="100%" class="dbform">
									<tr>
										<td class="fieldtitle">项目:</td>
										<td class="fieldvalue"><input type="text" class="span8 m-wrap" validate="{required:true}" name="projectname" id="project"  readonly="readonly" onfocus="showProjects()" value="${obj.project.projectName}" /></td>
										<td class="fieldtitle">数据源:</td>
										<td class="fieldvalue">
										<select name="datasource.id">
											<c:forEach items="${datasources}" var="ds">
											<option value="${ds.id}">${ds.dsName}</option>
											</c:forEach>
										</select>
										</td>
									</tr>
									<tr>
										<td class="fieldtitle">模块编码:</td>
										<td class="fieldvalue"><input type="text" class="span8 m-wrap" validate="{required:true}" name="moduleCode" value="${obj.moduleCode }" /></td>
										<td class="fieldtitle">模块名:</td>
										<td class="fieldvalue"><input type="text" class="span8 m-wrap" validate="{required:true}" name="moduleName" value="${obj.moduleName }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">包名:</td>
										<td class="fieldvalue"><input type="text" class="span8 m-wrap" validate="{required:true}" name="packageName" value="${obj.packageName }" /></td>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue"><input type="text" class="span8 m-wrap" name="remark" value="${obj.remark }" /></td>
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
									<button type="button" class="btn blue" onclick="javascript:showTree();">添加表单</button>
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
											<td><a href='${ctx}/meta/Module/removeModuleTable/${obj.id}/${table.id}'>删除</a></td>
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
			App.activeMenu("meta/Module/list");
		});
		function showTree(){
			$("#metaDBTree").modal();
		}
		
		function selTable(){
			$obj = $("#tree_1").find("a.selected:first");
			$('#metaDBTree').modal('hide');
			window.location.href="${ctx}/meta/Module/addModuleTable/${obj.id}/"+$obj.attr("data-id");
			//$('#parentName').val($obj.text());
			//$('#parentId').val($obj.attr("data-id"));
		}
		
		function showProjects() {
			$("#projectList").modal();
		}
		function selProject() {
			var flag = Page.selectsPrompt();
			if (!flag)return;
			var obj = $("#projects").find("td :checkbox:checked");
			$('input[id=project]').val(obj.first().attr("data-text"));
			$('input[id=projectId]').val(flag);
			$('#projectList').modal('hide');
		}
		function showDatasources(){
			$("#datasourceList").modal();
		}
		function selDataSource(obj) {
			var flag = Page.selectsPrompt();
			if (!flag)return;
			var obj = $("#datasources").find("td :checkbox:checked");
			$('input[id=datasource]').val(obj.first().attr("data-text"));
			$('input[id=datasourceId]').val(flag);
			$('#datasourceList').modal('hide');
		}
	</script>
</body>
</html>