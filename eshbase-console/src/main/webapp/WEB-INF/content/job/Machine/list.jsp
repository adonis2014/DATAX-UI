<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>作业终端列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="作业终端列表" pageTitleContent="作业管理-作业终端管理-作业终端列表" titleIcon="icon-home"/>
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
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="终端名,终端地址,ssh端口,登录名,登录密码,工作路径,建立者,更新者,建立时间,更新时间,启用标记,备注">
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
								<tool:operBtns modelKey="machine"  modelName="job"></tool:operBtns>
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
	
	App.activeMenu("job/Machine/list");
	
	Page.initData(
		{
			url:"${ctx}/job/Machine/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"machineName",cValue:"终端名"},

			 	{cName:"address",cValue:"终端地址"},

			 	{cName:"sshPort",cValue:"ssh端口"},

			 	{cName:"loginName",cValue:"登录名"},

			 	{cName:"loginPassword",cValue:"登录密码"},

			 	{cName:"userDir",cValue:"工作路径"},

			 	{cName:"createbyId",cValue:"建立者"},

			 	{cName:"updatebyId",cValue:"更新者"},

			 	{cName:"createDate",cValue:"建立时间"},

			 	{cName:"updateDate",cValue:"更新时间"},

			 	{cName:"checkLabel",cValue:"启用标记"},

			  	{cName:"remark",cValue:"备注"}
		 ]
	);
});

function doQuery(){
	var queryObj = {
			search_LIKES_machineName_OR_address_OR_sshPort_OR_loginName_OR_loginPassword_OR_userDir_OR_createbyId_OR_updatebyId_OR_createDate_OR_updateDate_OR_checkLabel_OR_remark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>