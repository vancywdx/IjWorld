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
    <title>爱机饰界-销售渠道</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        var navID = '7';
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
    <div class="Banner"><img src="uploadfiles/sale_ban_03.jpg" width="985" height="204" /></div>

    <div class="Contain">
        <div class="Silderbar">
            <div class="menu">
                <h3 class="h3"><img src="images/sale_img_03.png" width="26" height="14" />销售渠道</h3>
                <ul>
                    <li id="menu1"><span><a href="#">网络经销</a></span></li>
                    <li id="menu2"><span><a href="#">区域经销</a></span></li>
                    <li id="menu3"><span><a href="#">礼品定制</a></span></li>
                </ul>
            </div>
            <script type="text/javascript">
                $("#menu"+menuID).addClass("onmenu");
                $(".menu ul li:last").css("border","none");
            </script>
        </div>
        <div class="MainContentBox">
            <div class="ColumnName">当前位置：<a href="#">销售渠道</a>-<span>网络经销</span></div>
            <div class="Content">
                <div class="about">
                    <i><img src="uploadfiles/sale_img_03.jpg" width="741" height="223" /></i>
                    <table cellpadding="10" cellspacing="0">
                        <tr>
                            <td width="273"><em style=" padding:0 3em;"></em>阿里巴巴</td>
                            <td width="420"></td>
                        </tr>
                        <tr>
                            <td width="273"><em style=" padding:0 3em;"></em>天猫官方旗舰店</td>
                            <td width="420"></td>
                        </tr>
                        <tr>
                            <td width="273"><em style=" padding:0 3em;"></em>速卖通旗舰店</td>
                            <td width="420"></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>

    <!-- footer -->
    <jsp:include page="common/footer.jsp"/>
</body>
</html>
