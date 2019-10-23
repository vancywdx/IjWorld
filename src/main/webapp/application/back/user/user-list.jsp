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
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <title>用户管理</title>
</head>
<body id="userBody">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span> 用户列表 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
    <div class="text-c">
        <input type="text" class="input-text" style="width:250px" placeholder="输入用户名" id="userName" value="${userName}" >
        <button type="submit" class="btn btn-success radius" id="" name="" onclick="getUserByCondition()" ><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
            <a href="javascript:;" onclick="add_user('添加用户','sysUser/toAdd')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a></span>
        <span class="r">共有数据：<strong>${pageInfo.total}</strong> 条</span>
    </div>
    <table class="table table-border table-bordered table-hover table-bg table-sort">
        <thead>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="70">ID</th>
            <th width="70">用户名</th>
            <th width="40">性别</th>
            <th width="90">手机</th>
            <th width="150">邮箱</th>
            <th width="130">生日</th>
            <th width="150">个人介绍</th>
            <th width="70">状态</th>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="sysUser">
        <tr class="text-c">
            <td><input type="checkbox" value="1" name=""></td>
            <td>${sysUser.id}</td>
            <td>${sysUser.username}</td>
            <td>${sysUser.sex eq true?"男":"女"}</td>
            <td>${sysUser.phone}</td>
            <td>${sysUser.email}</td>
            <td>
                <fmt:formatDate value="${sysUser.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate>
            </td>
            <td>${sysUser.introduce}</td>
            <td class="td-status">
                ${sysUser.flag ? '<span class="label label-success radius">已启用</span>':'<span class="label label-defaunt radius">已停用</span>'}
            </td>
            <td class="td-manage">
                <c:choose>
                    <c:when test="${sysUser.flag eq 'true'}">
                        <a style="text-decoration:none" onClick="user_stop(this,${sysUser.id})" href="javascript:;" title="停用">
                            <i class="Hui-iconfont">&#xe631;</i>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a style="text-decoration:none" onClick="user_start(this,'${sysUser.id}')" href="javascript:;" title="启用">
                            <i class="Hui-iconfont">&#xe6e1;</i>
                        </a>
                    </c:otherwise>
                </c:choose>
                <a title="编辑" href="javascript:;" onclick="update_user('编辑','sysUser/toUpdate','${sysUser.id}')" class="ml-5" style="text-decoration:none">
                    <i class="Hui-iconfont">&#xe6df;</i>
                </a>
                <a title="删除" href="javascript:;" onclick="del_user(this,'${sysUser.id}')" class="ml-5" style="text-decoration:none">
                    <i class="Hui-iconfont">&#xe6e2;</i>
                </a>
            </td>
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
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">

    function getUserByCondition(){
        var userName= $("#userName").val();
        $("#userBody").load("sysUser/getUserListByCondition",{"userName":userName});
    }

    /*用户-添加*/
    function add_user(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*用户-查看*/
    function member_show(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    /*用户-停用*/
    function user_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            $.ajax({
                url:"sysUser/stopUser",
                data: "id="+id,
                success:function (data) {
                    if(data.result){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="user_start(this,'+id+')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
                        $(obj).remove();
                        layer.msg(data.data,{icon: 6,time:1000});
                    }else {
                        layer.msg(data.data,{icon: 5,time:1000});
                    }
                }
            })

        });
    }

    /*用户-启用*/
    function user_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            $.ajax({
                url:"sysUser/startUser",
                data:"id="+id,
                success:function (data) {
                    if(data.result){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="user_stop(this,'+id+')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                        $(obj).remove();
                        layer.msg(data.data,{icon: 6,time:1000});
                    }else {
                        layer.msg(data.data,{icon: 5,time:1000});
                    }
                }
            })

        });
    }
    /*用户-编辑*/
    function update_user(title,url,id){
        url = url+"?id="+id;
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*用户-删除*/
    function del_user(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                url:"sysUser/del",
                data:"id="+id,
                success:function (data) {
                    if(data.result){
                        $(obj).parents("tr").remove();
                        layer.msg(data.data,{icon: 6,time:1000});
                    }else {
                        layer.msg(data.data,{icon: 5,time:1000});
                    }
                }
            })


        });
    }
</script>
</body>
</html>
