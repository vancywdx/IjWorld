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
    <title>爱机饰界-关于我们</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        var navID = '2';
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
    <div class="Banner"><img src="uploadfiles/about_ban.jpg" width="985" height="204" /></div>

    <div class="Contain">
        <div class="Silderbar">
            <div class="menu">
                <h3 class="h3"><img src="images/about_img_03.png" width="15" height="16" />关于我们</h3>
                <ul>
                    <li id="menu1"><span><a href="#">公司简介</a></span></li>
                    <li id="menu2"><span><a href="#">荣誉资质</a></span></li>
                    <li id="menu3"><span><a href="#">加入我们</a></span></li>
                </ul>
            </div>
            <script type="text/javascript">
                $("#menu"+menuID).addClass("onmenu");
                $(".menu ul li:last").css("border","none");
            </script>
        </div>
        <div class="MainContentBox">
            <div class="ColumnName">当前位置：<a href="#">关于我们</a>-<span>公司简介</span></div>
            <div class="Content">
                <div class="about">
                    <div style=" line-height:36px; letter-spacing:2px; color:#a0a0a0; padding:30px 30px 0 40px;">公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍<img src="uploadfiles/about_img_03.jpg" width="706" height="320" /></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <!-- footer -->
    <jsp:include page="common/footer.jsp"/>
</body>
</html>
