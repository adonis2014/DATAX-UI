<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div class="f_links" id="f_links" onmouseover="javascript:linksOver()" onmouseout="javascript:linksOut();">
	<div class="f_links_content" id="f_links_content">
		<ul>
				<li><a href="https://github.com/alibaba/DataX" target="_blank">DataX</li>
				<li><a href="https://github.com/shipyard/shipyard" target="_blank">shipyard</li>
		</ul>
	</div>
	<img class="f_links_img" src="${ctx}/assets/xyz/bg/images/links.jpg" alt="" />
</div>
<script type="text/javascript">
	function linksOver(){
		document.getElementById( "f_links" ).style.width = "200px";
		var c_style = document.getElementById( "f_links_content" ).style
		c_style.width = "200px";
		c_style.display = "block";
	}
	function linksOut(){
		document.getElementById( "f_links" ).style.width = "0px";
		var c_style = document.getElementById( "f_links_content" ).style
		c_style.width = "0px";
		c_style.display = "none";
	}
</script>