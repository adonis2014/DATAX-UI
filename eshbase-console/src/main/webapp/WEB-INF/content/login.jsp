<%@ page language="java" contentType="text/html; utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>系统登录</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="metronic login page" name="description" />
<meta content="Joe.Zhang" name="author" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link href="${ctx}/assets/comp/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/css/metro.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/comp/bootstrap/css/bootstrap-responsive.min.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/comp/font-awesome/css/font-awesome.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/css/style.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/css/style_responsive.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/css/style_default.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/comp/gritter/css/jquery.gritter.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/assets/favicon.ico" rel="shortcut icon" />
<script src="${ctx}/assets/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/comp/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/js/jquery.getparam.js" type="text/javascript"></script>
<script src="${ctx}/assets/uniform/jquery.uniform.min.js"></script>
<script src="${ctx}/assets/js/jquery.blockui.js"></script>
<script type="text/javascript" src="${ctx}/assets/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="assets/js/app.js"></script>
<script type="text/javascript">
	$(function() {
		var error = $.getParam("error");
		var content = "";
		switch (error) {
		case "kickout":
			content = "账号被其他人登录！"
			break;
		case "unauthor":
			content = "拒绝访问！"
			break;
		default:
		}
		var remind = $("#remind").text();
		if (remind == null || "" == remind) {
			$("#remind").text(content);
		}
	});
</script>
<link rel="stylesheet" type="text/css" href="${ctx}/assets/uniform/css/uniform.default.css" />
<link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
	<!-- BEGIN LOGO -->
	<div class="logo">
		<img src="${ctx}/assets/img/logo-big.png" alt="" />
	</div>
	<!-- END LOGO -->
	<!-- BEGIN LOGIN -->
	<div class="content">
		<!-- BEGIN LOGIN FORM -->
		<form class="form-vertical login-form" action="${ctx }/login" method="post">
			<h3 class="form-title">请 登 录</h3>
			<div class="alert alert-error hide">
				<button class="close" data-dismiss="alert"></button>
				<span>请输入用户名和密码.${message_login }</span>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">用户名:</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i> <input class="m-wrap placeholder-no-fix" type="text" placeholder="loginId" name="userName" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">密码:</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i> <input class="m-wrap placeholder-no-fix" type="password" placeholder="password" name="password" />
					</div>
				</div>
			</div>
			<div class="form-actions">
				<label class="checkbox"> <input type="checkbox" name="remember" value="1" /> 记住我.
				</label>
				<button type="submit" class="btn green pull-right">
					登录 <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
			
		</form>
		<!-- END LOGIN FORM -->
		
		
	</div>
	<!-- END LOGIN -->
	<br/><br/><br/><br/>
	<!-- BEGIN COPYRIGHT -->
	<div class="copyright">2015 &copy; iharing.Net. 数据管理平台.</div>
	<!-- END COPYRIGHT -->
	<!-- BEGIN JAVASCRIPTS -->
	<script>
		jQuery(document).ready(function() {
			App.initLogin();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>