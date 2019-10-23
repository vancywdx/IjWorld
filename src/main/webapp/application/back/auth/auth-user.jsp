<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: lcyex
  Date: 2019/10/11
  Time: 11:13
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
    <title>Title</title>
</head>
<body id="userBody">
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">用户列表</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="40">编号</th>
            <th width="150">用户名</th>
            <th width="90">手机</th>
            <th width="150">邮箱</th>
            <th width="130">生日</th>
            <th width="100">个人简介</th>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="sysUser">
            <tr class="text-c">
                <td><input type="checkbox" value="1" name=""></td>
                <td>${sysUser.id}</td>
                <td>${sysUser.username}</td>
                <td>${sysUser.phone}</td>
                <td>${sysUser.email}</td>
                <td>
                    <fmt:formatDate value="${sysUser.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate>
                </td>
                <td>${sysUser.introduce}</td>
                <td class="td-manage">
                    <a style="text-decoration:none" onClick="admin_stop(this,'10001')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
                    <a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','admin-add.html','1','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                    <a title="删除" href="javascript:;" onclick="del_auth_user(this,${sysUser.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--展示分页导航条--%>
    <jsp:include page="/application/back/common/page.jsp">
        <jsp:param name="bodyId" value="authorization"></jsp:param>
    </jsp:include>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">

    //# sourceMappingURL=file.js.map

    /*管理员-删除*/
    function del_auth_user(obj,id){
        layer.confirm('确认要解除授权用户吗？',function(index){
            //发送异步请求，去删除角色用户关系表中的记录
            $.ajax({
                url:"auth/delAuthUserById",
                type:"GET",
                data:"userId="+id+"&roleId="+${roleId},
                success:function(data){
                    if(data.result){
                        $(obj).parents("tr").remove();
                        layer.msg('删除成功!',{icon:6,time:2000});
                    }else{
                        layer.msg('删除失败!',{icon:5,time:2000});
                    }
                }
            })


        });
    }

</script>
</body>
</html>
