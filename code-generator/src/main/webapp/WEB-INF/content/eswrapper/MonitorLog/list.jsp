<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>资源监控记录列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="资源监控记录列表" pageTitleContent="内容管理-资源监控记录管理-资源监控记录列表" titleIcon="icon-home"/>
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
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="记录时间,状态">
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
	
	App.activeMenu("eswrapper/monitorLog/list");
	
	Page.initData(
		{
			url:"${ctx}/eswrapper/monitorLog/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"logTime",cValue:"记录时间"},

			  	{cName:"checkLabel",cValue:"状态"}
		 ]
	);
});

function doQuery(){
	var queryObj = {
			search_LIKES_logTime_OR_checkLabel : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>