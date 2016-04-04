<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>数据字段转换定义列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="数据字段转换定义列表" pageTitleContent="内容管理-数据字段转换定义管理-数据字段转换定义列表" titleIcon="icon-home"/>
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
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="数据源定义ID,字段ID,列族名,列名,原数据类别,字段类别,字段数据处理函数,关键字字段数据处理函数,字段处理脚本,脚本类别,自定义类名,字段排序值,备注">
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
	
	App.activeMenu("etl/taskColumn/list");
	
	Page.initData(
		{
			url:"${ctx}/etl/taskColumn/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"dsDefineId",cValue:"数据源定义ID"},

			 	{cName:"columnIdx",cValue:"字段ID"},

			 	{cName:"familyName",cValue:"列族名"},

			 	{cName:"column_name",cValue:"列名"},

			 	{cName:"fieldSourceType",cValue:"原数据类别"},

			 	{cName:"fieldType",cValue:"字段类别"},

			 	{cName:"functionName	",cValue:"字段数据处理函数"},

			 	{cName:"pkFunctionName",cValue:"关键字字段数据处理函数"},

			 	{cName:"script",cValue:"字段处理脚本"},

			 	{cName:"script_type",cValue:"脚本类别"},

			 	{cName:"class_name",cValue:"自定义类名"},

			 	{cName:"sort_id",cValue:"字段排序值"},

			  	{cName:"remark",cValue:"备注"}
		 ]
	);
});

function doQuery(){
	var queryObj = {
			search_LIKES_dsDefineId_OR_columnIdx_OR_familyName_OR_column_name_OR_fieldSourceType_OR_fieldType_OR_functionName	_OR_pkFunctionName_OR_script_OR_script_type_OR_class_name_OR_sort_id_OR_remark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>