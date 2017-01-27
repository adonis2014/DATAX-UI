<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>head管理入口</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="head管理入口" pageTitleContent="ES集群管理-head管理入口" titleIcon="icon-home"/>
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="icon-globe"></i>head管理入口
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a><a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="row-fluid">
								<form class="queryForm span5">
									<div class="row-fluid">
	                                 	<div class="span6 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="filters" class="m-wrap span10" placeholder="schema,名称,备注">
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span6 ">
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
	
	App.activeMenu("esmgnt/thirdparty/head");
	
	Page.initData(
		{
			url:"${ctx}/meta/clustermgnt/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
		 	{cName:"dsName",cValue:"ds名"},
		 	{cName:"schemaName",cValue:"schema"},
		 	{cName:"dbType",cValue:"类别",format:function(i,value,item){
		 			if (item.dbType==1){
		 				return "elasticsearch";
		 			}
			 	}},
			 	{cName:"checkLabel",cValue:"状态",format:function(i,value,item){
		 			if (item.checkLabel==1){
		 				return "启用";
		 			}else{
		 				return "停用";
		 			}
			 	}},
			{cName:"remark",cValue:"备注"},
			{cName:"id",cValue:"head入口",format:function(i,value,item){
	 			return "<a target='_blank' href='${ctx}/esmgnt/thirdparty/redirectHead/"+item.id+"'>head</a>";
		 	}}
		 ]
	);
});

function setupObj(){
	var flag = Page.selectsPrompt();
	if(!flag) return;
	window.location.href = Page.subUrl() + "/setup/" + flag;
}

function startObj(){
	var flag = Page.selectsPrompt();
	if(!flag) return;
	window.location.href = Page.subUrl() + "/start/" + flag;
}

function monitorObj(){
	var flag = Page.selectsPrompt();
	if(!flag) return;
	window.location.href = Page.subUrl() + "/monitor/" + flag;
}

function doQuery(){
	var queryObj = {
			search_LIKES_dsName_OR_schemaName_OR_remark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>