<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加数据字典':'修改数据字典' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>

	<%@ include file="/WEB-INF/content/sys/dict/tree.jsp" %>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="内容管理-数据字典管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>请填写表单
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> 
								<a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/sys/dict/edit" class="form-horizontal form_sync"
								method="post" id="form1">
								
								<input type="hidden" value="${obj.id}" name="id">
								<input type="hidden" value="${obj.parent.id }" name=parent.id id="parentId">
							
								<div class="control-group">
									<label class="control-label">字典类别:</label>
									<div class="controls">
										<input id="parentName" type="text" class="span6 m-wrap" value="${obj.parent.codeName }" onfocus="javascript:showTree();"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">实际值:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="codeValue" value="${obj.codeValue }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">显示名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="codeName" value="${obj.codeName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">排序id:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="sortId" value="${obj.sortId }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">备注:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="remark" value="${obj.remark }" />
									</div>
								</div>
								
								
								<div class="form-actions">
									<button type="submit" class="btn blue">提交</button>
									<a class='btn' href="${header.Referer }">返回</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/bootstrap-tree.jsp"%>
<script type="text/javascript">
	$(function(){
		App.activeMenu("sys/dict/list");
	});
	function showTree(){
		$("#dictTree").modal();
	}
	
	function selDict(){
		
		$obj = $("#tree_1").find("a.selected:first");
		
		$('#dictTree').modal('hide');
		
		$('#parentName').val($obj.text());
		$('#parentId').val($obj.attr("data-id"));
	}
</script>
</body>
</html>