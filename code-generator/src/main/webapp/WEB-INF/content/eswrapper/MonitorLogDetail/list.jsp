<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>监控记录明细列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="监控记录明细列表" pageTitleContent="内容管理-监控记录明细管理-监控记录明细列表" titleIcon="icon-home"/>
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="icon-globe"></i>列表
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a><a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="row-fluid">
								<form class="queryForm span8">
									<div class="row-fluid">
	                                 	<div class="span7 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="集群名,接点,成功次数,成功TPS,失败次数,失败Tps,线程池最小值,线程池平均值,线程池最大值,logId">
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span5 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                         <a class="btn blue" href="javascript:void(0)" onclick="javascript:doQuery();">
		                                         	<i class="icon-search"></i>
		                                         	查询</a>
		                                         <button type="reset" class="btn" onclick="javascript:Page.clearQuery();">
		                                         	<i class="icon-trash"></i>清空
		                                         </button>
		                                       </div>
		                                    </div>
	                                 	</div>
									</div>
								</form>
								<tool:operBtns modelKey="role"></tool:operBtns>
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
	
	App.activeMenu("eswrapper/monitorLogDetail/list");
	
	Page.initData(
		{
			url:"${ctx}/eswrapper/monitorLogDetail/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"clusterName",cValue:"集群名"},

			 	{cName:"node",cValue:"接点"},

			 	{cName:"successCount",cValue:"成功次数"},

			 	{cName:"successTps",cValue:"成功TPS"},

			 	{cName:"failureCount",cValue:"失败次数"},

			 	{cName:"failureTps",cValue:"失败Tps"},

			 	{cName:"concurrentMin",cValue:"线程池最小值"},

			 	{cName:"concurrentAve",cValue:"线程池平均值"},

			 	{cName:"concurrentMax",cValue:"线程池最大值"},

			  	{cName:"logId",cValue:"logId"}
		 ]
	);
});

function doQuery(){
	var queryObj = {
			search_LIKES_clusterName_OR_node_OR_successCount_OR_successTps_OR_failureCount_OR_failureTps_OR_concurrentMin_OR_concurrentAve_OR_concurrentMax_OR_logId : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>