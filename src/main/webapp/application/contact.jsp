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
    <title>爱机饰界-联系我们</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        var navID = '8';
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
    <div class="Banner"><img src="uploadfiles/contact_ban_03.jpg" width="985" height="204" /></div>

    <div class="Contain">
        <div class="Silderbar">
            <div class="menu">
                <h3 class="h3"><img src="images/contact_img_03.png" width="15" height="15" />联系我们</h3>
                <ul>
                    <li id="menu1"><span><a href="#">联系方式</a></span></li>
                    <li id="menu2"><span><a href="#">代理咨询</a></span></li>
                    <li id="menu3"><span><a href="#">网站建议</a></span></li>
                    <li id="menu4"><span><a href="#">网站地图</a></span></li>
                    <li id="menu5"><span><a href="#">法律声明</a></span></li>
                </ul>
            </div>
            <script type="text/javascript">
                $("#menu"+menuID).addClass("onmenu");
                $(".menu ul li:last").css("border","none");
            </script>
        </div>
        <div class="MainContentBox">
            <div class="ColumnName">当前位置：<a href="#">联系我们</a>-<span>联系方式</span></div>
            <div class="Content">
                <div class="about">
                    <i><img src="uploadfiles/contact_img_03.jpg" width="745" height="152" /></i>
                    <table cellpadding="10" cellspacing="0">
                        <tr>
                            <td><em style=" width:20px; height:41px; float:left;"></em><img src="uploadfiles/contact_1_03.jpg" style=" float:left;" width="42" height="41" /><span style=" float:left; padding-left:10px;">电话：<br /></span></td>
                        </tr>
                        <tr>
                            <td valign="middle"><em style=" float:left; display:inline-block; width:20px; height:41px;"></em><img src="uploadfiles/contact_2_03.jpg" style=" padding-top:15px; float:left;" width="42" height="24" /><span style=" float:left; padding-left:10px; line-height:58px;">邮箱：</span></td>
                        </tr>
                        <tr>
                            <td valign="middle"><em style=" float:left; display:inline-block; width:20px; height:41px;"></em><img src="uploadfiles/contact_3_03.jpg" style=" float:left;" width="42" height="42" /><span style=" float:left; padding-left:10px; line-height:58px;">网站：</span></td>
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
