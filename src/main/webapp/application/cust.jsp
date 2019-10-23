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
    <title>爱机饰界-客户服务</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        var navID = '6';
        var menuID = '2';
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
    <div class="Banner"><img src="uploadfiles/cust_ban_03.jpg" width="985" height="204" /></div>

    <div class="Contain">
        <div class="Silderbar">
            <div class="menu">
                <h3 class="h3"><img src="images/news_img_03.png" width="20" height="15" />客户服务</h3>
                <ul>
                    <li id="menu1"><span><a href="#">防伪查询</a></span></li>
                    <li id="menu2"><span><a href="#">产品说明</a></span></li>
                    <li id="menu3"><span><a href="#">合格证书</a></span></li>
                    <li id="menu4"><span><a href="#">保养条款</a></span></li>
                    <li id="menu5"><span><a href="#">产品视频</a></span></li>
                </ul>
            </div>
            <script type="text/javascript">
                $("#menu"+menuID).addClass("onmenu");
                $(".menu ul li:last").css("border","none");
            </script>
        </div>
        <div class="MainContentBox">
            <div class="ColumnName">当前位置：<a href="#">客户服务</a>-<span>产品说明</span></div>
            <div class="Content">
                <div class="news_list">
                    <ul>
                        <li class="none"><span>[2014-01-02]</span><a href="#">极速传输，瞬间自由 </a></li>
                        <li class="none"><span>[2014-01-02]</span><a href="#">极速传输，瞬间自由 </a></li>
                        <li class="none"><span>[2014-01-02]</span><a href="#">极速传输，瞬间自由 </a></li>
                        <li class="none"><span>[2014-01-02]</span><a href="#">极速传输，瞬间自由 </a></li>
                        <li class="none"><span>[2014-01-02]</span><a href="#">极速传输，瞬间自由 </a></li>
                        <li class="none"><span>[2014-01-02]</span><a href="#">极速传输，瞬间自由 </a></li>
                        <li class="none"><span>[2014-01-02]</span><a href="#">极速传输，瞬间自由 </a></li>
                        <li class="none"><span>[2014-01-02]</span><a href="#">极速传输，瞬间自由 </a></li>
                        <li class="none"><span>[2014-01-02]</span><a href="#">极速传输，瞬间自由 </a></li>
                        <li class="none"><span>[2014-01-02]</span><a href="#">极速传输，瞬间自由 </a></li>
                    </ul>
                    <p class="pages">共 20 页 / 当前：第 1 页<a href="#">首页</a><a href="#">上一页</a><a href="#">下一页</a><a href="#">末页</a></p>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <!-- footer -->
    <jsp:include page="common/footer.jsp"/>
</body>
</html>
