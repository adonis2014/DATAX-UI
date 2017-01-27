<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>sql查询</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="sql查询" pageTitleContent="eswrapper-sql查询" titleIcon="icon-home"/>
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="icon-globe"></i>sql查询
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a><a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="row-fluid ">
								<form class="queryForm span8" name="frmQuery" action="${ctx}/commonQuery/showResults" method="post"  target="queryResult">
									<div class="row-fluid">
	                                 	<div class="span10 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="sql" name="sql" class="m-wrap span12" placeholder="select * from indexname/typename">
		                                          <select name="clusterName" class="m-wrap span3">
				                                         	<c:forEach items="${clusters}" var="ds">
				                                         	<option value="${ds.schemaName}">${ds.dsName}</option>
				                                         	</c:forEach>
				                                  </select>
				                                  from:<input type="text" name="from"  class="m-wrap span1" value="0" placeholder="from"/>
				                                  size:<input type="text" name="size"  class="m-wrap span1" value="10"  placeholder="size"/>
				                                  useCache:<select name="useCache" class="m-wrap span2">
				                                  <option value="0">否</option>
				                                  <option value="1">是</option>
				                                  </select>
				                                  <input type="text" name="taskId"  class="m-wrap span2" value=""  placeholder="缓存Id"/>
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span2 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                         <a class="btn blue" href="javascript:void(0)" onclick="javascript:doQuery();">
		                                         	<i class="icon-search"></i>
		                                         	查询</a>
		                                         	 </div>
		                                         	
		                                    </div>
	                                 	</div>
									</div>
								</form>
							</div>
							<iframe width="100%" name="queryResult" style="height:480px;" src=""></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	App.activeMenu("commonQuery/sqlquery");
	
	
});

function doQuery(){
	frmQuery.submit();
}
</script>
</body>
</html>