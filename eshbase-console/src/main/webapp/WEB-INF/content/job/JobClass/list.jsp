<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>作业类信息列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="作业类信息列表" pageTitleContent="作业管理-作业类信息管理-作业类信息列表" titleIcon="icon-home" />
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
													<input type="text" id="filters" class="m-wrap span12" placeholder="作业名,作业类型,类名,版本,作业产品ID,建立者,更新者,建立时间,更新时间,启用标记,备注">
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
								<tool:operBtns modelKey="jobclass"  modelName="job"></tool:operBtns>
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
	<script type="text/javascript" src="${ctx}/assets/js/map.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var checkLabelMap = new Map();  
			<mytags:dictSelect field="checkLabelMap" id="checkLabelMap" type="map" hasLabel="false" codeType="17" />
			var classTypeMap = new Map();  
			<mytags:dictSelect field="classTypeMap" id="classTypeMap" type="map" hasLabel="false" codeType="21" />
			App.activeMenu("job/JobClass/list");
			Page.initData({
				url : "${ctx}/job/JobClass/page",
				pageNo : 1,
				pageSize : 10,
				tableId : "#sample_1"
			}, null, [ {
				cName : "name",
				cValue : "作业名"
			},
			{
				cName : "jobType",
				cValue : "作业类型",format:function(i,value,item){
			 		return classTypeMap.get(item.jobType);
			 	}
			},
						{
				cName : "version",
				cValue : "版本"
			},

			{
				cName : "productId",
				cValue : "作业产品ID"
			},
			{
				cName : "createDate",
				cValue : "建立时间",format:function(i,value,item){
					 if(App.isNundef(value)){
						 return new Date(value).format("yyyy-MM-dd");
					 }
					 return value;
				 }
			},

			{
				cName : "updateDate",
				cValue : "更新时间",format:function(i,value,item){
					 if(App.isNundef(value)){
						 return new Date(value).format("yyyy-MM-dd");
					 }
					 return value;
				 }
			},

			{
				cName : "checkLabel",
				cValue : "启用标记",format:function(i,value,item){
					<shiro:hasPermission name="job:JobClass:changeJobClassCL">
					 var $a = $('<a href="javascript:void(0)" data-id="'+item.id+'" data-placement="right"  onclick="javascript:changeJobClassCL(this)"></a>');
					 if(value === 1){
						 return $a.clone().attr("data-original-title","点击禁用").addClass("green").html('<i class="icon-unlock"></i>&nbsp;&nbsp;已启用');
					 }
					 return $a.attr("data-original-title","点击启用").addClass("grey").html('<i class="icon-lock"></i>&nbsp;&nbsp;已禁用');
				 	</shiro:hasPermission>
				 	if(value == 1){
					 	return "<span class='label label-success'>已启用</span>";
					 }
				 	return "<span class='label label-danger'>已禁用</span>";
				}
			} ]);
		});

		function changeJobClassCL(obj){
			var callback = function(result){
				if(!result){
					return;
				}
				blockUI();
				$.ajax({
					type : "POST",
					dataType : "json",
					url : Page.subUrl()+"/setCheckLabel",
					data : {"id":$(obj).attr("data-id")},
					success : function(data){
						if(data == 1){
							$(obj).removeAttr("data-original-title").attr("data-original-title","点击禁用").removeClass("grey").addClass("green").html('<i class="icon-unlock"></i>已启用');
						}else{
							$(obj).removeAttr("data-original-title").attr("data-original-title","点击启用").removeClass("green").addClass("grey").html('<i class="icon-lock"></i>已禁用');
						}
						unBlockUI();
					}
				});
			};
			App.confirm(callback);
			
		}
		
		function doQuery() {
			var queryObj = {
				search_LIKES_name_OR_jobType_OR_className_OR_version_OR_productId_OR_createbyId_OR_updatebyId_OR_createDate_OR_updateDate_OR_checkLabel_OR_remark : App
						.isEqPlacehoder($("#filters"))
			};
			Page.doQuery(queryObj);
		}
	</script>
</body>
</html>