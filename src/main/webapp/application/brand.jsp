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
    <title>爱机饰界-品牌浏览</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        var navID = '3';
        var menuID = '1';
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
    <div class="Banner"><img src="uploadfiles/brand_ban_03.jpg" width="985" height="204" /></div>

    <div class="Contain">
        <div class="Silderbar">
            <div class="menu">
                <h3 class="h3"><img src="images/brand_img_03.png" width="13" height="13" />品牌浏览</h3>
                <ul>
                    <li id="menu1"><span><a href="#">苹果</a></span></li>
                    <li id="menu2"><span><a href="#">三星</a></span></li>
                    <li id="menu3"><span><a href="#">索尼</a></span></li>
                </ul>
            </div>
            <script type="text/javascript">
                $("#menu"+menuID).addClass("onmenu");
                $(".menu ul li:last").css("border","none");
            </script>
        </div>
        <div class="MainContentBox">
            <div class="ColumnName">当前位置：<a href="#">品牌浏览</a>-<span>苹果</span></div>
            <div class="Content">
                <div class="brand">
                    <h1 class="h1"><span><a href="#">全部</a></span></h1>
                    <div class="con">
                        <h3 class="h3"><a href="#">更多>></a><img src="uploadfiles/iphome_03.jpg" width="100" height="50" /></h3>
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
                        <h3 class="h3"><a href="#">更多>></a><img src="uploadfiles/iphome_03.jpg" width="100" height="50" /></h3>
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
