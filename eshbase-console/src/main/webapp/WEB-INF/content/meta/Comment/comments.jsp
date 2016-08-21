<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
<script type="text/javascript">
	$(function(){
		initPageData();
	});
	function initPageData(){
		Page.initData(
				{
					url:"${ctx}/meta/Comment/page?objectId=${param.objectId}&objectType=${param.objectType}",
					pageNo : 1,
					pageSize : 5,
					checkboxType:4,
					tableId : "#comments"
				},
				null,
				[
					 	{cName:"user",cValue:"注释人",format:function(i,value,item){
					 		return  item.user.name;
						 }},
					 	{cName:"comment",cValue:"注释"},
					 	{cName:"createDate",cValue:"建立时间",format:function(i,value,item){
							 if(App.isNundef(value)){
								 return new Date(value).format("yyyy-MM-dd hh:mm");
							 }
							 return value;
						 }}
				 ]
			);
	}
	function submitComment(){
		$.ajax({
            url:"${ctx}/meta/Comment/save?objectType=${param.objectType}&objectId=${param.objectId}&commentStr="+$("#commentStr").val(),
            dataType:"text",
            type:"post",
           success:function(data){
              if(data=="0"){
                  alert("注释失败！");
              }else{
                  alert("注释成功！");
                 self.location.reload();
              }
           }
         });
	}
</script>

<div id="commentsList" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<h3>注释信息</h3>
	</div>
	<div class="modal-body" >
		<table class="table table-striped table-bordered table-hover" id="comments">
		</table>
	</div>
	<div class="modal-footer">
		<form action="" method="post" name="frmComment">
		<textarea rows="3" style="width:100%;" name="comment" id="commentStr"></textarea>
		<button type="button" class="btn green" onclick="javascript:submitComment();">提交</button>
		<button type="button red" class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		</form>
	</div>
</div>
