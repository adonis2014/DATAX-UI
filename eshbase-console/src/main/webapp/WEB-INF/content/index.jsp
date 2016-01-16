<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/content/common/common.jsp" %>
<html>
<head>
    <title>Datax 异构数据迁移管理工具</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<div class="page-content">
    <div class="container-fluid" style="padding-top: 25px">
        <div class="alert alert-error">
            <button class="close" data-dismiss="alert"></button>
            大数据实时处理即席查询分析平台
            
           
            
        </div>
        <ul>
            	<li> Datax-UI 异构数据迁移管理工具,全量离线，T+n增量数据处理平台，基于淘宝datax改造；</li>
            	<li>postgreSql,小表预处理数据存储关系数据库 </li>
            	<li>HBase+ElasticSearch,大表数据存储和查询分析平台</li>
            	<li>实时数据采集路口，基于Spark Stream与datax同规则引擎处理采集数据，支持kafka,dbms,hdfs,mongodb等异构数据源</li>
            	<li>JDBC ,Sql on HBase & ElasticSearch</li>
            </ul>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        App.activeMenu("/index");
    });
</script>
</body>
</html>