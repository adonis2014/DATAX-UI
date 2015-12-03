<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>数据源对象列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="数据源对象列表" pageTitleContent="内容管理-数据源对象管理-数据源对象列表" titleIcon="icon-home"/>
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
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="项目ID,jdbc driver classname,jdbc登录密码,jdbc连接url,数据库类别,jdbc用户,schema名称,db名称,建立者,更新者,建立世间,更新世间,备注">
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
	
	App.activeMenu("meta/dataSource/list");
	
	Page.initData(
		{
			url:"${ctx}/meta/dataSource/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"project",cValue:"项目ID"},

			 	{cName:"driverCLassName",cValue:"jdbc driver classname"},

			 	{cName:"jdbcPassword",cValue:"jdbc登录密码"},

			 	{cName:"jdbcUrl",cValue:"jdbc连接url"},

			 	{cName:"dbType",cValue:"数据库类别"},

			 	{cName:"jdbcUser",cValue:"jdbc用户"},

			 	{cName:"schemaName",cValue:"schema名称"},

			 	{cName:"dbName",cValue:"db名称"},

			 	{cName:"createbyId",cValue:"建立者"},

			 	{cName:"updatebyId",cValue:"更新者"},

			 	{cName:"createDate",cValue:"建立世间"},

			 	{cName:"updateDate",cValue:"更新世间"},

			  	{cName:"remark",cValue:"备注"}
		 ]
	);
});

function doQuery(){
	var queryObj = {
			search_LIKES_project_OR_driverCLassName_OR_jdbcPassword_OR_jdbcUrl_OR_dbType_OR_jdbcUser_OR_schemaName_OR_dbName_OR_createbyId_OR_updatebyId_OR_createDate_OR_updateDate_OR_remark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>