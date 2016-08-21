<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看数据库定义'}" scope="page" />
<html>
<head>
<title>${pageTitle}</title>
</head>
<body>
<jsp:include page="/WEB-INF/content/meta/Comment/comments.jsp">
	<jsp:param value="${obj.id}" name="objectId"/>
	<jsp:param value="1" name="objectType"/>
</jsp:include>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="元数据管理-数据库管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>${pageTitle} 
								
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> 
								<a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
								<input type="hidden" value="${obj.id}" name="id">
								<table width="100%" class="dbform">
									<tr>
										<td class="fieldtitle">schema名称:</td>
										<td class="fieldvalue">${obj.schemaName}</td>
										<td class="fieldtitle">数据库名:</td>
										<td class="fieldvalue">${obj.dbname}</td>
									</tr>
								<c:if test="${not empty obj}">
									<tr>
										<td class="fieldtitle">建立者:</td>
										<td class="fieldvalue">${obj.creater.name}</td>
										<td class="fieldtitle">更新者:</td>
										<td class="fieldvalue">${obj.updater.name}</td>
									</tr>
									<tr>
										<td class="fieldtitle">建立时间:</td>
										<td class="fieldvalue">${obj.createDate }</td>
										<td class="fieldtitle">更新时间:</td>
										<td class="fieldvalue">${obj.updateDate }</td>
									</tr>
									<tr>
										<td class="fieldtitle">数据源:</td>
										<td class="fieldvalue">${obj.datasource.dsName}</td>
										<td class="fieldtitle">启用标记:</td>
										<td class="fieldvalue">
										<mytags:dictSelect field="checkLabel" type="label" id="checkLabel" defaultVal="${obj.checkLabel}" hasLabel="false" codeType="17" />
										</td>
									</tr>
								</c:if>
								<tr>
									<td class="fieldtitle">备注:</td>
									<td class="fieldvalue" colspan="3">${obj.remark}</td>
								</tr>
								</table>
							<c:if test="${not empty obj.tables }">
									<br />
									<div class="row-fluid">
										<table width="100%" class="dbgrid">
											<thead>
												<tr>
													<th>表名</th>
													<th>逻辑名</th>
													<th>更新时间</th>
													<th>备注</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="table" items="${obj.tables}">
													<tr>
														<td><a href='${ctx}/meta/DBTable/show/${table.id}' >${table.tableName}</a></td>
														<td><a href='${ctx}/meta/DBTable/show/${table.id}' >${table.tablePname}</a></td>
														<td>${table.updateDate}</td>
														<td>${table.remark}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</c:if>
								<div class="form-actions">
									<a href="javascript:addFavorite();" class="icon-btn span2">
										<i class="icon-star"></i>
										<div id="favoriteTxt"><c:if test="${not empty favorite}">取消收藏</c:if>
										<c:if test="${empty favorite}">收藏</c:if></div>
										<span class="badge badge-info" id="favoriteNum">${favoriteNum}</span>
									</a>
									<a href="javascript:addWatch();" class="icon-btn span2">
										<i class="icon-eye-open"></i>
										<div id="watchTxt">
										<c:if test="${not empty watch}">取消关注</c:if>
										<c:if test="${empty watch}">关注</c:if></div>
										<span class="badge badge-info" id="watchNum">${watchNum}</span>
									</a>
									<a href="javascript:addOwner();" class="icon-btn span2">
										<i class="icon-user"></i>
										<div id="ownerTxt"><c:if test="${not empty owner}">取消拥有</c:if>
										<c:if test="${empty owner}">拥有</c:if></div>
										<span class="badge badge-info" id="ownerNum">${ownerNum}</span>
									</a>
									<a href="javascript:addComment();" class="icon-btn span2">
										<i class="icon-comment"></i>
										<div>注释</div>
										<span class="badge badge-info" id="commentNum">${commentNum}</span>
									</a>
									<a href="${ctx}/meta/Database/update/${obj.id}" class="icon-btn span2">
										<i class="icon-edit"></i>
										<div>修改</div>
									</a>
									<a href="${header.Referer }" class="icon-btn span2">
										<i class="icon-arrow-left"></i>
										<div>返回</div>
									</a>
								</div>
								
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("meta/Database/list");
		});
		
		function countNum(eleId,opId){
			var curNum=$("#"+eleId).text();
			if (opId==1){
				var newNum=parseInt(curNum)+1;
				$("#"+eleId).text(newNum);
			}else{
				var newNum=parseInt(curNum)-1;
				$("#"+eleId).text(newNum);
			}
		}
		
		function addFavorite(){
			$.ajax({
                url:"${ctx}/meta/Favorite/save?objectType=1&objectId=${obj.id}",
                dataType:"text",
                type:"post",
               success:function(data){
                  if(data=="0"){
                      alert("操作失败！");
                  }else if (data=="2"){
                      alert("取消收藏成功！");
                      countNum("favoriteNum",0);
                      $("#favoriteTxt").text('收藏');
                  }else{
                      alert("收藏成功！");
                      countNum("favoriteNum",1);
                      $("#favoriteTxt").text('取消收藏');
                  }
               }
             });
		}
		
		function addWatch(){
			$.ajax({
                url:"${ctx}/meta/Watch/save?objectType=1&objectId=${obj.id}",
                dataType:"text",
                type:"post",
               success:function(data){
                  if(data=="0"){
                      alert("操作失败！");
                  }else if (data=="2"){
                      alert("取消关注成功！");
                      countNum("watchNum",0);
                      $("#watchTxt").text('关注');
                  }else{
                      alert("关注成功！");
                      countNum("watchNum",1);
                      $("#watchTxt").text('取消关注');
                  }
               }
             });
		}
		
		function addComment(){
			$("#commentsList").modal();
		}
		
		
		
		function addOwner(){
			$.ajax({
                url:"${ctx}/meta/Owner/save?objectType=1&objectId=${obj.id}",
                dataType:"text",
                type:"post",
               success:function(data){
                  if(data=="0"){
                      alert("操作失败！");
                  }else if (data=="2"){
                      alert("取消拥有成功！");
                      countNum("ownerNum",0);
                      $("#ownerTxt").text('拥有');
                  }else{
                      alert("拥有成功！");
                      countNum("ownerNum",1);
                      $("#ownerTxt").text('取消拥有');
                  }
               }
             });
		}
	</script>
</body>
</html>