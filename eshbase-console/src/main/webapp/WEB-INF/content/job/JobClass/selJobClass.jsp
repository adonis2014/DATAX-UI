<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
<script type="text/javascript" src="${ctx}/assets/js/map.js"></script>
	
<script type="text/javascript">
	$(function(){
		var classTypeMap = new Map();  
		<mytags:dictSelect field="classTypeMap" id="classTypeMap" type="map" hasLabel="false" codeType="21" />
		Page.initData(
				{
					url:"${ctx}/job/JobClass/page",
					pageNo : 1,
					pageSize : 10,
					checkboxType : 1,
					colName : "name",
					tableId : "#jobClass-grid"
				},
				null,
				[
					 	{cName:"name",cValue:"作业名"},
					 	{cName:"methodName",cValue:"方法名"},
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
						{cName:"remark",cValue:"备注"}
				 ]
			);
	});
	

	

</script>
<div id="jobClassList" class="modal hide fade" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<h3>选择调度作业类</h3>
	</div>
	<div class="modal-body">
		<table class="table table-striped table-bordered table-hover" id="jobClass-grid">
		</table>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn green" onclick="javascript:selJobClass();">确定</button>
		<button type="button red" class="btn" data-dismiss="modal"
			aria-hidden="true">关闭</button>
	</div>
</div>
