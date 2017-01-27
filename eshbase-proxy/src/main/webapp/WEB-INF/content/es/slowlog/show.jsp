<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看es日志'}" scope="page" />
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
								<i class="icon-reorder"></i>es日志详细信息
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<div class="form-horizontal form-view">
								<h3 class="form-section">es日志信息<a class='btn purple pull-right' href="${header.Referer }">返回</a></h3>
								<table width="100%" class="dbform">
									<tbody>
									<tr>
										<th>集群:</th>
										<td>${obj.clusterName}</td>
										<th>记录时间:</th>
										<td><fmt:formatDate value="${obj.log_time}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									</tr>
									<tr>
										<th>来源IP:</th>
										<td>${obj.sourceIp }</td>
										<th>来源机器名:</th>
										<td>${obj.hostname}</td>
									</tr>
									<tr>
										<th>端口:</th>
										<td>${obj.port}</td>
										<th>方法:</th>
										<td>${obj.method}</td>
									</tr>
									<tr>
										<th>访问开始时间:</th>
										<td><fmt:formatDate value="${obj.start_time}" type="both" pattern="yyyy-MM-dd HH:mm:ss.sss"/></td>
										<th>耗时:</th>
										<td>${obj.elapsed}</td>
									</tr>
									<tr>
										<th>请求结果:</th>
										<td colspan="3"><c:if test="${obj.status==1}">成功</c:if> <c:if test="${obj.status!=1}">失败</c:if></td>
									</tr>
									<tr>
										<th>访问URL:</th>
										<td colspan="3">${obj.url}</td>
									</tr>
									<tr>
										<th>请求数据:</th>
										<td colspan="3">${obj.requestData}</td>
									</tr>
									<tr>
										<th>响应数据:</th>
										<td colspan="3">${obj.response}</td>
									</tr>
									</tbody>
								</table>
								
								<br/>
								
								
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
<script type="text/javascript">
	$(function(){
		App.activeMenu("esSlowlog/list");
	});
	
</script>
</body>
</html>