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
    <title>订单管理</title>
</head>
<body id="orderBody">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单管理 <span class="c-gray en">&gt;</span> 订单列表 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
    <div class="text-c">
        <input type="text" class="input-text" style="width:250px" placeholder="输入订单号" id="orderId" value="${id}" >
        <button type="submit" class="btn btn-success radius" id="" name="" onclick="getOrderByOrderId()" ><i class="Hui-iconfont">&#xe665;</i> 搜订单</button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="batch_delivery()" class="btn btn-primary radius">批量发货</a>
        </span>
        <span class="r">共有数据：<strong>${pageInfo.total}</strong> 条</span>
    </div>
    <table class="table table-border table-bordered table-hover table-bg table-sort">
        <thead>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="50">订单ID</th>
            <th width="70">快递公司</th>
            <th width="60">支付方式</th>
            <th width="60">支付金额</th>
            <th width="100">下单日期</th>
            <th width="70">收货人</th>
            <th width="100">收货电话</th>
            <th width="180">收货地址</th>
            <th width="70">订单状态</th>
            <th width="70">发货状态</th>
            <th width="70">付款状态</th>
            <th width="70">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="order">
        <tr class="text-c">
            <td><input type="checkbox" value="${order.id}" class="checkItem"></td>
            <td>${order.id}</td>
            <td>${order.oExpress}</td>
            <td>${order.oPaytype}</td>
            <td>${order.oPaycount}</td>
            <td>
                <fmt:formatDate value="${order.oOrderdate}" pattern="yyyy-MM-dd"></fmt:formatDate>
            </td>
            <td>${order.oReceiver}</td>
            <td>${order.oRecphone}</td>
            <td>${order.oRecaddres}</td>
            <td class="td-status">
                <c:choose>
                    <c:when test="${order.oOrderstatus eq '1'}">
                        <span class="label label-defaunt radius">待付款</span>
                    </c:when>
                    <c:when test="${order.oOrderstatus eq '2'}">
                        <span class="label label-warning radius">已付款</span>
                    </c:when>
                    <c:when test="${order.oOrderstatus eq '3'}">
                        <span class="label label-danger radius">已取消</span>
                    </c:when>
                    <c:otherwise>
                        <span class="label label-success radius">已完成</span>
                    </c:otherwise>
                </c:choose>
            </td>
            <td class="td-status">
                    ${order.oShippingstatus ? '<span class="label label-success radius">已发货</span>':'<span class="label label-defaunt radius">未发货</span>'}
            </td>
            <td class="td-status">
                    ${order.oPaystatus ? '<span class="label label-success radius">已付款</span>':'<span class="label label-defaunt radius">未付款</span>'}
            </td>

            <td>
                <a title="详情" href="javascript:;" onclick="update_user('订单详情','order/getOrderDetailById','${order.id}','800','500')" class="ml-5" style="text-decoration:none">
                    <i class="Hui-iconfont">&#xe623;</i>
                </a>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <jsp:include page="/application/back/common/page.jsp">
        <jsp:param name="bodyId" value="orderBody"/>
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
    //按订单编号查询订单
    function getOrderByOrderId(){
        var id= $("#orderId").val();
        $("#orderBody").load("order/getOrderByCondition",{"id":id});
    }
    //批量发货
    function batch_delivery(){
        layer.confirm('确认要给这些用户发货吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            var check = $(".checkItem:checked");
            if(check.length==0){
                layer.msg('还没选择要发货的用户，请先选择!',{icon: 5,time:2000});
                return;
            }
            var ids = [];
            for(var i=0;i<check.length;i++){
                ids.push(check[i].value)
            }

            console.log(ids);
            //下面异步发送请求进行批量发货
            $.ajax({
                url:"order/batchDelivery",
                type:"GET",
                data:"ids="+ids,
                success:function (data) {
                    if(data.result){
                        layer.msg("批量发货成功",{icon:6,time:1000},function () {
                            location.reload();
                        });
                    }else {
                        layer.msg("批量发货失败",{icon:5,time:1000});
                    }
                }
            })
        })
    }
    /*用户-添加*/
    function add_user(title,url,w,h){
        layer_show(title,url,w,h);
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
                        layer.msg('已停用!',{icon: 5,time:1000});
                    }else {
                        layer.msg('停用失败!',{icon: 5,time:1000});
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
                        layer.msg('已启用!',{icon: 6,time:1000});
                    }else {
                        layer.msg('启用失败!',{icon: 6,time:1000});
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
