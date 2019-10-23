<%--
  Created by IntelliJ IDEA.
  User: lcyex
  Date: 2019/10/14
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!--top start-->
<div class="toper">
    <div class="top">
        <div class="top_index">
            <div class="left">
                <a onclick="SetHome(window.location)" href="javascript:void(0)">设为首页</a> <em>|</em> <a onclick="AddFavorite(window.location,document.title)" href="javascript:void(0)">收藏</a>
            </div>
            <div class="right">
                <shiro:guest>
                    欢迎游客访问， <a href="application/login.jsp">登录</a> <em>|</em>
                </shiro:guest>

                <shiro:user>
                    欢迎您，<a href="application/user/information.jsp">${frontUser.username}</a><em>|</em><a href="sysUser/logout" >退出</a><em>|</em>
                </shiro:user>

                <a href="application/register.jsp" onclick="">注册</a>
            </div>
        </div>
        <script type="text/javascript" language="javascript">
            //加入收藏
            function AddFavorite(sURL, sTitle) {
                sURL = encodeURI(sURL);
                try{
                    window.external.addFavorite(sURL, sTitle);
                }catch(e) {
                    try{
                        window.sidebar.addPanel(sTitle, sURL, "");
                    }catch (e) {
                        alert("加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置.");
                    }
                }
            }

            //设为首页
            function SetHome(url){
                if (document.all) {
                    document.body.style.behavior='url(#default#homepage)';
                    document.body.setHomePage(url);
                }else{
                    alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
                }
            }
        </script>
        <div class="logo"><a href="application/index.jsp"><img src="images/logo.jpg" /></a></div>
        <div class="Language">
            <a href="javascript:alert('英文版建设中...')" class="en" title="English">English ></a>
        </div>

        <div class="mainnav">
            <ul>
                <li id="nav1"><span><a class="nav1" href="application/index.jsp">首&nbsp;&nbsp;&nbsp;&nbsp;页</a></span></li>
                <li id="nav2">
                    <span><a class="nav2" href="application/about.jsp">关于我们</a></span>
                    <div>
                        <a href="#">公司简介</a>
                        <a href="#">荣誉资质</a>
                        <a href="#">加入我们</a>
                    </div>
                </li>
                <li id="nav3">
                    <span><a class="nav3" href="application/brand.jsp">品牌浏览</a></span>
                    <div>
                        <a href="#"><img src="uploadfiles/apple_03.jpg" width="161" height="139" /></a>
                        <a href="#"><img src="uploadfiles/sam_03.jpg" width="161" height="139" /></a>
                        <a href="#"><img src="uploadfiles/son_03.jpg" width="161" height="139" /></a>
                        <a href="#"><img src="uploadfiles/htc_03.jpg" width="161" height="139" /></a>
                        <a href="#"><img src="uploadfiles/moto_03.jpg" width="161" height="139" /></a>
                        <a href="#"><img src="uploadfiles/sony_03.jpg" width="161" height="139" /></a>
                    </div>
                </li>
                <li id="nav4">
                    <span><a class="nav4" href="application/product_list.jsp">产品系列</a></span>
                    <div>
                        <a href="#">系列浏览</a>
                    </div>
                </li>
                <li id="nav5">
                    <span><a class="nav5" href="application/new.jsp">最新资讯</a></span>
                    <div>
                        <a href="#">新品上市</a>
                        <a href="#">企业资讯</a>
                        <a href="#">媒体报道</a>
                        <a href="#">市场活动</a>
                    </div>
                </li>
                <li id="nav6">
                    <span><a class="nav6" href="application/cust.jsp">客户服务</a></span>
                    <div>
                        <a href="#">防伪查询</a>
                        <a href="#">产品说明</a>
                        <a href="#">合格证书</a>
                        <a href="#">保养条款</a>
                        <a href="#">产品视频</a>
                    </div>
                </li>
                <li id="nav7">
                    <span><a class="nav7" href="application/sale.jsp">销售渠道</a></span>
                    <div>
                        <a href="#">网络经销</a>
                        <a href="#">区域经销</a>
                        <a href="#">礼品定制</a>
                    </div>
                </li>
                <li id="nav8">
                    <span><a class="nav8" href="application/contact.jsp">联系我们</a></span>
                    <div>
                        <a href="#">联系方式</a>
                        <a href="#">代理咨询</a>
                        <a href="#">网站建议</a>
                        <a href="#">网站地图</a>
                        <a href="#">法律声明</a>
                    </div>
                </li>
                <li id="nav9"><span><a class="nav9" href="goods/getGoodsList">商&nbsp;&nbsp;&nbsp;&nbsp;城</a></span></li>
            </ul>
        </div>
        <div class="SreachBox">
            <a href="javascript:void(0)" onclick="GotoSearch();" class="sreach_btn"><em class="Texthide">搜索</em></a>
            <input name="" type="text" class="sreach_ipu" id="key" value="" />
            <div class="clear"></div>
        </div>
        <div class="search_title">
            <a href="#">手机套</a><em>|</em><a href="#">手机外贴</a><em>|</em><a href="#">移动电源</a><em>|</em><a href="#">手机套</a><em>|</em><a href="#">手机外贴</a><em>|</em><a href="#">移动电源</a>
        </div>
    </div>
    <div class="nav_bg"></div>
    <div class="nav_bg2"></div>
</div>
<div class="fixed_right">
    <a href="#"><img src="images/fixed_right1_03.jpg" width="53" height="53" /></a>
    <a href="#"><img src="images/fixed_right2_03.jpg" width="53" height="53" /></a>
    <a href="#" target="_blank"><img src="images/fixed_right3_03.jpg" width="53" height="53" /></a>
    <a href="#" target="_blank"><img src="images/fixed_right4_03.jpg" width="53" height="53" /></a>
    <a href="application/shopcart.jsp"><img src="images/fixed_right5_03.jpg" width="53" height="53" /></a>
    <a href="javascript:void(0)"><img src="images/fixed_right6_03.jpg" width="53" height="53" /></a>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript">

    //去搜索
    function GotoSearch(){
        //获取输入的名字
        var goodsName = $("#key").val();
        $.ajax({
            url:"goods/getGoodsList",
            type:"post",
            data:"goodsName="+goodsName,
            success:function (data) {
                location.reload();
            }
        })
    }

    $(".fixed_right a:last").click(function(){
        $("html,body").animate({scrollTop:0},600);
    })
    //导航下拉
    $(".mainnav li").hover(function(){
        var leng=$(this).find("div").children("a").length;
        if(leng>0){
            var oid=$(this).index()
            if(oid==2){
                $(".nav_bg2").show();
            }else{
                $(".nav_bg").show();
            }
            $(this).find("div").show();
        }
    },function(){
        $(this).find("div").hide();
        $(".nav_bg").hide();
        $(".nav_bg2").hide();
    })
    //导航选中
    $("#nav" + navID).addClass("onnav");

   /* function GoSearchUrl() {
        var searchinput = document.getElementById("key");
        if (searchinput.value == "" || searchinput.value == "输入您查找的内容") {
            alert("请输入关键字！");
            searchinput.focus();
            return false;
        }
        if (searchinput.value.length > 50) {
            alert("输入的关键字字数不要过多！");
            searchinput.focus();
            return false;
        }
        CheckString(searchinput.value);
    }
    //去搜索
    function GoSreach(rs) {


    }

    function entersearch(){

        var event = window.event || arguments.callee.caller.arguments[0];
        if (event.keyCode == 13)
        {
            GoSearchUrl();
        }
    }

    function CheckString(s) {
        var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）—|{}【】‘；：”“'。，、？]")
        var rs = "";
        for (var i = 0; i < s.length; i++) {
            rs = rs + s.substr(i, 1).replace(pattern, '');
        }
        if (rs == "") {
            alert("不能输入特殊字符！");
            return false;
        }
        else{
            GoSreach(rs);
        }
    }
*/
</script><!--top end-->
</body>
</html>
