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
    <title>爱机饰界-产品系列</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        var navID = '4';
        var menuID = '1';
        var acur='1';
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
    <div class="Banner"><img src="uploadfiles/product_ban_03.jpg" width="985" height="204" /></div>

    <div class="Contain">
        <div class="Silderbar">
            <div class="menu2">
                <h3 class="h3"><img src="images/product_img_03.png" width="19" height="14" />产品系列</h3>
                <ul>
                    <li id="menu1"><span><a href="#">系列保护</a></span>
                        <dl>
                            <dt class="acur1"><a href="#">保护贴膜</a></dt>
                            <dt class="acur2"><a href="#">保护皮套</a></dt>
                            <dt class="acur3"><a href="#">保护壳</a></dt>
                            <dt class="acur4"><a href="#">移动电源</a></dt>
                        </dl>
                    </li>
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
            <div class="ColumnName">当前位置：<a href="#">产品系列</a>-<span>系列浏览</span></div>
            <div class="Content">
                <div class="brand">
                    <h1 class="h1"><span><a href="#">系列浏览</a></span></h1>
                    <div class="con">
                        <h3 class="h3"><a href="#">更多>></a><span>保护贴膜</span></h3>
                        <ul>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                        </ul>
                        <h3 class="h3"><a href="#">更多>></a><span>保护皮套</span></h3>
                        <ul>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                            <li>
                                <div><img src="uploadfiles/brand_img_03.jpg" width="58" height="119" /></div>
                                <p><a href="#">Apple iPad HD/the new iPad</a></p>
                            </li>
                        </ul>
                    </div>
                </div>
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
