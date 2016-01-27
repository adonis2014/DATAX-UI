<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看多国语言'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="内容管理-多国语言管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder">详细信息</i>
							</h4><div class="tools">
								<a href="javascript:;" class="collapse"></a> 
							</div>
						</div>
						<div class="portlet-body form">
						<form action="" class="form-horizontal form_sync" method="post" id="form1">
								<div class="control-group">
									<label class="control-label">ID:</label>
									<div class="controls">
										${obj.id}
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">编码:</label>
									<div class="controls">
										${obj.langCode }
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">key:</label>
									<div class="controls">
										${obj.langKey }
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">内容:</label>
									<div class="controls">
										${obj.langContent }
									</div>
								</div>
								<div class="form-actions">
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
		App.activeMenu("sys/multiLang/list");
	});
</script>
</body>
</html>