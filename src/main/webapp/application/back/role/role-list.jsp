<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wdx
  Date: 2019/10/13
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <title>角色管理</title>
</head>
<body id="roleBody">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 角色管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
    <div class="cl pd-5 bg-1 bk-gray">
        <span class="l">
            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
            <a class="btn btn-primary radius" href="javascript:;" onclick="role_add('添加角色','role/toAdd','800','500')"><i class="Hui-iconfont">&#xe600;</i> 添加角色</a>
        </span>
        <span class="r">共有数据：<strong>${pageInfo.total}</strong> 条</span>
    </div>
    <table class="table table-border table-bordered table-hover table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="6">角色管理</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" value="" name=""></th>
            <th width="40">ID</th>
            <th width="200">角色名</th>
            <th>用户列表</th>
            <th width="300">描述</th>
            <th width="70">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="role">
        <tr class="text-c">
            <td><input type="checkbox" value="" name=""></td>
            <td>${role.id}</td>
            <td>${role.roleName}</td>
            <td>
                <c:choose>
                    <c:when test="${empty role.userList}">
                        暂无
                    </c:when>
                    <c:otherwise>
                        <%--用户集合不为空则遍历--%>
                        <c:forEach items="${role.userList}" var="user" varStatus="status"><%--varStatus遍历状态--%>
                            <c:choose>
                                <c:when test="${status.last}">
                                    ${user.username}
                                </c:when>
                                <c:otherwise>
                                    ${user.username},
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>

            </td>
            <td>${role.roleDesc}</td>
            <td class="f-14"><a title="编辑" href="javascript:;" onclick="update_role('角色编辑','role/toUpdate','${role.id}','800','500')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                <a title="删除" href="javascript:;" onclick="del_role(this,'${role.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <jsp:include page="/application/back/common/page.jsp">
        <jsp:param name="bodyId" value="roleBody"/>
    </jsp:include>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
    /*管理员-角色-添加*/
    function role_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*管理员-角色-编辑*/
    function update_role(title,url,id,w,h){
        url = url + "?id="+id;
        layer_show(title,url,w,h);
    }
    /*角色-删除*/
    function del_role(obj,id){
        layer.confirm('角色删除须谨慎，确认要删除吗？',function(index){
            $.ajax({
                url:"role/delRole",
                data:"id="+id,
                success:function (data) {
                    if(data.result){
                        $(obj).parents("tr").remove();
                        layer.msg('删除成功!',{icon:6,time:1000});
                    }else {
                        layer.msg('删除失败!',{icon:5,time:1000});
                    }
                }
            })
        });
    }
</script>
</body>
</html>
