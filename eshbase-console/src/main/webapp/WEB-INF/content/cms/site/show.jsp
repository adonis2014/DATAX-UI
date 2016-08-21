<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'站点信息'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="知识管理-站点管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>${pageTitle }
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/cms/site/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id">
								<div class="control-group">
									<label class="control-label">站点名称:</label>
									<div class="controls">
										${obj.name }
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">站点标题:</label>
									<div class="controls">
										${obj.title }
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">站点logo:</label>
									<div class="controls">
										${obj.logo }
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">描述:</label>
									<div class="controls">
										${obj.description }
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">关键字:</label>
									<div class="controls">
										${obj.keywords }
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">主题:</label>
									<div class="controls">
										${obj.theme }
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">版权信息:</label>
									<div class="controls">
										${obj.copyright }
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
<script type="text/javascript">
	$(function(){
		App.activeMenu("cms/site/list");
	});
</script>
</body>
</html>