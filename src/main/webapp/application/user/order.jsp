<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: lcyex
  Date: 2019/10/14
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>爱机饰界-我的订单</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <link href="css/layui-page.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

    <script type="text/javascript">
        var navID = '0';
        var menuID = '0';
    </script>
</head>
<body>
    <!-- header -->
    <jsp:include page="../common/header.jsp"/>
    <div style="height: 10px"></div>
    <div class="Contain">
        <div class="Silderbar">
            <div class="menu">
                <h3 class="h3"><img src="images/brand_img_03.png" width="13" height="13" />个人中心</h3>
                <ul>
                    <li id="menu1"><span><a href="application/user/information.jsp">我的资料</a></span></li>
                    <li id="menu2" class="onmenu"><span><a href="sysUser/getOrderListByUserId">我的订单</a></span></li>
                    <li id="menu3"><span><a href="sysUser/getAddressListByUserId">我的收货地址</a></span></li>
                    <li id="menu4"><span><a href="application/shopcart.jsp">我的收藏夹</a></span></li>
                </ul>
            </div>
            <script type="text/javascript">
                $("#menu"+menuID).addClass("onmenu");
                $(".menu ul li:last").css("border","none");
            </script>
            <style>
                a.two:link { color: #333333; text-decoration: none}
                a.two:visited { color: #606060; text-decoration: none}
                a.two:hover { color: #e03127; text-decoration: none}
                a.two:active { color: #606060; text-decoration: none}
            </style>
        </div>
        <div class="MainContentBox">
            <div class="ColumnName">当前位置：<a href="#">个人中心</a>-<span>我的订单</span></div>
            <div class="Content" style="text-align: center;margin: 10 1 10 0;">
                <table class="layui-table" style="margin: auto">
                    <colgroup>
                        <col width="60px">
                        <col width="100px">
                        <col width="90px">
                        <col width="100px">
                        <col width="100px">
                        <col width="100px">
                        <col width="100px">
                    </colgroup>

                    <thead>
                    <tr>
                        <th>订单ID</th>
                        <th>下单日期</th>
                        <th>支付金额</th>
                        <th>收货人</th>
                        <th>订单状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${orderList}" var="order">
                        <tr>
                            <td>${order.id}</td>
                            <td><fmt:formatDate value="${order.oOrderdate}" pattern="yyyy年MM月dd日"/> </td>
                            <td>￥<fmt:formatNumber value="${order.oPaycount}" pattern="0.00"/> </td>
                            <td>${order.oReceiver}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${order.oOrderstatus eq '3'}">
                                        已取消
                                    </c:when>
                                    <c:when test="${order.oOrderstatus eq '4'}">
                                        已完成
                                    </c:when>
                                    <c:when test="${order.oPaystatus}">
                                        已付款&nbsp;&nbsp;&nbsp;
                                        <c:choose>
                                            <c:when test="${order.oShippingstatus}">
                                                已发货
                                            </c:when>
                                            <c:otherwise>
                                                未发货
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${order.oOrderstatus eq '3'}">
                                        <a href="javascript:;" onclick="order_del(${order.id})" class="two">删除订单</a>
                                    </c:when>
                                    <c:when test="${order.oOrderstatus eq '4'}">
                                        <a href="javascript:;" onclick="order_cancle(${order.id})" class="two">删除订单</a>
                                    </c:when>
                                    <c:when test="${order.oPaystatus}">
                                        <a href="javascript:;" onclick="order_cancle(${order.id})" class="two">取消订单</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="" class="two">取消订单</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="clear"></div>
    </div>

    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".brand .con ul li").each(function(index, element) {
                if(($(this).index()+1)%4==0){
                    $(this).addClass("li");
                }
            });

            //取消订单
            order_cancle = function(id){
                layer.confirm('确定取消该订单？', function(index){
                    $.ajax({
                        url: "sysUser/cancleOrder",
                        type: "post",
                        data: "id="+id,
                        success: function(data){
                            if(data.result){
                                layer.msg(data.data, {icon:6, time:1000},function(){
                                    location.reload();
                                });

                            }else{
                                layer.msg(data.data, {icon:5, time:1000});
                            }
                        }
                    })
                    layer.close(index);
                });
            }

            //删除订单
            order_del = function(id){
                layer.confirm('确定删除该订单？', function(index){
                    $.ajax({
                        url: "sysUser/deleteOrderById",
                        type: "post",
                        data: "id="+id,
                        success: function(data){
                            if(data.result){
                                layer.msg(data.data, {icon:6, time:1000},function(){
                                    location.reload();
                                });

                            }else{
                                layer.msg(data.data, {icon:5, time:1000});
                            }
                        }
                    })
                    layer.close(index);
                });
            }
        })
    </script>
    <!-- footer -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
