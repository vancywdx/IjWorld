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
    <title>地址管理</title>
</head>
<body id="addressBody">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span> 收货地址管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
    <div class="text-c">
        <input type="text" class="input-text" style="width:250px" placeholder="输入用户名" id="userName" value="${userName}" >
        <button type="submit" class="btn btn-success radius" id="" name="" onclick="getAddressByCondition()" ><i class="Hui-iconfont">&#xe665;</i> 搜地址</button>
    </div>

    <div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="50">ID</th>
                <th width="70">收货人</th>
                <th width="60">电话</th>
                <th width="150">地址</th>
                <th width="50">是否默认</th>
                <th width="50">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="address">
            <tr class="text-c">
                <td><input type="checkbox" value="${address.id}" class="checkItem"></td>
                <td>${address.id}</td>
                <td>${address.receiver}</td>
                <td>${address.phone}</td>
                <td>${address.address}</td>
                <td class="td-status">
                        ${address.isDefault eq '1' ? '<span class="label label-success radius">是</span>':'<span class="label label-defaunt radius">否</span>'}
                </td>
                <td class="td-manage">
                    <c:choose>
                        <c:when test="${address.isDefault eq '1'}">
                            <a style="text-decoration:none" onClick="cancle_default(this,'${address.id}')" href="javascript:;" title="取消默认">
                                <i class="Hui-iconfont">&#xe631;</i>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a style="text-decoration:none" onClick="address_default(this,${address.id})" href="javascript:;" title="设为默认">
                                <i class="Hui-iconfont">&#xe6e1;</i>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        <jsp:include page="/application/back/common/page.jsp">
            <jsp:param name="bodyId" value="addressBody"/>
        </jsp:include>
    </div>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
    //按订单编号查询订单
    function getAddressByCondition(){
        var userName= $("#userName").val();
        $("#addressBody").load("address/getAddressByCondition",{"userName":userName});
    }

    /*用户-添加*/
    function add_user(title,url,w,h){
        layer_show(title,url,w,h);
    }


    /*用户-查看*/
    function member_show(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    /*取消默认*/
    function cancle_default(obj,id){
        layer.confirm('确认要取消默认吗？',function(index){
            $.ajax({
                url:"address/cancleDefault",
                data: "id="+id,
                success:function (data) {
                    if(data.result){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="address_default(this,'+id+')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">否</span>');
                        $(obj).remove();
                        layer.msg('取消默认成功!',{icon: 6,time:1000});
                    }else {
                        layer.msg('取消默认失败!',{icon: 5,time:1000});
                    }
                }
            })

        });
    }

    /*设为默认*/
    function address_default(obj,id){
        layer.confirm('确认要设为默认吗？',function(index){
            $.ajax({
                url:"address/addressDefault",
                data:"id="+id,
                success:function (data) {
                    if(data.result){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="cancle_default(this,'+id+')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">是</span>');
                        $(obj).remove();
                        layer.msg('设为默认成功!',{icon: 6,time:1000});
                    }else {
                        layer.msg('设为默认失败!',{icon: 5,time:1000});
                    }
                }
            })

        });
    }
    /*用户-编辑*/
    function update_user(title,url,id,w,h){
        url = url+"?id="+id;
        layer_show(title,url,w,h);
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
