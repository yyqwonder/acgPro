
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/taglib.jsp" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-ui.min.css" />
    <link rel="stylesheet" href="${ctxStatic}/css/ui.jqgrid.min.css" />


</head>
<body>
<table id="grid-table"></table>

<div id="grid-pager"></div>

<script type="text/javascript" src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="${ctxStatic}/js/jquery.jqGrid.min.js"></script>
<script src="${ctxStatic}/js/grid.locale-en.js"></script>
<script type="text/javascript">
    $(function(){
        pageInit();
    });
    function pageInit(){
        jQuery("#grid-table").jqGrid(
                {
                    url : '${ctxPath}/subaoAja',
                    datatype : "json",
                    colNames : [ '序号', '内容' ],
                    colModel : [
                        {name : 'id',index : 'id',width : 55},
                        {name : 'content',index : 'content',width : 600},

                    ],
                    rowNum : 10,
                    rowList : [ 10, 20, 30 ],
                    pager : '#grid-pager',
                    sortname : 'id',
                    mtype : "post",
                    viewrecords : true,
                    sortorder : "desc",
                    caption : "JSON 实例"
                });
        jQuery("#grid-table").jqGrid('navGrid', '#grid-pager', {edit : false,add : false,del : false});
    }


</script>
</body>
</html>
