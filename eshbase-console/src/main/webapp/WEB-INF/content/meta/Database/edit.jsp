<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加数据库定义':'修改数据库定义' }" scope="page" />
<html>
<head>
<title>${pageTitle}</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="元数据管理-数据库管理-${pageTitle }" titleIcon="icon-home" />
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
							<form action="${ctx}/meta/Database/saveDatabase" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id">
								<table width="100%" class="dbform">
									<tr>
										<td class="fieldtitle">schema名称:</td>
										<td class="fieldvalue">${obj.schemaName }</td>
										<td class="fieldtitle">数据库名:</td>
										<td class="fieldvalue">${obj.dbname }</td>
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
										<td class="fieldtitle">数据源:</td>
										<td class="fieldvalue">${obj.datasource.dsName}</td>
										<td class="fieldtitle">启用标记:</td>
										<td class="fieldvalue">
										<mytags:dictSelect field="checkLabel" type="label" id="checkLabel" defaultVal="${obj.checkLabel}" hasLabel="false" codeType="17" />
										</td>
									</tr>
								</c:if>
								<tr>
									<td class="fieldtitle">备注:</td>
									<td class="fieldvalue" colspan="3"><input type="text" class="span12 m-wrap" name="remark" value="${obj.remark}"/></td>
								</tr>
								</table>
<c:if test="${not empty obj.tables }">
									<br />
									<div class="row-fluid">
										<table width="100%" class="dbgrid">
											<thead>
												<tr>
													<th>表名</th>
													<th>逻辑名</th>
													<th>更新时间</th>
													<th>备注</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="table" items="${obj.tables}">
													<tr>
														<td><a href='${ctx}/meta/DBTable/show/${table.id}' >${table.tableName}</a></td>
														<td><input type="text"  name="tablePname_${table.id}" value="${table.tablePname}"/></td>
														<td><fmt:formatDate value="${table.updateDate}"  pattern="yyyy-MM-dd HH:mm"/> </td>
														<td><input type="text"  name="remark_${table.id}" value="${table.remark}"/></td>
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
			App.activeMenu("meta/Database/list");
		});
	</script>
</body>
</html>