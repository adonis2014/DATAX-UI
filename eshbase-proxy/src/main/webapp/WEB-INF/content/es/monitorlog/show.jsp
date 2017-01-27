<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'队列监控数据详细信息'}" scope="page" />
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
								<i class="icon-reorder"></i>队列监控数据详细信息
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<div class="form-horizontal form-view">
								<h3 class="form-section">队列监控数据详细信息<a class='btn purple pull-right' href="${header.Referer }">返回</a></h3>
								<table width="100%" class="dbform">
									<tbody>
									<tr>
										<th>记录时间:</th>
										<td >${obj.logTime}</td>
										<th>状态:</th>
										<td><c:if test="${obj.checkLabel==1}">正常</c:if> <c:if test="${obj.checkLabel!=1}">异常</c:if></td>
									</tr>
									<c:forEach items="${obj.logDetails}" var="logDetail">
									<c:if test="${empty logDetail.clusterName and empty logDetail.node}">
									<tr>
										<th>成功次数:</th>
										<td >${logDetail.successCount}</td>
										<th>成功TPS:</th>
										<td>${logDetail.successTps}</td>
									</tr>
									<tr>
										<th>失败次数:</th>
										<td >${logDetail.failureCount}</td>
										<th>失败TPS:</th>
										<td>${logDetail.failureTps}</td>
									</tr>
									<tr>
										<th>线程最大值:</th>
										<td>${logDetail.concurrentMax}</td>
										<th>线程最小值:</th>
										<td>${logDetail.concurrentMin}</td>
									</tr>
									<tr>
										<th>线程平均值:</th>
										<td colspan="3">${logDetail.concurrentAve}</td>
									</tr>
									</c:if>
									</c:forEach>
									</tbody>
								</table>
								<h3 class="form-section">集群信息</h3>
								<c:forEach items="${obj.logDetails}" var="logDetail">
									<c:if test="${not empty logDetail.clusterName and empty logDetail.node}">
								<table  width="100%" class="dbform" >
									<tbody>
									<tr>
										<th>集群名:</th>
										<td  colspan="5">${logDetail.clusterName}</td>
									</tr>
									<tr>
										<th>成功次数:</th>
										<td >${logDetail.successCount}</td>
										<th>成功TPS:</th>
										<td colspan="3">${logDetail.successTps}</td>
									</tr>
									<tr>
										<th>失败次数:</th>
										<td >${logDetail.failureCount}</td>
										<th>失败TPS:</th>
										<td colspan="3">${logDetail.failureTps}</td>
									</tr>
									<tr>
										<th style="width:10%;">线程最大值:</th>
										<td style="width:23%;">${logDetail.concurrentMax}</td>
										<th style="width:10%;">线程最小值:</th>
										<td style="width:23%;">${logDetail.concurrentMin}</td>
										<th style="width:10%;">线程平均值:</th>
										<td style="width:23%;">${logDetail.concurrentAve}</td>
									</tr>
									<tr>
										<th>耗时最大值:</th>
										<td>${logDetail.concurrentMax}</td>
										<th>耗时最小值:</th>
										<td>${logDetail.concurrentMin}</td>
										<th>耗时平均值:</th>
										<td>${logDetail.concurrentAve}</td>
									</tr>
									<tr>
										<th>写入线程最大值:</th>
										<td>${logDetail.writepoolMax}</td>
										<th>写入线程最小值:</th>
										<td>${logDetail.writepoolMin}</td>
										<th>写入线程平均值:</th>
										<td>${logDetail.writepoolAve}</td>
									</tr>
									<tr>
										<th>写入队列最大值:</th>
										<td>${logDetail.writequeueMax}</td>
										<th>写入队列最小值:</th>
										<td>${logDetail.writequeueMin}</td>
										<th>写入队列平均值:</th>
										<td>${logDetail.writequeueAve}</td>
									</tr>
									<tr>
										<th>读取线程最大值:</th>
										<td>${logDetail.searchpoolMax}</td>
										<th>读取线程最小值:</th>
										<td>${logDetail.searchpoolMin}</td>
										<th>读取线程平均值:</th>
										<td>${logDetail.searchpoolAve}</td>
									</tr>
									<tr>
										<th>读取队列最大值:</th>
										<td>${logDetail.searchqueueMax}</td>
										<th>读取队列最小值:</th>
										<td>${logDetail.searchqueueMin}</td>
										<th>读取队列平均值:</th>
										<td>${logDetail.searchqueueAve}</td>
									</tr>
									<tr>
										<td colspan="6">
											<table >
												<thead>
													<th>节点</th>
													<th>成功次数:</th>
													<th>成功TPS:</th>
													<th>失败次数:</th>
													<th>失败TPS:</th>
													<th>线程最大值:</th>
													<th>线程最小值:</th>
													<th>线程平均值:</th>
													<th>耗时最大值:</th>
													<th>耗时最小值:</th>
													<th>耗时平均值:</th>
												</thead>
												<c:forEach items="${obj.logDetails}" var="logNode">
												<c:if test="${logNode.clusterName==logDetail.clusterName and not empty logNode.node }">
												<tbody>
													<tr>
													<td>${logNode.node}</td>
													<td >${logNode.successCount}</td>
													<td >${logNode.successTps}</td>
													<td >${logNode.failureCount}</td>
													<td >${logNode.failureTps}</td>
													<td >${logNode.concurrentMax}</td>
													<td >${logNode.concurrentMin}</td>
													<td >${logNode.concurrentAve}</td>
													<td>${logNode.concurrentMax}</td>
													<td>${logNode.concurrentMin}</td>
													<td>${logNode.concurrentAve}</td>
													</tr>
												</c:if>
												</c:forEach>
												</tbody>
											</table>
										</td>
									</tr>
									</tbody>
								</table>
								</c:if>
									</c:forEach>
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