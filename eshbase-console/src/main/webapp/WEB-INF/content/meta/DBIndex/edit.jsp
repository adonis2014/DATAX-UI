<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加索引对象':'修改索引对象' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
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
			App.activeMenu("meta/DBIndex/list");
		});
		
	</script>
</body>
</html>