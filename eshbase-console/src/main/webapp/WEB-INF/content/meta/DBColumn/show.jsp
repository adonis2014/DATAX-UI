<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看字段(属性)对象'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="元数据管理-字段管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>${pageTitle }
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<div class="control-group">
								<table width="100%" class="dbform">
									<tr>
										<td class="fieldtitle">表对象:</td>
										<td class="fieldvalue">${obj.dbtable.tableName}</td>
										<td class="fieldtitle">字段属性编码:</td>
										<td class="fieldvalue">${obj.fieldCode }</td>
									</tr>
									<tr>
										<td class="fieldtitle">字段名:</td>
										<td class="fieldvalue">${obj.columnName }</td>
										<td class="fieldtitle">逻辑名:</td>
										<td class="fieldvalue">${obj.columnPname }</td>
									</tr>
									<tr>
										<td class="fieldtitle">字段类别:</td>
										<td class="fieldvalue">${obj.type }</td>
										<td class="fieldtitle">是否存储:</td>
										<td class="fieldvalue">${obj.store }</td>
									</tr>
									<tr>
										<td class="fieldtitle">es doc类型:</td>
										<td class="fieldvalue">${obj.doc_values }</td>
										<td class="fieldtitle">是否索引:</td>
										<td class="fieldvalue">${obj.index }</td>
									</tr>
									<tr>
										<td class="fieldtitle">是否必须:</td>
										<td class="fieldvalue">${obj.required }</td>
										<td class="fieldtitle">格式:</td>
										<td class="fieldvalue">${obj.format }</td>
									</tr>
									<tr>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue" colspan="3">${obj.remark }</td>
									</tr>
								</table>
								<div class="form-actions">
									<a class='btn' href="${header.Referer }">返回</a>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
<script type="text/javascript">
	$(function(){
		App.activeMenu("meta/DBTable/list");
	});
</script>
</body>
</html>