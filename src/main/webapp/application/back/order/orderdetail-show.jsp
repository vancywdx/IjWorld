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
    <title>订单详情</title>
</head>
<body id="orderBody">

        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="80">商品图片</th>
                <th width="300">商品名称</th>
                <th width="50">商品价格</th>
                <th width="50">商品数量</th>
                <th width="70">小计</th>
            </tr>
            </thead>
            <tbody>
            <c:set value="0" var="sum" />
            <c:forEach items="${orderDetailList}" var="detail">
            <tr class="text-c">
                <td><img height="60px" width="60px" src="uploadfiles/goods/${detail.goodsPic}"></td>
                <td>${detail.goodsName}</td>
                <td>${detail.goodsPrice}</td>
                <td>${detail.goodsNum}</td>
                <td>${detail.goodsTotalPrice}</td>
                <c:set value="${sum + detail.goodsTotalPrice}" var="sum" />
            </tr>
            </c:forEach>
            </tbody>
        </table>
        <table>
                <td class="bold right" style="text-align: right ;font-size: larger" ><b>总计：<span style="color: red"> ${sum} </span>元</b></td>
            </tr>
        </table>


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
