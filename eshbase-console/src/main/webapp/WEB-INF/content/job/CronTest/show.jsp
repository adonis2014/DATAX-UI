<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'验证Cron表达式'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
					<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>${pageTitle }
							</h4>
							<div class="tools">
								<a href="${header.Referer }" class="collapse"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/job/CronTest/test" class="form-horizontal form_sync" method="post" id="form1">
								
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">Cron表达式:</label>
											<div class="controls">
												<span class="text"><input type="text" validate="{required:true}" name="cronString" value="${param.cronString}" /></span>
												<span style="color:red;">${msg}</span>
											</div>
											
										</div>
										<div class="control-group">
										<div class="controls">
									<button type="submit" class="btn blue">提交</button>
									<a class='btn' href="${header.Referer }">返回</a>
								</div>
								</div>
									</div>
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
			App.activeMenu("job/CronTest/show");
		});
	</script>
</body>
</html>