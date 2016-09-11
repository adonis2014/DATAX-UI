<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加作业项目定义':'修改作业项目定义' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
<%@ include file="/WEB-INF/content/job/JobClass/selJobClass.jsp" %>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-作业项目管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>请填写表单
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/job/JobFlow/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.jobclass.id}" name="jobclass.id" id="jobclassId"/>
								<input type="hidden" value="${obj.id}" name="id">
								<table class="dbform" width="100%">
									<tr>
										<td class="fieldtitle">名称:</td>
										<td class="fieldvalue"><input type="text" class="span6 m-wrap" validate="{required:true}" name="name" value="${obj.name }" /></td>
										<td class="fieldtitle">作业类:</td>
										<td class="fieldvalue"><input type="text" class="span6 m-wrap" validate="{required:true}" name="jobClassName" id="jobClassName" value="${obj.jobclass.name}"  readonly="readonly" onfocus="showJobClass()"/></td>
									</tr>
								<c:if test="${not empty obj}">
									<tr>
										<td class="fieldtitle">建立者:</td>
										<td class="fieldvalue">${obj.creater.name}</td>
										<td class="fieldtitle">更新者:</label>
										<td class="fieldvalue">${obj.updater.name}</td>
									</tr>
									<tr>
										<td class="fieldtitle">建立时间:</td>
										<td class="fieldvalue">${obj.createDate }</td>
										<td class="fieldtitle">更新时间:</td>
										<td class="fieldvalue">${obj.updateDate}</td>
									</tr>
								</c:if>
									<tr>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue" colspan="3"><input type="text"  class="span12 m-wrap" name="remark" value="${obj.remark }" /></td>
									</tr>
								</table>
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
	<script type="text/javascript">
		$(function() {
			App.activeMenu("job/JobFlow/list");
		});
		function showJobClass(){
			$("#jobClassList").modal();
		}
		function selJobClass(obj){
			var flag = Page.selectsPrompt();
			if(!flag) return;
			
			var obj = $("#jobClass-grid").find("td :checkbox:checked");
			$('input[id=jobClassName]').val(obj.first().attr("data-text"));
			$('input[id=jobclassId]').val(flag);
			$('#jobClassList').modal('hide');
		}
	</script>
</body>
</html>