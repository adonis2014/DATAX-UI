<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看注册中心'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-注册中心管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>注册中心
							</h4>
							<div class="tools">
								<a href="${header.Referer }" class="collapse"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/job/RegCenter/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id">
								<table width="100%"  class="dbform">
									<tbody>
									<tr>
										<td class="fieldtitle" >名称:</td>
										<td class="fieldvalue">${obj.name}</td>
										<td class="fieldtitle" >ZK列表:</td>
										<td class="fieldvalue">${obj.zkQuorumPeer }</td>
									</tr>
									<tr>
										<td class="fieldtitle">命名空间:</td>
										<td class="fieldvalue">${obj.nameSpace}</td>
										<td class="fieldtitle">待重试间隔时间:</td>
										<td class="fieldvalue">${obj.baseSleepTime }</td>
									</tr>
									<tr>
										<td class="fieldtitle">待重试间隔时间最大值:</td>
										<td class="fieldvalue">${obj.maxSleepTime}</td>
										<td class="fieldtitle">最大重试次数:</td>
										<td class="fieldvalue">${obj.maxRetries }</td>
									</tr>
									<tr>
										<td class="fieldtitle">登录凭证:</td>
										<td class="fieldvalue">${obj.loginCert}</td>
										<td class="fieldtitle">启用标记:</td>
										<td class="fieldvalue"><mytags:dictSelect field="checkLabelMap" id="checkLabelMap" type="label" hasLabel="false" codeType="17" defaultVal="${obj.checkLabel }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">建立者:</td>
										<td class="fieldvalue">${obj.creater.name}</td>
										<td class="fieldtitle">更新者:</td>
										<td class="fieldvalue">${obj.updater.name }</td>
									</tr>
									<tr>
										<td class="fieldtitle">建立时间:</td>
										<td class="fieldvalue">${obj.createDate}</td>
										<td class="fieldtitle">更新时间:</td>
										<td class="fieldvalue">${obj.updateDate }</td>
									</tr>
									<tr>
										<td class="fieldtitle">备注:</td>
										<td colspan="3" class="fieldvalue">${obj.remark}</td>
									</tr>
									</tbody>
								</table>
								</div>
								<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>终端作业运行情况
							</h4>
							<div class="tools">
								
							</div>
						</div>
						<div class="portlet-body form">
								<table width="100%" class="dbgrid">
									<thead>
										<tr>
											<th>作业终端</th>
											<th>作业执行</th>
											<th>注册中心</th>
											<th>状态</th>
											<th>启用标记</th>
											<th>备注</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${taskDefines}" var="taskDefine">
									<tr>
										<td>${taskDefine.machine.machineName}[${taskDefine.machine.address}]</td>
										<td>${taskDefine.worker.name}</td>
										<td>${taskDefine.regCenter.name}</td>
										<td>${taskDefine.status}</td>
									    <td><mytags:dictSelect field="checkLabelMap" id="checkLabelMap" type="label" hasLabel="false" codeType="17" defaultVal="${taskDefine.checkLabel}"/></td>
										<td>${taskDefine.remark}</td>
									</tr>
									</c:forEach>
									</tbody>
								</table>
								</div>
								<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>运行终端
							</h4>
							<div class="tools">
								
							</div>
						</div>
						<div class="portlet-body form">
								<table width="100%"  class="dbgrid">
									<thead>
										<tr>
											<th>终端名</th>
											<th>终端地址</th>
											<th>机器名</th>
											<th>ssh端口</th>
											<th>登录名</th>
											<th>登录密码</th>
											<th>工作路径</th>
											<th>启用标记</th>
											<th>备注</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${machines}" var="machine">
									<tr>
										<td>${machine.machineName}</td>
										<td>${machine.address}</td>
										<td>${machine.hostName}</td>
										<td>${machine.sshPort}</td>
										<td>${machine.loginName}</td>
										<td>${machine.loginPassword}</td>
										<td>${machine.userDir}</td>
										<td><mytags:dictSelect field="checkLabelMap" id="checkLabelMap" type="label" hasLabel="false" codeType="17" defaultVal="${machine.checkLabel}"/></td>
										<td>${machine.remark}</td>
									</tr>
									</c:forEach>
									</tbody>
								</table>
								</div>
								<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>运行作业
							</h4>
							<div class="tools">
								
							</div>
						</div>
						<div class="portlet-body form">
								<table width="100%"  class="dbgrid">
									<thead>
										<tr>
											<th>名称</th>
											<th>逻辑名</th>
											<th>作业分片总数</th>
											<th>作业启动时间的cron表达式</th>
											<th>监控作业执行时状态</th>
											<th>启用标记</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${workers}" var="worker">
									<tr>
										<td>${worker.name}</td>
										<td>${worker.logicName}</td>
										<td>${worker.shardingTotalCount}</td>
										<td>${worker.cron}</td>
										<td>${worker.monitorExecution}</td>
										<td><mytags:dictSelect field="checkLabelMap" id="checkLabelMap" type="label" hasLabel="false" codeType="17" defaultVal="${worker.checkLabel}"/></td>
									</tr>
									</c:forEach>
									</tbody>
								</table>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("job/RegCenter/list");
		});
	</script>
</body>
</html>