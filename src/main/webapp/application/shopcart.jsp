<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>爱机饰界-我的购物车</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <link href="/css/shopping_cart.css" rel="stylesheet" type="text/css" />
    <link href="css/shopping.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        var navID = '0';
        var menuID = '0';
    </script>
    <style>
        body{
            background-color: #fefffe;

        }
        table{
            font: normal 13px/1.6 Tahoma,Arial,Geneva,sans-serif,"宋体";
            color: #333;
        }

    </style>
</head>
<body>
    <!-- header -->
    <jsp:include page="common/header.jsp"/>

    <!-- content -->
    <div class="main">
        <div class="flowBox">

            <form id="shopCart" name="shopCart">
                <table width="100%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                    <tbody>
                    <tr>
                        <th bgcolor="#efefef">商品名称</th>
                        <th bgcolor="#efefef">市场价</th>
                        <th bgcolor="#efefef">促销价</th>
                        <th bgcolor="#efefef">购买数量</th>
                        <th bgcolor="#efefef">小计</th>
                        <th bgcolor="#efefef">操作</th>
                    </tr>

                    <c:forEach items="${shopCart.list}" var="goods">
                        <tr id="${goods.id}">
                            <td bgcolor="#ffffff">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tbody><tr>
                                        <td width="23%" align="center">
                                            <a href="goods-3480.html" target="_blank"><img src="uploadfiles/goods/${goods.goodsPic}" border="0" title="${goods.goodsName}" style="width:120px;height:120px;"></a>
                                        </td>
                                        <td width="77%">
                                            <a href="goods-3480.html" target="_blank" class="f6">${goods.goodsName}</a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td align="center" bgcolor="#ffffff" class="delline fcabacae"><em>￥</em><fmt:formatNumber value="${goods.goodsPrice}" pattern="0.00"/></td>
                            <td align="center" bgcolor="#ffffff" class="fcff0000" id="goods_price_112428"><em style="color: #FF0000 ">￥</em><fmt:formatNumber value="${goods.goodsPriceOff}" pattern="0.00"/></td>
                            <td align="center" bgcolor="#ffffff">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tbody>
                                    <tr>
                                        <td>
                                            <a href="javascript:void(0)" onclick="sub(${goods.id},${goods.goodsPriceOff})"><img src="images/jian.gif" alt="减"></a>
                                            <input type="text" name="number" id="number_${goods.id}" value="${goods.count}" size="4" class="input_num" onblur="checkNumber(${goods.id},${goods.goodsStock},${goods.goodsPriceOff})">
                                            <a href="javascript:void(0)" onclick="add(${goods.id},${goods.goodsStock},${goods.goodsPriceOff})"><img src="images/jia.gif" alt="加"></a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td align="center" bgcolor="#ffffff" id="subtotal" class="fcff0000"><em style="color: #FF0000 ">￥</em><fmt:formatNumber value="${goods.goodsPriceOff*goods.count}" pattern="0.00"/></td>
                            <td align="center" bgcolor="#ffffff">
                                <a href="javascript:;" onclick="remove(this,${goods.id})" class="btn_blue_2">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <table width="100%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                    <tbody><tr>
                        <td bgcolor="#ffffff" id="total_desc">
                    <span class="fcff0000">购物金额总计 <em style="color: #FF0000 ">￥</em>
                        <fmt:formatNumber value="${shopCart.price}" pattern="0.00"/>
                    </span>，
                            <span class="fc949494 delline">比市场价 <em>￥</em>
                        <fmt:formatNumber value="${shopCart.originalPrice}" pattern="0.00"/> 节省了 <em>￥</em>
                        <fmt:formatNumber value="${shopCart.priceDifference}" pattern="0.00"/>
                        （<fmt:formatNumber type="percent" value="${shopCart.save}" pattern="0.00%"/>）
                    </span>
                        </td>
                        <td align="right" bgcolor="#ffffff">
                            <input name="update" type="button" class="btn_blue_1" onclick="location.reload()" value="更新购物车">
                        </td>
                    </tr>
                    </tbody></table>
                <input type="hidden" name="step" value="update_cart">
            </form>
            <table width="100%" align="center" border="0" cellpadding="5" cellspacing="0" bgcolor="#dddddd">
                <tbody><tr>
                    <td width="88%" align="right" bgcolor="#ffffff"><a href="goods/getGoodsList"><img src="images/continue.gif" alt="continue"></a></td>
                    <td width="12%" align="right" bgcolor="#ffffff"><a href="javascript:;"  onclick="settlement()"><img src="images/checkout.gif" alt="checkout"></a></td>
                </tr>
                </tbody>
            </table>

            <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
            <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
            <script type="text/javascript">

                $(function(){

                    sub = function(id,price){
                        //获取value的值，判断值是否大于1，若是则可以进行减操作
                        var value = $("#number_"+id).val();
                        if(value>1){
                            value = value-1;
                            $("#number_"+id).val(value);
                            //更新数据库
                            update(id,value);
                        }
                    }

                    add = function(id,stock,price){
                        //获取value和stock的值，判断value值是否小于stock，若是则可以进行加操作
                        var value = parseInt($("#number_"+id).val());
                        if(value<stock){
                            value = value+1;  //转整数+1
                            $("#number_"+id).val(value);
                            //更新数据库
                            update(id,value);
                        }
                    }

                    //数量框的失去焦点事件
                    checkNumber = function(id,stock,price){
                        var value = parseInt($("#number_"+id).val());
                        if(value>0 && value<=stock){
                            $("#number_"+id).val(value);
                            //更新数据库
                            update(id,value);
                        }else{
                            layer.msg("库存数量不符，请重新输入...", {icon:5, time:2000}, function(){
                                $("#number_"+id).val("1");
                                //更新数据库
                                update(id,value);
                            });
                        }
                    }

                    //更新数据库
                    update = function(id, count){
                        $.ajax({
                            url: "shopping/updateShopCart",
                            type: "post",
                            data: "id="+id+"&count="+count,
                            success: function(){
                                location.reload();
                            }
                        })
                    }

                    //购物车删除
                    remove = function(obj,id){
                        layer.confirm('确认要删除该商品吗？',function(index){
                            $.ajax({
                                url: "shopping/removeOutShopCart",
                                type: "post",
                                data: "id="+id,
                                success:function(data){
                                    if(data.result){
                                        $(obj).parents("tr").remove();
                                        layer.msg(data.data,{icon:6,time:2000});
                                    }else{
                                        layer.msg(data.data,{icon:5,time:2000});
                                    }
                                }
                            })
                        });
                    }

                    //购物结算
                    settlement = function(){
                        if(${frontUser==null}){
                            layer.confirm('亲，您还没有登录哦，是否立即登录？', function(index){
                                location.href= "application/login.jsp";

                                layer.close(index);
                            });
                        }else{
                            if(${shopCart==null}){
                                layer.confirm('购物车为空，立即前往商城挑选吧！', function(index){
                                    location.href= "goods/getGoodsList";

                                    layer.close(index);
                                });
                            }else{
                                location.href = "shopping/settlement";
                            }
                        }
                    }

                })
            </script>
        </div>
    </div>
    <!-- footer -->
    <jsp:include page="common/footer.jsp"/>
</body>
</html>
