<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>作业执行定义列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="作业执行定义列表" pageTitleContent="作业管理-作业执行定义管理-作业执行定义列表" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="icon-globe"></i>列表
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a><a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="row-fluid">
								<form class="queryForm span8">
									<div class="row-fluid">
										<div class="span7 ">
											<div class="control-group">
												<div class="controls">
													<input type="text" id="filters" class="m-wrap span12"
														placeholder="名称,作业类ID,逻辑名,作业类名,作业分片总数,作业启动时间的cron表达式,分片序列号和个性化参数对照表,作业自定义参数,监控作业执行时状态,统计作业处理数据数量的间隔时间,处理数据的并发线程数,每次抓取的数据量,最大容忍的本机与注册中心的时间误差秒数,是否开启失效转移,是否开启misfire,作业分片策略实现类全路径,作业是否禁止启动,本地配置是否可覆盖注册中心配置,备注">
												</div>
											</div>
										</div>
										<div class="span5 ">
											<div class="control-group">
												<div class="controls">
													<a class="btn blue" href="javascript:void(0)" onclick="javascript:doQuery();"> <i class="icon-search"></i> 查询
													</a>
													<button type="reset" class="btn" onclick="javascript:Page.clearQuery();">
														<i class="icon-trash"></i>清空
													</button>
												</div>
											</div>
										</div>
									</div>
								</form>
								<tool:operBtns modelKey="jobworker"  modelName="job"></tool:operBtns>
							</div>
							<table class="table table-striped table-bordered table-hover" id="sample_1">

							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {

			App.activeMenu("job/JobWorker/list");

			Page.initData({
				url : "${ctx}/job/JobWorker/page",
				pageNo : 1,
				pageSize : 10,
				tableId : "#sample_1"
			}, null, [ {
				cName : "name",
				cValue : "名称"
			},


			{
				cName : "logicName",
				cValue : "逻辑名"
			},

			{
				cName : "shardingTotalCount",
				cValue : "作业分片总数"
			},

			{
				cName : "cron",
				cValue : "作业启动时间的cron表达式"
			},
			{
				cName : "monitorExecution",
				cValue : "监控作业执行时状态"
			},

			{
				cName : "checkLabel",
				cValue : "启用标记"
			} ]);
		});

		function doQuery() {
			var queryObj = {
				search_LIKES_name_OR_jobClassId_OR_logicName_OR_jobClassName_OR_shardingTotalCount_OR_cron_OR_shardingItemParameters_OR_jobParameter_OR_monitorExecution_OR_processCountInterval_OR_dataProcessThread_OR_fetchDataCount_OR_maxtimeDiff_OR_failover_OR_misfire_OR_shardingStrategyClass_OR_disabled_OR_overwrite_OR_checkLabel_OR_remark : App
						.isEqPlacehoder($("#filters"))
			};
			Page.doQuery(queryObj);
		}
	</script>
</body>
</html>