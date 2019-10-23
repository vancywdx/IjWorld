<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: wdx
  Date: 2019/10/14
  Time: 15:17
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

<div class="pd-20">
    <div class="text-c">
        <div class="row cl ">
            <div class="formControls col-3">
                登录名: <input type="text" class="input-text" style="width: 250px" id="userName" value="${userName}">
            </div>

        </div>
        <div class="row cl">
            <div class="cl pd-5">
                <button type="button"
                        class="btn btn-success radius" id="query" name="" onclick="getUserByCondition()">
                    <i class="Hui-iconfont">&#xe665;</i> 搜用户

                </button>
            </div>
        </div>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
        <a href="javascript:;" onclick="batch_add_user()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 批量授权</a>
       </span>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">用户信息</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="40">编号</th>
            <th width="150">姓名</th>
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
                <td><input type="checkbox" value="${sysUser.id}" class="checkItem"></td>
                <td>${sysUser.id}</td>
                <td>${sysUser.username}</td>
                <td>${sysUser.phone}</td>
                <td>${sysUser.email}</td>
                <td>
                    <fmt:formatDate value="${sysUser.birthday}" pattern="yyyy-MM--dd"></fmt:formatDate>
                </td>
                <td>${sysUser.introduce}</td>
                <td class="td-manage"><a style="text-decoration:none" ><i class="Hui-iconfont">&#xe631;</i></a>
                    <a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','admin-add.html','1','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                    <a title="删除" href="javascript:;" onclick="del_user(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <jsp:include page="/application/back/common/page.jsp">
        <jsp:param name="bodyId" value="userBody"/>
    </jsp:include>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">

    function batch_add_user(){
        layer.confirm('确认要授权这些用户吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            var check = $(".checkItem:checked");
            if(check.length==0){
                layer.msg('还没选择要授权的用户，请先选择!',{icon: 5,time:2000});
                return;
            }
            var ids = [];
            for(var i=0;i<check.length;i++){
                ids.push(check[i].value)
            }

            console.log(${roleId});
            console.log(ids);
            //下面授权用户
            $.ajax({
                url:"auth/batchAuthUser",
                type:"GET",
                data:"ids="+ids+"&roleId="+${roleId},
                success:function (data) {
                    if(data.result){
                        layer.msg("批量授权成功",{icon:6,time:2000},function () {
                            location.reload();
                        });
                    }else {
                        layer.msg("批量授权失败",{icon:5,time:2000});
                    }
                }
            })
        })
    }

    function getUserByCondition(){
        var userName= $("#userName").val();
        $("#userBody").load("auth/getNoAuthUserByRoleId",{"userName":userName,"roleId":${roleId}});
    }
</script>
</body>
</html>

