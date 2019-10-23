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
   
    <!-- footer -->
    <jsp:include page="common/footer.jsp"/>
</body>
</html>
