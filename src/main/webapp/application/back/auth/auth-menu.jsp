<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: wdx
  Date: 2019/10/14
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <title>Title</title>
</head>
<body id="userBody">
<div class="pd-20">
    <%--展示一个菜单树--%>
    <div class="zTreeDemoBackground left">
        <ul id="treeDemo" class="ztree"></ul>
        <%--授权新菜单的按钮--%>
        <input type="button" class="btn btn-primary radius" name="" value="授权新菜单" id="resetMenuList"/>
    </div>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.excheck-3.5.js"></script>
<SCRIPT type="text/javascript">
    $(function () {
        var setting = {
            check: {
                enable: true
            },

            data: {
                key: {
                    name: "menuName"
                },
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "menuParentid",
                }
            }
        };

        var zNodes =${sysMenuVOList}
            /*       [
                   { id:1, pId:0, name:"随意勾选 1", open:true},
                   { id:11, pId:1, name:"随意勾选 1-1", open:true},
                   { id:111, pId:11, name:"随意勾选 1-1-1"},
                   { id:112, pId:11, name:"随意勾选 1-1-2"},
                   { id:12, pId:1, name:"随意勾选 1-2", open:true},
                   { id:121, pId:12, name:"随意勾选 1-2-1"},
                   { id:122, pId:12, name:"随意勾选 1-2-2"},
                   { id:2, pId:0, name:"随意勾选 2", checked:true, open:true},
                   { id:21, pId:2, name:"随意勾选 2-1"},
                   { id:22, pId:2, name:"随意勾选 2-2", open:true},
                   { id:221, pId:22, name:"随意勾选 2-2-1", checked:true},
                   { id:222, pId:22, name:"随意勾选 2-2-2"},
                   { id:23, pId:2, name:"随意勾选 2-3"}
               ];*/

            $.fn.zTree.init($("#treeDemo"), setting, zNodes);



        $("#resetMenuList").click(function () {
            var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
            var nodes = treeObj.getCheckedNodes(true);//拿到的是一个数组
            if(nodes.length==0){
                layer.msg("请先选择菜单",{icon:6,time:2000})
                return;
            }
            var ids = [];
            for(var i=0;i<nodes.length;i++){
                ids.push(nodes[i].id)
            }

            $.ajax({//获取选中的菜单id，传到后台
                url:"auth/resetMenuList",
                type:"GET",
                data:"ids="+ids+"&roleId="+${roleId},
                success:function (data) {
                    if(data.result){
                        layer.msg("授权新菜单成功",{icon:6,time:2000})
                    }else {
                        layer.msg("授权新菜单失败",{icon:5,time:2000})
                    }
                }
            })
        })
    })




</SCRIPT>
</body>
</html>

