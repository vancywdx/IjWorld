<%--
  Created by IntelliJ IDEA.
  User: lcyex
  Date: 2019/10/14
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="bottomer">
    <div class="bottom">
        <div class="navbt">
            <a href="#">联系我们</a><em>|</em><a href="#">网站地图</a><em>|</em><a href="#">版权声明</a><em>|</em><a href="#">在线客服</a><em>|</em><a href="#">流量统计</a><br />Copyright © 2015<a href="#" target="_blank"></a>.
        </div>
        <div class="copyright">
            <a href="#" class="b_wb" target="_blank"><img src="images/b_wb_03.jpg" width="27" height="25" /></a>
            <a href="javascript:void(0)" class="b_wx"><img src="images/b_wx_03.jpg" width="27" height="25" /></a>
            <img src="uploadfiles/ewm_03.jpg" width="59" height="59" class="b_ewm" />
        </div>
        <div class="clear"></div>
    </div>
</div>
<script type="text/javascript">
    $(".copyright .b_wx").hover(function(){
        $(".b_ewm").show();
    },function(){
        $(".b_ewm").hide();
    })
    /*//整站无图处理
    jQuery.each(jQuery("img"), function (i, n) { jQuery(n).error(function () { n.src = 'images/nofile.jpg'; }); n.src = n.src; })*/
    //内容部分与左导航部分高度相同
    var h=$(".MainContentBox").outerHeight(true);
    $(".Silderbar").height(h)
</script>
</body>
</html>
