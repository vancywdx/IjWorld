<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>爱机饰界-商城中心</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <link href="css/shopping.css" rel="stylesheet" type="text/css" />
    <style>
        p {
            display: block;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        var navID = '9';
        var menuID = '0';
    </script>
</head>
<body id="goodsBody">
    <!-- header -->
    <jsp:include page="common/header.jsp">
        <jsp:param name="bodyId" value="goodsBody"/>
    </jsp:include>
    <div class="Banner"><img src="uploadfiles/product_ban_03.jpg" width="985" height="204" /></div>
    <div class="Contain">
        <div class="Silderbar">
            <div class="menu2">
                <h3 class="h3"><img src="images/product_img_03.png" width="19" height="14" />产品系列</h3>
                <ul>
                    <li id="menu1"><span><a href="#">系列保护</a></span>
                        <dl>
                            <dt class="acur1"><a href="goods/getGoodsListByParentId/1">保护贴膜</a></dt>
                            <dt class="acur2"><a href="goods/getGoodsListByParentId/2">保护皮套</a></dt>
                            <dt class="acur3"><a href="goods/getGoodsListByParentId/3">保护壳</a></dt>
                            <dt class="acur4"><a href="goods/getGoodsListByParentId/4">移动电源</a></dt>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="menu">
                <h3 class="h3"><img src="images/brand_img_03.png" width="13" height="13" />品牌浏览</h3>
                <ul>
                    <li id="menu2"><span><a href="goods/getGoodsListByBrandId/6">倍思（Baseus）</a></span></li>
                    <li id="menu3"><span><a href="goods/getGoodsListByBrandId/9">闪魔（SmartDevil）</a></span></li>
                    <li id="menu4"><span><a href="goods/getGoodsListByBrandId/14">邦克仕（Benks）</a></span></li>
                </ul>
            </div>
            <script type="text/javascript">
                $("#menu"+menuID).addClass("onmenu");
                $(".menu2 ul li dt:last").css("border","none");
                $(".acur"+acur).addClass("acur");
                $(".acur").parents("li").addClass("onmenu");
            </script>
        </div>
        <div class="MainContentBox">
            <div class="ColumnName">当前位置：<a href="application/shoppingmall.jsp">商城中心</a></div>
            <div class="Content">
                <div class="goods_list">
                    <ul>
                        <c:forEach items="${pageInfo.list}" var="goods">
                            <li>
                                <a href="goods/showGoods/${goods.id}" target="_blank" title="${goods.goodsName}"><strong><img width="240" height="240" class="loadImg" src="uploadfiles/goods/${goods.goodsPic}" xsrc="uploadfiles/goods/${goods.goodsPic}" alt="${goods.goodsName}" border="0" align="absmiddle"></strong>
                                    <div class="goods_price">
                                         促销价：<span class="fcff0000 fsp"><em style="color: #ff0000">￥</em><fmt:formatNumber value="${goods.goodsPriceOff}" pattern="0"/><b>.${fn:substringAfter(goods.goodsPriceOff,'.')}</b></span>
                                        &nbsp;<span class="delline fcabacae">市场价：<em style="color: #abacae">￥</em><fmt:formatNumber value="${goods.goodsPrice}" pattern="0"/><b>.${fn:substringAfter(goods.goodsPrice,'.')}</b></span>

                                    </div>
                                    <p>${goods.goodsName}</p>
                                    <div class="btn_goodsbuy">
                                        <span class="btn_buy01"><i class="car_icon01"></i><strong>购买</strong></span>
                                        <span class="btn_buy02" onclick=""><i class="car_icon02"></i><strong>收藏</strong></span>
                                        <span class="sell_all">已售14件</span>
                                    </div>
                                </a>
                                <!--<div class="love-upvote" onClick="goodsLove(2349)"><i class="heart trans icon"></i><span class="trans" id="love-upvote_2349">0</span></div> 点赞-->
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <%--展示分页导航条--%>
                <jsp:include page="common/page.jsp">
                    <jsp:param name="bodyId" value="goodsBody"></jsp:param>
                </jsp:include>
            </div>
        </div>
        <div class="clear"></div>
    </div>

    <script type="text/javascript">

        $(".brand .con ul li").each(function(index, element) {
            if(($(this).index()+1)%4==0){
                $(this).addClass("li");
            }
        });
    </script>
    <!-- footer -->
    <jsp:include page="common/footer.jsp"/>
</body>
</html>
