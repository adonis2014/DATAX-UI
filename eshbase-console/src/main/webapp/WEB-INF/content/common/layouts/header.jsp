<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<!-- BEGIN HEADER -->
<div class="header navbar navbar-inverse navbar-fixed-top">
	<!-- BEGIN TOP NAVIGATION BAR -->
	<div class="navbar-inner">
		<div class="container-fluid">
			<!-- BEGIN LOGO -->
			<a class="brand" href="index.html">大数据平台</a>
			<!-- BEGIN TOP NAVIGATION MENU -->
			<ul class="nav pull-right">
				<!-- BEGIN NOTIFICATION DROPDOWN -->
				
				<li class="dropdown" id="header_notification_bar">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
						<i class="diy_icon_02_44"></i>
					</a>
					<ul class="dropdown-menu extended notification">
						<li>
							<p>当前站点:(点击菜单切换)</p>
						</li>
						<li data-sitename="news">
							<a href="javascript:Header.changeSite('');">
								控制台
							</a>
						</li>
					</ul>
				</li>
				<!-- END TODO DROPDOWN -->
				<!-- BEGIN USER LOGIN DROPDOWN -->
				<li class="dropdown user">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<img alt="" src="${ctx}/assets/img/avatar1_small.jpg" />
							<span class="username"><shiro:principal/></span> 
							<i class="icon-angle-down"></i>
					</a>
					<ul class="dropdown-menu">
						<li><a href="javascript:void(0);" onclick="javascript:Header.tips();">
							<i class="icon-user"></i>&nbsp&nbsp&nbsp<span>个人信息</span>
							</a>
						</li>
						<li><a href="javascript:void(0);" onclick="javascript:Header.tips();">
							<i class="icon-wrench"></i>&nbsp&nbsp&nbsp<span>修改密码</span>
							</a>
						</li>
						<li><a href="javascript:void(0);" onclick="javascript:Header.tips();">
							<i class="icon-calendar"></i>&nbsp&nbsp&nbsp<span>我的任务</span>
							</a>
						</li>
						<li><a href="javascript:void(0);" onclick="javascript:Header.tips();">
							<i class="icon-cog"></i>&nbsp&nbsp&nbsp<span>系统设置</span>
							</a>
						</li>
						<li class="divider"></li>
						<li><a href="${ctx }/logout/"><i class="icon-key"></i>退出</a></li>
					</ul>
				</li>
				<!-- END USER LOGIN DROPDOWN -->
			</ul>
			<!-- END TOP NAVIGATION MENU -->
		</div>
	</div>
	<!-- END TOP NAVIGATION BAR -->
</div>
<script src="${ctx}/assets/js/sys/header.js"></script>
<c:if test="${not empty sessionScope.cursite }">
<script type="text/javascript">
	var siteName = "${sessionScope.cursite.name}"
	$(function(){
		$(".notification li").removeClass("active");
		$(".notification li[data-sitename='"+siteName+"']").addClass("active");
	});
</script>
</c:if>