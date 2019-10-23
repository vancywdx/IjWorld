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
    <title>爱机饰界-我的收货地址</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <link href="css/layui-page.css" rel="stylesheet" type="text/css" />
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
                    <li id="menu2"><span><a href="sysUser/getOrderListByUserId">我的订单</a></span></li>
                    <li id="menu3" class="onmenu"><span><a href="sysUser/getAddressListByUserId">我的收货地址</a></span></li>
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
            <div class="ColumnName">当前位置：<a href="#">个人中心</a>-<span>我的收货地址</span></div>
            <div class="Content" style="text-align: center;margin: 10 1 10 0;">
                <table class="layui-table" style="margin: auto">
                    <colgroup>
                        <col>
                        <col>
                        <col>
                        <col>
                    </colgroup>

                    <thead>
                    <tr>
                        <th>收货人</th>
                        <th>手机号码</th>
                        <th>地址</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${addressList}" var="address">
                        <tr>
                            <td>${address.receiver}</td>
                            <td>${address.phone}</td>
                            <td>${address.address}</td>
                            <td>

                                <a href="javascript:;" onclick="address_edit('编辑收货地址','address/toUpdate','${address.id}','','310')" class="two">编辑</a>
                                <a href="javascript:;" onclick="address_del(${address.id})" class="two">删除</a>
                                <a href="javascript:;" onclick="address_del(${order.id})" class="two">设为默认</a>
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
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
    <script type="text/javascript">

        //收货地址-编辑
        function address_edit(title,url,id,w,h){
            url = url + "?id="+id;
            layer_show(title,url,w,h);
        }

        //删除地址
        address_del = function(id){
            layer.confirm('确定删除该地址？', function(index){
                $.ajax({
                    url: "adress/deleteAdressById",
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

        $(function(){
            $(".brand .con ul li").each(function(index, element) {
                if(($(this).index()+1)%4==0){
                    $(this).addClass("li");
                }
            });
        })
    </script>
    <!-- footer -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
