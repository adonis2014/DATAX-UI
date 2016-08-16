<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'设置数据源参数'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="数据源管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>${pageTitle }
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<div class="form-horizontal form-view">
								<h3 class="form-section">${pageTitle }<a class='btn purple pull-right' href="${header.Referer }">返回</a></h3>
								<form action="${ctx}/meta/DataSource/saveSetup" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id" /> 
								<table width="100%" class="dbform">
									<tbody>
									<tr>
										<th class="fieldtitle">schema:</th>
										<td class="fieldvalue">${obj.schemaName}</td>
										<th class="fieldtitle">名称:</th>
										<td class="fieldvalue">${obj.dsName}</td>
									</tr>
									<tr>
										<th class="fieldtitle">类别:</th>
										<td class="fieldvalue">elasticsearch</td>
										<th class="fieldtitle">备注:</th>
										<td class="fieldvalue">${obj.remark}</td>
									</tr>
									<tr>
										<th class="fieldtitle">建立者:</th>
										<td class="fieldvalue">${obj.creater.name}</td>
										<th class="fieldtitle">建立时间:</th>
										<td class="fieldvalue"><fmt:formatDate value="${obj.createDate}" type="both" pattern="yyyy-MM-dd"/>  </td>
									</tr>
									<tr>
										<th class="fieldtitle">更新者:</th>
										<td class="fieldvalue">${obj.updater.name}</td>
										<th class="fieldtitle">更新时间:</th>
										<td class="fieldvalue"><fmt:formatDate value="${obj.updateDate}" type="both" pattern="yyyy-MM-dd"/></td>
									</tr>
								<c:forEach items="${obj.properties}"  var="metaPro" varStatus="status">
									<c:if test="${empty currGroup or metaPro.group!=currGroup}">
									<tr>
										<td colspan="4" class="info-title">${metaPro.groupName}
										<c:set var="currGroup" value="${metaPro.group}" ></c:set>
										<c:set var="id" value="0" ></c:set>
										</td>
									</tr>
									<tr>
									</c:if>
									<c:set var="id" value="${id+1}" ></c:set>
										<th  class="fieldtitle">${metaPro.remark}:</th>
										<td class="fieldvalue"><input type="text" class="span12"  name="${metaPro.propertyKey}_value" value="${metaPro.propertyValue}" />
										<input type="hidden" value="${metaPro.propertyKey}" name="paramKey" /> 
											<input type="hidden" value="${metaPro.id}" name="${metaPro.propertyKey}_id" />
											<input type="hidden" value="${metaPro.remark}" name="${metaPro.propertyKey}_remark" /> 
											<input type="hidden" name="${metaPro.propertyKey}_group" value="${metaPro.group}" />
											<input type="hidden" name="${metaPro.propertyKey}_groupName" value="${metaPro.groupName}" />
											<input type="hidden" name="${metaPro.propertyKey}_sortId" value="${metaPro.sortId}" />
											</td>
									<c:if test="${id % 2 == 0}"></tr>
									<tr></c:if>
								</c:forEach>
										</tbody>
								</table>
								
								<br/>
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
	$(function(){
		App.activeMenu("meta/DataSource/list");
	});
	
</script>
</body>
</html>