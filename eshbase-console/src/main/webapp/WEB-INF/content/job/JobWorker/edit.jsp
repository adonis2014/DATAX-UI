<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加作业执行定义':'修改作业执行定义' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-作业执行注册-${pageTitle }" titleIcon="icon-home" />
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
							<form action="${ctx}/job/JobWorker/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id">
								<table class="dbform" width="100%">
									<tr>
										<td class="fieldtitle">名称:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="name" value="${obj.name }" /></td>
										<td class="fieldtitle">作业类ID:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="jobClassId" value="${obj.jobClassId }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">逻辑名:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="logicName" value="${obj.logicName }" /></td>
										<td class="fieldtitle">作业类名:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="jobClassName" value="${obj.jobClassName }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">作业分片总数:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="shardingTotalCount" value="${obj.shardingTotalCount }" /></td>
										<td class="fieldtitle">作业启动时间的cron表达式:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="cron" value="${obj.cron }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">分片序列号和个性化参数对照表:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="shardingItemParameters" value="${obj.shardingItemParameters }" /></td>
										<td class="fieldtitle">作业自定义参数:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="jobParameter" value="${obj.jobParameter }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">监控作业执行时状态:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="monitorExecution" value="${obj.monitorExecution }" /></td>
										<td class="fieldtitle">统计作业处理数据数量的间隔时间:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="processCountInterval" value="${obj.processCountInterval }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">处理数据的并发线程数:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="dataProcessThread" value="${obj.dataProcessThread }" /></td>
										<td class="fieldtitle">每次抓取的数据量:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="fetchDataCount" value="${obj.fetchDataCount }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">最大容忍的本机与注册中心的时间误差秒数:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="maxtimeDiff" value="${obj.maxtimeDiff }" /></td>
										<td class="fieldtitle">是否开启失效转移:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="failover" value="${obj.failover }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">是否开启misfire:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="misfire" value="${obj.misfire }" /></td>
										<td class="fieldtitle">作业分片策略实现类全路径:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="shardingStrategyClass" value="${obj.shardingStrategyClass }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">作业是否禁止启动:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="disabled" value="${obj.disabled }" /></td>
										<td class="fieldtitle">本地配置是否可覆盖注册中心配置:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="overwrite" value="${obj.overwrite }" /></td>
									</tr>
								<c:if test="${not empty obj}">
									<tr>
										<td class="fieldtitle">建立者:</td>
										<td class="fieldvalue"><input type="text"  name="t" readonly="readonly" value="${obj.creater.name}" /></td>
										<td class="fieldtitle">更新者:</label>
										<td class="fieldvalue"><input type="text"  name="t" readonly="readonly" value="${obj.updater.name}" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">建立时间:</td>
										<td class="fieldvalue"><input type="text"  name="t" readonly="readonly" value="${obj.createDate }" /></td>
										<td class="fieldtitle">更新时间:</td>
										<td class="fieldvalue"><input type="text"  name="t" readonly="readonly" value="${obj.updateDate}" /></td>
									</tr>
									
								</c:if>
								<tr>
										<td class="fieldtitle">启用标记:</td>
										<td class="fieldvalue" ><mytags:dictSelect field="checkLabelMap" id="checkLabelMap" type="label" hasLabel="false" codeType="17" defaultVal="${obj.checkLabel }" /></td>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue" ><input type="text"  validate="{required:true}" name="remark" value="${obj.remark }" /></td>
								</tr>
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
			App.activeMenu("job/JobWorker/list");
		});
	</script>
</body>
</html>