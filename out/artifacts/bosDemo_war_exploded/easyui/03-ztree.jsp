<%--
  Created by IntelliJ IDEA.
  User: ChinaLi
  Date: 2020/7/27
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ZTree</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui/jquery.easyui.min.js"></script>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/js/ztree/zTreeStyle.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ztree/jquery.ztree.all-3.5.js"></script>
</head>
<body class="easyui-layout">
<div title="管理系统" data-options="region:'north'" style="height:100px">北部区域</div>

<div title="系统菜单" data-options="region:'west'" style="width: 200px">
    <!-- 折叠面板 -->
    <div class="easyui-accordion" data-options="fit:true">
        <!-- 每个子div是其中的一个面板 -->
        <div title="面板一">
        </div>
        <div title="面板二">
            <!-- 树形菜单 -->
            <!-- 使用标准json数据构造-->
            <ul id="ztree1" class="ztree">

            </ul>
            <script type="text/javascript">
                $(function () {
                    // 当页面加载完后动态创建ztree
                    var setting1 = {} // 设置ztree相关的属性

                    // 构造json数据
                    var zNodes1 = [
                        {name:'系统管理'}, // 每个json对象对应一个节点数据
                        {name: '用户管理', children:[
                                {name:'用户添加'},
                                {name:'用户修改'}
                            ]},
                        {name: '权限管理'}
                    ];

                    // 创建ztree
                    $.fn.zTree.init($("#ztree1"), setting1, zNodes1);
                })
            </script>
        </div>
        <div title="面板三">
            <!-- 使用简单json数据构造 -->
            <ul id="ztree2" class="ztree"></ul>
            <script type="text/javascript">
                $(function () {
                    // 当前页面加载完成后，动态创建ztree菜单
                    var setting2 = {
                        data: {
                            simpleData: {
                                enable: true    // 启用简单json数据描述节点数据
                            }
                        }
                    };

                    var zNodes2 = [
                        {id: '1', pId: '0', name: '系统管理'},
                        {id: '2', pId: '0', name: '用户管理'},
                        {id: '21', pId: '2', name: '用户添加'},
                        {id: '22', pId: '2', name: '用户修改'},
                        {id: '3', pId: '0', name: '权限管理'}
                    ]
                    $.fn.zTree.init($("#ztree2"), setting2, zNodes2);


                })
            </script>
        </div>

        <div title="面板四">
            <ul id="ztree3" class="ztree"></ul>
            <!-- 发送ajax请求获取json数据 -->
            <script type="text/javascript">
                $(function () {
                    var setting3 = {
                        data: {
                            simpleData: {
                                enable: true
                            }
                        },
                        callback: { // 绑定时间
                            onClick: function (a, c, treeNode) {
                                // alert(treeNode.page);
                                var page = treeNode.page;
                                if (page != undefined) {
                                    // 判断当前选项卡是否已经打开
                                    var e = $("#tt").tabs("exists", treeNode.name);
                                    if (e) {
                                        // 已经打开
                                        $("#tt").tabs("select", treeNode.name);
                                    }else {
                                        // 需要打开选项卡
                                        $("#tt").tabs("add", {
                                            title: treeNode.name,
                                            content: '<iframe frameborder="0" width="100%" height="100%" src="' + page + '"></iframe>',
                                            closable: true,
                                            iconCls: 'icon-edit '
                                        });
                                    }
                                }
                            }
                        }

                    };
                    var url = "${pageContext.request.contextPath}/json/menu.json";
                    $.post(url, {}, function (data) {
                        $.fn.zTree.init($("#ztree3"), setting3, data);
                    }, 'json')
                })
            </script>
        </div>
    </div>

</div>

<div data-options="region:'center'">
    <div id="tt" class="easyui-tabs" data-options="fit:true">
    </div>
</div>


<div data-options="region:'east'" style="width: 100px">东部区域</div>
<div data-options="region:'south'" style="height: 50px">南部区域</div>
</body>
</html>
