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

<div title="系统菜单" data-options="region:'west'" style="width: 200px">
    <!-- 折叠面板 -->
    <div class="easyui-accordion" data-options="fit:true">
        <!-- 每个子div是其中的一个面板 -->
        <div title="面板一">
            <a class="easyui-linkbutton" onclick="doAdd();">百度</a>
            <script type="text/javascript">
                function doAdd() {
                    // 动态增加一个选项卡面板
                    $("#tt").tabs("add", {
                        title: '这个可是动态的',
                        content: '<iframe frameborder="0" width="100%" height="100%" src="page_base_staff.action"></iframe>',
                        closable: true,
                        iconCls: 'icon-search'
                    })
                }
            </script>
        </div>
        <div title="面板二">test2</div>
        <div title="面板三">test3</div>
    </div>
</div>



<div data-options="region:'center'">
    <!-- 选项卡面板 -->
    <div id="tt" class="easyui-tabs" data-options="fit:true">
        <div title="面板一" data-options="closable:true, iconCls:'icon-edit'">test1</div>
        <div title="面板二">test2</div>
        <div title="面板三">test3</div>
    </div>
</div>


<div data-options="region:'east'" style="width: 100px">东部区域</div>
<div data-options="region:'south'" style="height: 50px">南部区域</div>
</body>
</html>
