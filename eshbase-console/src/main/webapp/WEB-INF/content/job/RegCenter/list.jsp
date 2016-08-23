<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>注册中心列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="注册中心列表" pageTitleContent="作业管理-注册中心管理-注册中心列表" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="icon-globe">列表</i>
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a><a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="row-fluid">
								<form class="queryForm span7">
									<div class="row-fluid">
										<div class="span7 ">
											<div class="control-group">
												<div class="controls">
													<input type="text" id="filters" class="m-wrap span12" placeholder="名称,ZK列表,命名空间,待重试间隔时间,待重试间隔时间最大值,最大重试次数,登录凭证,备注">
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
								<tool:operBtns modelKey="regcenter"  modelName="job"></tool:operBtns>
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
			
			App.activeMenu("job/RegCenter/list");
			Page.initData({
				url : "${ctx}/job/RegCenter/page",
				pageNo : 1,
				pageSize : 10,
				tableId : "#sample_1"
			}, null, [ {
				cName : "name",
				cValue : "名称"
			},

			{
				cName : "zkQuorumPeer",
				cValue : "ZK列表"
			},

			{
				cName : "nameSpace",
				cValue : "命名空间"
			},

			{
				cName : "baseSleepTime",
				cValue : "待重试间隔时间"
			},

			{
				cName : "maxSleepTime",
				cValue : "待重试间隔时间最大值"
			},

			{
				cName : "maxRetries",
				cValue : "最大重试次数"
			},

			{
				cName : "loginCert",
				cValue : "登录凭证"
			}, {
				cName : "checkLabel",
				cValue : "标记",format:function(i,value,item){
					<shiro:hasPermission name="job:RegCenter:connectRegCenter">
					 var $a = $('<a href="javascript:void(0)" data-id="'+item.id+'" data-placement="right"  onclick="javascript:connectRegCenter(this)"></a>');
					 if(value === 1){
						 return $a.clone().attr("data-original-title","点击断开").html('<input type="button" value="断开"/>&nbsp;已连接');
					 }
					 return $a.attr("data-original-title","点击连接").html('<input type="button" value="连接"/>&nbsp;已断开');
				 	</shiro:hasPermission>
					 if(value == 1){
					 	return "<span class='label label-success'>已连接</span>";
					 }
				 	return "<span class='label label-danger'>已断开</span>";
			 }
			} ]);
		});
		
		function connectRegCenter(obj){
			var callback = function(result){
				if(!result){
					return;
				}
				blockUI();
				self.location.href="${ctx}/job/RegCenter/connect/"+$(obj).attr("data-id");
			};
			App.confirm(callback);
		}

		function doQuery() {
			var queryObj = {
				search_LIKES_name_OR_zkQuorumPeer_OR_nameSpace_OR_baseSleepTime_OR_maxSleepTime_OR_maxRetries_OR_loginCert_OR_remark : App
						.isEqPlacehoder($("#filters"))
			};
			Page.doQuery(queryObj);
		}
	</script>
</body>
</html>