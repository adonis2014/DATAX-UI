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
							<form action="${ctx}/job/JobWorker/edit" class="form-horizontal form_sync" method="post" name="form1" id="form1">
								<input type="hidden" value="${obj.id}" name="id">
								<input type="hidden" value="1" name="start">
								<table class="dbform" width="100%">
									<tr>
										<td class="fieldtitle">名称:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="name" value="${obj.name }" /></td>
										<td class="fieldtitle">作业类ID:</td>
										<td class="fieldvalue">${obj.jobclass.id }</td>
									</tr>
									<tr>
										<td class="fieldtitle">逻辑名:</td>
										<td class="fieldvalue">${obj.logicName }</td>
										<td class="fieldtitle">作业类名:</td>
										<td class="fieldvalue">${obj.jobClassName}</td>
									</tr>
									<tr>
										<td class="fieldtitle">作业分片总数:</td>
										<td class="fieldvalue">${obj.shardingTotalCount }</td>
										<td class="fieldtitle">作业启动时间的cron表达式:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="cron" value="${obj.cron }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">分片序列号和个性化参数对照表:</td>
										<td class="fieldvalue">${obj.shardingItemParameters }</td>
										<td class="fieldtitle">作业自定义参数:</td>
										<td class="fieldvalue"><input type="text"   name="jobParameter" value="${obj.jobParameter }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">监控作业执行时状态:</td>
										<td class="fieldvalue">${obj.monitorExecution }</td>
										<td class="fieldtitle">统计作业处理数据数量的间隔时间:</td>
										<td class="fieldvalue">${obj.processCountInterval }</td>
									</tr>
									<tr>
										<td class="fieldtitle">处理数据的并发线程数:</td>
										<td class="fieldvalue">${obj.dataProcessThread }</td>
										<td class="fieldtitle">每次抓取的数据量:</td>
										<td class="fieldvalue">${obj.fetchDataCount}</td>
									</tr>
									<tr>
										<td class="fieldtitle">最大容忍的本机与注册中心的时间误差秒数:</td>
										<td class="fieldvalue">${obj.maxtimeDiff }</td>
										<td class="fieldtitle">是否开启失效转移:</td>
										<td class="fieldvalue">${obj.failover }</td>
									</tr>
									<tr>
										<td class="fieldtitle">是否开启misfire:</td>
										<td class="fieldvalue">${obj.misfire }</td>
										<td class="fieldtitle">作业分片策略实现类全路径:</td>
										<td class="fieldvalue">${obj.shardingStrategyClass }</td>
									</tr>
									<tr>
										<td class="fieldtitle">作业是否禁止启动:</td>
										<td class="fieldvalue">${obj.disabled }</td>
										<td class="fieldtitle">本地配置是否可覆盖注册中心配置:</td>
										<td class="fieldvalue">${obj.overwrite }</td>
									</tr>
								<c:if test="${not empty obj}">
									<tr>
										<td class="fieldtitle">建立者:</td>
										<td class="fieldvalue">${obj.creater.name}</td>
										<td class="fieldtitle">更新者:</label>
										<td class="fieldvalue">${obj.updater.name}</td>
									</tr>
									<tr>
										<td class="fieldtitle">建立时间:</td>
										<td class="fieldvalue">${obj.createDate }</td>
										<td class="fieldtitle">更新时间:</td>
										<td class="fieldvalue">${obj.updateDate}</td>
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
									<a class='btn' href="javascript:commitWork();">启用</a>
									<a class='btn' href="javascript:saveWork();">保存</a>
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
		function commitWork(){
			form1.start.value="1";
			form1.submit();
		}
		function saveWork(){
			form1.start.value="0";
			form1.submit();
		}
	</script>
</body>
</html>