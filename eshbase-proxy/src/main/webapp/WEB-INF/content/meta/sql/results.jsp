<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>查询结果</title>
</head>
<body>
		<div class="container-fluid">
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
							<table width="100%" class="dbform">
								<tr>
									<th>起始行ID</th><td>${results.start}</td>
									<th>行数</th><td>${results.total}</td>
								</tr>
								<tr>
									<th>开始执行时间</th><td>${results.startTime}</td>
									<th>执行结束时间</th><td>${results.endTime}</td>
								</tr>
								<tr>
									<th>缓存ID</th><td>${results.id}</td>
									<th>耗时</th><td>${results.consuming}</td>
								</tr>
								<tr>
									<th>状态</th><td>${results.status}</td>
									<th>返回消息</th><td>${results.msg}</td>
								</tr>
								<tr>
									<th>错误信息</th><td colspan="3">${results.allMessages}</td>
								</tr>
								<tr>
									<td colspan="4">
										<div style="width:860px;overflow: auto;padding-top:5px; " >
										<table  style="border-top:1px solid black;border-left:1px solid black;">
											<thead>
												<tr>
													<c:if test="${not empty results.data}">
													<c:forEach items="${fields}" var="fieldname">
													<th style="word-break:keep-all; white-space:nowrap; ">${fieldname}</th>
													</c:forEach>
													</c:if>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${results.data}" var="row">
												<tr>
													<c:forEach items="${fields}" var="fieldname">
													<td style="width:100%;word-break:keep-all; white-space:nowrap; overflow:hidden;text-overflow:ellipsis;" ><c:forEach items="${row}" var="fieldV"><c:if test="${fieldV.key==fieldname }"> ${fieldV.value}</c:if></c:forEach></td>
													</c:forEach>
												</tr>
												</c:forEach>
											</tbody>
										</table>
										</div>
									</td>
								</tr>
							</table>
							
						</div>
					</div>
				</div>
			</div>
		</div>

</body>
</html>