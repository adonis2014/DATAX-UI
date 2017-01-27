<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>es访问日志列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="es访问日志列表" pageTitleContent="es管理-es访问日志列表" titleIcon="icon-home"/>
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="icon-globe"></i>es访问日志
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
	                                 	<div class="span3 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="filters" class="m-wrap span10" placeholder="访问来源,方法,集群,url,requestData,访问机器名">
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span2 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="daterange" class="m-wrap span12" placeholder="时间范围" readonly="readonly">
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span2 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="elapsed" class="m-wrap span12" placeholder="耗时大于（毫秒）" />
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span4 ">
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
<%@ include file="/WEB-INF/content/common/plugins/daterangepicker.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	
	App.activeMenu("esSlowlog/list");
	
	$('#daterange').daterangepicker({
		ranges: {
			'今日': ['today', 'today'],
			'昨日': ['yesterday', 'yesterday'],
			'本月': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
			'前7天': [Date.today().add( {days: -7} ),'today'],
			'前30天': [Date.today().add( {days: -30} ),'today']
		},
		startDate: "2016/08/05",
		endDate: "2016/08/05"
	});
	
	Page.initData(
		{
			url:"${ctx}/esSlowlog/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
		 	{cName:"sourceIp",cValue:"访问来源"},
		 	{cName:"method",cValue:"方法"},
		 	{cName:"url",cValue:"url",format:function(i,value,item){
	 			return "<a href='${ctx}/esSlowlog/show/"+item.id+"'>"+value+"</a>";
	 		}},
			{cName:"status",cValue:"状态",format:function(i,value,item){
		 			if (item.status==1){
		 				return "成功";
		 			}else{
		 				return "失败";
		 			}
			}},
			{cName:"elapsed",cValue:"耗时"},
			{cName:"start_time",cValue:"执行时间",format:function(i,value,item){
				 if(App.isNundef(item.start_time)){
					 return new Date(item.start_time).format("yyyy-MM-dd hh:mm:ss");
				 }
				 return item.start_time;
			 }},
			{cName:"clusterName",cValue:"集群"}
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
	var queryObj = {};
	if(App.isNundef($("#daterange").val()) && App.isEqPlacehoder($("#daterange")) != null){
		var arr = $("#daterange").val().split("-")
		queryObj ={
			"search_GTD_log_time" : arr[0].replaceAll("/","-")+" 00:00:00",
			"search_LTD_log_time" : arr[1].replaceAll("/","-")+" 23:59:59"
		}
	}
	queryObj["search_GTI_elapsed"]=App.isEqPlacehoder($("#elapsed"));
	queryObj["search_LIKES_clusterName_OR_sourceIp_OR_method_OR_url_OR_hostname_OR_requestData.name"] = App.isEqPlacehoder($("#filters"));
	Page.doQuery(queryObj);
	
}
</script>
</body>
</html>