<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tool" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
  <head>
    <title>Wizard With Form Validation</title>
    <!-- Bootstrap -->
        <link href="${ctx}/assets/comp/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/assets/css/metro.css" type="text/css" rel="stylesheet"/>
    
  </head>
  <body>
    <div class='container'>
		
		<div class="span12">
			<section id="wizard">
			  <div class="page-header">
	            <h1>Wizard With Form Validation</h1>
	          </div>
	
				<div id="rootwizard">
					<div class="navbar">
					  <div class="navbar-inner">
					    <div class="container">
					<ul>
					  	<li><a href="#tab1" data-toggle="tab">First</a></li>
						<li><a href="#tab2" data-toggle="tab">Second</a></li>
						<li><a href="#tab3" data-toggle="tab">Third</a></li>
						<li><a href="#tab4" data-toggle="tab">Forth</a></li>
						<li><a href="#tab5" data-toggle="tab">Fifth</a></li>
						<li><a href="#tab6" data-toggle="tab">Sixth</a></li>
						<li><a href="#tab7" data-toggle="tab">Seventh</a></li>
					</ul>
					 </div>
					  </div>
					</div>
					<div id="bar" class="progress progress-striped active">
					  <div class="bar"></div>
					</div>
					<div class="tab-content">
					    <div class="tab-pane" id="tab1">
					      1
					    </div>
					    <div class="tab-pane" id="tab2">
					      	<p>
						      	<input type='text' name='name' id='name' placeholder='Enter Your Name'>
						      </p>
					    </div>
						<div class="tab-pane" id="tab3">
							3
					    </div>
						<div class="tab-pane" id="tab4">
							4
					    </div>
						<div class="tab-pane" id="tab5">
							5
					    </div>
						<div class="tab-pane" id="tab6">
							6
					    </div>
						<div class="tab-pane" id="tab7">
							7
					    </div>
						<ul class="pager wizard">
							<li class="previous first" style="display:none;"><a href="#">First</a></li>
							<li class="previous"><a href="#">Previous</a></li>
							<li class="next last" style="display:none;"><a href="#">Last</a></li>
						  	<li class="next"><a href="#">Next</a></li>
						</ul>
					</div>	
				</div>
				
<h3>HTML</h3>
<pre class="prettyprint linenums">
&lt;div id="rootwizard">
	&lt;div class="navbar">
	  &lt;div class="navbar-inner">
	    &lt;div class="container">
	&lt;ul>
	  	&lt;li>&lt;a href="#tab1" data-toggle="tab">First&lt;/a>&lt;/li>
		&lt;li>&lt;a href="#tab2" data-toggle="tab">Second&lt;/a>&lt;/li>
		&lt;li>&lt;a href="#tab3" data-toggle="tab">Third&lt;/a>&lt;/li>
		&lt;li>&lt;a href="#tab4" data-toggle="tab">Forth&lt;/a>&lt;/li>
		&lt;li>&lt;a href="#tab5" data-toggle="tab">Fifth&lt;/a>&lt;/li>
		&lt;li>&lt;a href="#tab6" data-toggle="tab">Sixth&lt;/a>&lt;/li>
		&lt;li>&lt;a href="#tab7" data-toggle="tab">Seventh&lt;/a>&lt;/li>
	&lt;/ul>
	 &lt;/div>
	  &lt;/div>
	&lt;/div>
	&lt;div id="bar" class="progress progress-striped active">
	  &lt;div class="bar">&lt;/div>
	&lt;/div>
	&lt;div class="tab-content">
	    &lt;div class="tab-pane" id="tab1">
	      1
	    &lt;/div>
	    &lt;div class="tab-pane" id="tab2">
	      	&lt;p>
		      	&lt;input type='text' name='name' id='name' placeholder='Enter Your Name'>
		      &lt;/p>
	    &lt;/div>
		&lt;div class="tab-pane" id="tab3">
			3
	    &lt;/div>
		&lt;div class="tab-pane" id="tab4">
			4
	    &lt;/div>
		&lt;div class="tab-pane" id="tab5">
			5
	    &lt;/div>
		&lt;div class="tab-pane" id="tab6">
			6
	    &lt;/div>
		&lt;div class="tab-pane" id="tab7">
			7
	    &lt;/div>
		&lt;ul class="pager wizard">
			&lt;li class="previous first" style="display:none;">&lt;a href="#">First&lt;/a>&lt;/li>
			&lt;li class="previous">&lt;a href="#">Previous&lt;/a>&lt;/li>
			&lt;li class="next last" style="display:none;">&lt;a href="#">Last&lt;/a>&lt;/li>
		  	&lt;li class="next">&lt;a href="#">Next&lt;/a>&lt;/li>
		&lt;/ul>
	&lt;/div>	
&lt;/div>
</pre>

<h3>JS</h3>
<pre class="prettyprint linenums">
$(document).ready(function() {
  	$('#rootwizard').bootstrapWizard({onNext: function(tab, navigation, index) {
			if(index==2) {
				// Make sure we entered the name
				if(!$('#name').val()) {
					alert('You must enter your name');
					$('#name').focus();
					return false;
				}
			}
			
			// Set the name for the next tab
			$('#tab3').html('Hello, ' + $('#name').val());
			
		}, onTabShow: function(tab, navigation, index) {
			var $total = navigation.find('li').length;
			var $current = index+1;
			var $percent = ($current/$total) * 100;
			$('#rootwizard').find('.bar').css({width:$percent+'%'});
		}});
});
</pre>	
				
			</section>
 		</div>
	</div>
     <script src="${ctx}/assets/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="${ctx}/assets/comp/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
 	<script src="${ctx}/assets/comp/bootstrap-wizard/jquery.bootstrap.wizard.js"></script>
	<script>
	$(document).ready(function() {
	  	$('#rootwizard').bootstrapWizard({onNext: function(tab, navigation, index) {
				if(index==2) {
					// Make sure we entered the name
					if(!$('#name').val()) {
						alert('You must enter your name');
						$('#name').focus();
						return false;
					}
				}
				
				// Set the name for the next tab
				$('#tab3').html('Hello, ' + $('#name').val());
				
			}, onTabShow: function(tab, navigation, index) {
				var $total = navigation.find('li').length;
				var $current = index+1;
				var $percent = ($current/$total) * 100;
				$('#rootwizard').find('.bar').css({width:$percent+'%'});
			}});	
		window.prettyPrint && prettyPrint()
	});	
	</script>
  </body>
</html>