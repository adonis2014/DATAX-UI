<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>

<script type="text/javascript">
	$(function(){
		Page.initData(
				{
					url:"${ctx}/meta/Project/page",
					pageNo : 1,
					pageSize : 10,
					checkboxType : 1,
					colName : "projectName",
					tableId : "#projects"
				},
				null,
				[
					 	{cName:"projectCode",cValue:"项目编码"},
					 	{cName:"projectName",cValue:"项目名称"},
					 	{cName:"remark",cValue:"备注"}
				 ]
			);
	});
	

	

</script>
<div id="projectList" class="modal hide fade" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<h3>选择项目</h3>
	</div>
	<div class="modal-body">
		<table class="table table-striped table-bordered table-hover" id="projects">
		</table>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn green" onclick="javascript:selProject();">确定</button>
		<button type="button red" class="btn" data-dismiss="modal"
			aria-hidden="true">关闭</button>
	</div>
</div>
