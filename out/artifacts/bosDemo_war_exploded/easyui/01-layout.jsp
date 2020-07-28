<%--
  Created by IntelliJ IDEA.
  User: ChinaLi
  Date: 2020/7/27
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout">
    <div title="管理系统" data-options="region:'north'" style="height:100px">北部区域</div>
    <div title="系统菜单" data-options="region:'west'" style="width: 200px">西部区域</div>
    <div data-options="region:'center'">中部区域</div>
    <div data-options="region:'east'" style="width: 100px">东部区域</div>
    <div data-options="region:'south'" style="height: 50px">南部区域</div>
</body>
</html>
