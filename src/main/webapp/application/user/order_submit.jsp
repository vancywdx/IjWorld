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
    <title>爱机饰界-提交订单</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <link href="lib/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="/lib/AmazeUI-2.4.2/assets/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="lib/AmazeUI-2.4.2/assets/css/cartstyle.css" rel="stylesheet" type="text/css" />
    <link href="lib/AmazeUI-2.4.2/assets/css/jsstyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        var navID = '9';
        var menuID = '0';
    </script>
</head>
<body>
    <!-- header -->
    <jsp:include page="../common/header.jsp"/>
    <div class="concent">
        <!--地址 -->
        <div class="paycont">
            <div class="address" style="margin:10 1 0 0;">
                <h3>确认收货地址 </h3>
                <div class="control">
                    <div class="tc-btn createAddr theme-login am-btn am-btn-danger"><a href="addAddress.jsp" style="color: white;">使用新地址</a></div>
                </div>
                <div class="clear"></div>
                <ul class="addressChoose">
                    <c:forEach items="${addressList}" var="addr">
                        <!-- 默认地址：class="user-addresslist defaultAddr" -->
                        <c:choose>
                            <c:when test="${addr.isDefault eq '1'}">
                                <li class="user-addresslist defaultAddr">
                            </c:when>
                            <c:otherwise>
                                <li class="user-addresslist">
                            </c:otherwise>
                        </c:choose>
                        <div class="address-left">
                            <div class="user DefaultAddr">
                                <span class="buy-address-detail"></span>
                                <span class="buy-user">${addr.receiver}</span>
                                <span class="buy-phone">${addr.phone}</span>
                            </div>

                            <div class="default-address DefaultAddr">
                                <span class="buy-line-title buy-line-title-type">收货地址：</span>
                                <span class="buy--address-detail">${addr.address}</span>
                            </div>
                            <c:if test="${addr.isDefault eq '1'}">
                                <ins class="deftip">默认地址</ins>
                            </c:if>
                        </div>
                        <div class="new-addr-btn">
                            <span class="new-addr-bar hidden">|</span>
                            <a href="#">编辑</a>
                            <span class="new-addr-bar">|</span>
                            <a href="javascript:void(0);" onclick="delClick(this);">删除</a>
                        </div>
                        </li>
                    </c:forEach>
                </ul>
                <div class="clear"></div>
            </div>
            <!--物流 -->
            <div class="logistics">
                <h3>选择物流方式</h3>
                <ul class="op_express_delivery_hot">
                    <li data-value="yuantong" class="OP_LOG_BTN "><i class="c-gap-right" style="background-position:0px -468px"></i>圆通<span id="圆通"></span></li>
                    <li data-value="shentong" class="OP_LOG_BTN "><i class="c-gap-right" style="background-position:0px -1008px"></i>申通<span id="申通"></span></li>
                    <li data-value="yunda" class="OP_LOG_BTN "><i class="c-gap-right" style="background-position:0px -576px"></i>韵达<span id="韵达"></span></li>
                    <li data-value="zhongtong" class="OP_LOG_BTN op_express_delivery_hot_last"><i class="c-gap-right" style="background-position:0px -324px"></i>中通<span id="中通"></span></li>
                    <li data-value="shunfeng" class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i class="c-gap-right" style="background-position:0px -180px"></i>顺丰<span id="顺丰"></span></li>
                </ul>
            </div>
            <div class="clear"></div>

            <!--支付方式-->
            <div class="logistics">
                <h3>选择支付方式</h3>
                <ul class="pay-list">
                    <li class="pay card"><img src="images/wangyin.jpg" />银联<span id="银联"></span></li>
                    <li class="pay qq"><img src="images/weizhifu.jpg" />微信<span id="微信"></span></li>
                    <li class="pay taobao"><img src="images/zhifubao.jpg" />支付宝<span id="支付宝"></span></li>
                </ul>
            </div>
            <div class="clear"></div>

            <!--订单 -->
            <div class="concent">
                <div id="payTable">
                    <h3>确认订单信息</h3>
                    <div class="cart-table-th">
                        <div class="wp">

                            <div class="th th-item">
                                <div class="td-inner">商品信息</div>
                            </div>
                            <div class="th th-price">
                                <div class="td-inner">单价</div>
                            </div>
                            <div class="th th-amount">
                                <div class="td-inner">数量</div>
                            </div>
                            <div class="th th-sum">
                                <div class="td-inner">金额</div>
                            </div>
                            <div class="th th-oplist">
                                <div class="td-inner">配送方式</div>
                            </div>

                        </div>
                    </div>
                    <div class="clear"></div>

                    <c:forEach items="${shopCart.list}" var="goods">
                        <!-- 购物车 -->
                        <tr class="item-list">
                            <div class="bundle  bundle-last">

                                <div class="bundle-main">
                                    <ul class="item-content clearfix">
                                        <div class="pay-phone">
                                            <li class="td td-item">
                                                <div class="item-pic">
                                                    <a href="#" class="J_MakePoint">
                                                        <img src="uploadfiles/goods/${goods.goodsPic}" style="width: 80px; height: 80px" class="itempic J_ItemImg"></a>
                                                </div>
                                                <div class="item-info">
                                                    <div class="item-basic-info">
                                                        <a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11">${goods.goodsName}</a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="td td-price">
                                                <div class="item-price price-promo-promo">
                                                    <div class="price-content">
                                                        <div class="price-line">
                                                            <em class="price-original"></em>
                                                        </div>
                                                        <div class="price-line">
                                                            <em class="J_Price price-now" id="priceNow" tabindex="0">${goods.goodsPriceOff}</em>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </div>
                                        <li class="td td-amount">
                                            <div class="amount-wrapper ">
                                                <div class="item-amount ">
                                                    <span class="phone-title"></span>
                                                    <div class="sl">
                                                        <input class="min am-btn" onclick="sub(${goods.id},${goods.goodsPriceOff})" name="" type="button" value="-" id="jian"/>
                                                        <input class="text_box" type="text" name="number" id="number_${goods.id}" value="${goods.count}" style="width: 30px; text-align: center;"/>
                                                        <input class="add am-btn" onclick="add(${goods.id},${goods.goodsStock},${goods.goodsPriceOff})" name="" type="button" value="+"  id="jia"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="td td-sum">
                                            <div class="td-inner">
                                                <em tabindex="0" class="J_ItemSum number" id="singlePrice"><fmt:formatNumber type="number" value="${goods.goodsPriceOff*goods.count}" pattern="0.00"/></em>
                                            </div>
                                        </li>
                                        <li class="td td-oplist">
                                            <div class="td-inner">
                                                <span class="phone-title">配送方式</span>
                                                <div class="pay-logis">
                                                    快递<b class="sys_item_freprice">10</b>元
                                                </div>
                                            </div>
                                        </li>

                                    </ul>
                                    <div class="clear"></div>

                                </div>
                        </tr>

                    </c:forEach>

                    <div class="clear"></div>
                </div>


                <!--信息 -->
                <div class="order-go clearfix">
                    <div class="pay-confirm clearfix">
                        <div class="box">
                            <div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
                                <span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee"><fmt:formatNumber type="number" value="${shopCart.price}" pattern="0.00"/></em>
											</span>
                            </div>

                            <div id="holyshit268" class="pay-address">

                                <p class="buy-footer-address">
                                    <span class="buy-line-title buy-line-title-type">寄送至：</span>
                                    <span class="buy--address-detail" id="send">

												</span>
                                </p>
                                <p class="buy-footer-address">
                                    <span class="buy-line-title">收货人：</span>
                                    <span class="buy-address-detail">
                                         <span class="buy-user" id="person"> </span>
												<span class="buy-phone" id="tel"></span>
												</span>
                                </p>
                            </div>
                        </div>

                        <div id="holyshit269" class="submitOrder">
                            <div class="go-btn-wrap">
                                <a id="order_add" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
                            </div>
                            <form id="form_order_add">
                                <input type="hidden" name="oReceiver" value="" id="buy_user"/>
                                <input type="hidden" name="oRecphone" value="" id="phone"/>
                                <input type="hidden" name="oRecaddres" value="" id="address"/>
                                <input type="hidden" name="oExpress" value="" id="express"/>
                                <input type="hidden" name="oPaytype" value="" id="paytype"/>
                            </form>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="clear"></div>
        </div>
    </div>
    <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        $(function(){

            //收货地址选择
            $("ul[class='addressChoose'] li").each(function(){
                //选择默认
                var oReceiver = $("li[class='user-addresslist defaultAddr'] span[class='buy-user']").html();
                var oRecphone = $("li[class='user-addresslist defaultAddr'] span[class='buy-phone']").html();
                var oRecaddres = $("li[class='user-addresslist defaultAddr'] span[class='buy--address-detail']").html();
                $("#buy_user").val(oReceiver);
                $("#phone").val(oRecphone);
                $("#address").val(oRecaddres);
                $("#send").html(oRecaddres);
                $("#person").html(oReceiver);
                $("#tel").html(oRecphone);

                $(this).unbind();
                $(this).click(function(){
                    $("ul[class='addressChoose'] li").removeClass("defaultAddr");
                    $(this).addClass("defaultAddr");
                    var oReceiver = $("li[class='user-addresslist defaultAddr'] span[class='buy-user']").html();
                    var oRecphone = $("li[class='user-addresslist defaultAddr'] span[class='buy-phone']").html();
                    var oRecaddres = $("li[class='user-addresslist defaultAddr'] span[class='buy--address-detail']").html();
                    $("#buy_user").val(oReceiver);
                    $("#phone").val(oRecphone);
                    $("#send").html(oRecaddres);
                    $("#person").html(oReceiver);
                    $("#tel").html(oRecphone);
                })
            })

            //物流方式选择
            $("ul[class='op_express_delivery_hot'] li").each(function(){
                $(this).unbind();
                $(this).click(function(){
                    var oExpress = $(this).children("span").attr("id");
                    $("#express").val(oExpress);
                    $("ul[class='op_express_delivery_hot'] li").removeClass("selected");
                    $(this).addClass("selected");
                })
            })

            //支付方式选择
            $("ul[class='pay-list'] li").each(function(){
                $(this).unbind();
                $(this).click(function(){
                    var oPaytype = $(this).children("span").attr("id");
                    $("#paytype").val(oPaytype);
                    $("ul[class='pay-list'] li").removeClass("selected");
                    $(this).addClass("selected");
                })
            })

            //提交订单
            $("#order_add").click(function(){
                if($("#express").val()==""){
                    layer.msg("请选择物流方式！",{icon:5, time:1000});
                    return;
                }

                if($("#paytype").val()==""){
                    layer.msg("请选择支付方式！",{icon:5, time:1000});
                    return;
                }

                $.ajax({
                    url: "shopping/submitOrder",
                    type: "post",
                    data: $("#form_order_add").serialize(),
                    success: function(){
                        layer.msg("下单成功！3秒后跳转至我的订单界面", {icon:6, time:2000}, function(){
                            location.href = "sysUser/getOrderListByUserId";
                        })
                    }
                })
            })

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
        })
    </script>
    <!-- footer -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
