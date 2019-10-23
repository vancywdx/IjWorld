<%--
  Created by IntelliJ IDEA.
  User: lcyex
  Date: 2019/10/14
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>爱机饰界-商品详情</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <link href="css/shopping.css" rel="stylesheet" type="text/css" />
    <link href="css/shopping_goods.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.jqzoom.min.js"></script>
    <script type="text/javascript">
        var navID = '0';
        var menuID = '0';
    </script>
    <style>

    </style>
</head>
<body>
    <!-- header -->
    <jsp:include page="common/header.jsp"/>

    <!-- content -->
    <div class="content">
    <div class="goodsinfo">
        <div class="goodspic">
            <div id="focuscont" class="jqzoom">
                <img src="uploadfiles/goods/${goods.goodsPic}" jqimg="uploadfiles/goods/${goods.goodsPic}">
                <span class="ico_zoom"><a href="gallery.php?id=3760" target="_blank"></a></span>
            </div>
        </div>
        <div class="goodstxt">
            <form action="javascript:addToCart(3760)" method="post" name="ECS_FORMBUY" id="ECS_FORMBUY">
                <div class="textinfo">
                    <h2 id="title">${goods.goodsName}</h2>
                    <div class="moreinfo">
                        <div class="lprice">
                            <span style="font-size: 12px;color: #666666"> 促销价：</span><font class="fcc80d00"><span class="price"><em>￥</em><fmt:formatNumber value="${goods.goodsPriceOff}" pattern="0"/><b>.${fn:substringAfter(goods.goodsPriceOff,'.')}</b></span></font>&nbsp;
                            <span class="delline fcabacae" style="font-size: 12px;">        市场价：<em>￥</em><fmt:formatNumber value="${goods.goodsPrice}" pattern="0"/><b>.${fn:substringAfter(goods.goodsPrice,'.')}</b></span>
                        </div>
                    </div>
                    <div class="cle"></div>
                    <div class="cattbox">

                        <div class="catt" id="colorList">
                            <span>颜色：</span>
                            <em>

                                <a class="cattsel" onclick="changeAtt(this)" href="javascript:;" name="184654" title="混搭热销多配 ">混搭热销多配 <input style="display:none" id="spec_value_184654" type="radio" name="spec_5" value="184654" checked=""></a>
                                <a onclick="changeAtt(this)" href="javascript:;" name="184653" title="01粉色">01粉色<input style="display:none" id="spec_value_184653" type="radio" name="spec_5" value="184653"></a>
                                <a onclick="changeAtt(this)" href="javascript:;" name="184652" title="02蓝色">02蓝色<input style="display:none" id="spec_value_184652" type="radio" name="spec_5" value="184652"></a>
                                <input type="hidden" name="spec_list" value="2">
                            </em>
                        </div>
                        <div class="catt" id="colorList">
                            <span>机型：</span>
                            <em>

                                <a class="cattsel" onclick="changeAtt(this)" href="javascript:;" name="184651" title="iPhone11 Pro Max">iPhone11 Pro Max<input style="display:none" id="spec_value_184651" type="radio" name="spec_2" value="184651" checked=""></a>
                                <a onclick="changeAtt(this)" href="javascript:;" name="184650" title="iPhone11 Pro">iPhone11 Pro<input style="display:none" id="spec_value_184650" type="radio" name="spec_2" value="184650"></a>
                                <a onclick="changeAtt(this)" href="javascript:;" name="184649" title="iPhone11">iPhone11<input style="display:none" id="spec_value_184649" type="radio" name="spec_2" value="184649"></a>
                                <a onclick="changeAtt(this)" href="javascript:;" name="168528" title="iPhone XS Max">iPhone XS Max<input style="display:none" id="spec_value_168528" type="radio" name="spec_2" value="168528"></a>
                                <input type="hidden" name="spec_list" value="9">
                            </em>
                        </div>

                    </div>

                    <div class="cle"></div>

                    <div class="jia">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tbody><tr>
                                <td width="70"><span style="font-size:12px;">购买数量：</span></td>
                                <td width="30" align="left">
                                    <a class="btn_cut" href="javascript:;" id="sub">-</a>
                                </td>
                                <td width="30" align="left">
                                    <input name="number" type="text" class="input_num" id="number" value="1" onblur="checkNumber()"/>
                                </td>
                                <td width="30" align="left">
                                    <a class="btn_add" href="javascript:;" id="add">+</a>
                                </td>
                                <td width="70" align="right" class="fc949494">
                                    <span style="font-size:12px;color: #5a5a5a;">库存：${goods.goodsStock}</span>
                                </td>
                            </tr>
                            </tbody></table>
                        <p style="margin-top:15px;font-size:12px;">商品总价：<font class="fcc80d00 fs22"><span id="ECS_GOODS_AMOUNT"><em>￥</em><span id="subtotal_pre"><fmt:formatNumber value='${goods.goodsPriceOff}' pattern='0'/></span><b><span id="subtotal_suf">.${fn:substringAfter(goods.goodsPriceOff,'.')}</span></b></span></font></p>
                    </div>
                </div>

                <div class="spec">
                    <li>
                    </li>
                </div>

                <div class="cle"></div>
                <div class="btnlist">
                    <div class="btn_buy_l yh" style="width:450px;">
                        <ul>
                            <li class="btn_buy02"><a href="javascript:;" id="buyNow" title="立即购买">立即购买</a></li>
                            <li class="btn_buy01"><a href="javascript:;" id="toShopCart" title="加入购物车"><em></em><span>加入购物车</span></a></li>
                        </ul>
                    </div>
                </div>
            </form>
        </div>
    </div>
    </div>
    <!-- footer -->
    <jsp:include page="common/footer.jsp"/>
    <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#sub").click(function(){
                //获取value的值，判断值是否大于1，若是则可以进行减操作
                var value = $("#number").val();
                if(value>1){
                    value = value-1;
                    $("#number").val(value);
                    subtotal();
                }
            })

            $("#add").click(function(){
                //获取value和stock的值，判断value值是否小于stock，若是则可以进行加操作
                var value = parseInt($("#number").val());
                var stock = parseInt(${goods.goodsStock});
                if(value<stock){
                    value = value+1;  //转整数+1
                    $("#number").val(value);
                    subtotal();
                }
            })

            //计算小计
            subtotal = function(){
                var price = parseFloat("${goods.goodsPriceOff}");
                var number = parseInt($("#number").val());
                var subtotal = parseFloat(price * number)+"";
                var index = subtotal.indexOf(".");
                if(index ==-1){
                    var subtotal_pre = subtotal;
                    var subtotal_suf = ".00";
                    $("#subtotal_pre").text(subtotal_pre);
                    $("#subtotal_suf").text(subtotal_suf);
                }else{
                    var subtotal_pre = subtotal.slice(0,index);
                    var subtotal_suf = subtotal.slice(index+1);
                    if(subtotal_suf.length==1){
                        subtotal_suf = subtotal_suf+"0";
                    }
                    $("#subtotal_pre").text(subtotal_pre);
                    $("#subtotal_suf").text("."+subtotal_suf.slice(0,2));
                }

            }

            //数量框的失去焦点事件
            checkNumber = function(){
                var value = parseInt($("#number").val());
                var stock = parseInt(${goods.goodsStock});
                if(value>0 && value<=stock){
                    $("#number").val(value);
                    subtotal();
                }else{
                    layer.msg("超过库存数量，请重新输入...", {icon:5, time:2000}, function(){
                        $("#number").val("1");
                        subtotal();
                    });
                }
            }


            //添加购物车
            $("#toShopCart").click(function(){
                var id = ${goods.id};			    //商品ID
                var count = $("#number").val();	//数量
                $.ajax({
                    url: "shopping/addToShopCart",
                    type: "post",
                    data: "id="+id+"&count="+count,
                    success: function(data){
                        if(data.result){
                            layer.msg(data.data, {icon:6, time:2000});
                        }else{
                            layer.msg(data.data, {icon:5, time:2000});
                        }
                    }
                })
            })

            //立即购买
            $("#buyNow").click(function(){
                $("#toShopCart").trigger("click");
                location.href ="application/shopcart.jsp";
            })
        })
    </script>
</body>
</html>
