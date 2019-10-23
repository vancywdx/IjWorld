<%--
  Created by IntelliJ IDEA.
  User: lcyex
  Date: 2019/10/14
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>爱机饰界-用户登录</title>
    <link href="/css/css_whir.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

    <script type="text/javascript">
        var navID = '0';
        var menuID = '0';
    </script>
</head>

<body>
    <!-- header -->
    <jsp:include page="common/header.jsp"/>

    <!--content -->
    <div class="login">
        <div class="login_dl">
            <h1 class="h1"><a href="javascript:window.location.href = 'application/login.jsp';" class="a" >登<span></span>录</a></h1>
            <h3 class="h3"></h3>
            <dl>
                <dt>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="90" align="right">用户名</td>
                            <td><input type="text" class="text" name="username" id="username"/></td>
                        </tr>
                        <tr>
                            <td width="90" align="right">密码</td>
                            <td><input type="password" class="text" name="password" id="password"/></td>
                        </tr>
                        <tr>
                            <td width="90" align="right"></td>
                            <td><label><i></i><span>下次自动登录<em>使用公用电脑勿勾选</em></span></label></td>
                        </tr>
                        <tr>
                            <td style=" padding:0;" colspan="2"><h6 class="h6" style=" width:365px; margin:0 auto; border-bottom:1px solid #f8f5fc;"></h6></td>
                        </tr>
                        <tr>
                            <td width="90"></td>
                            <td><input type="button" class="btn"  onclick="checkLogin()" /><a href="#">忘记密码</a><em class="em">|</em><a href="application/register.jsp">立即注册</a></td>
                        </tr>
                    </table>
                </dt>
                <dd><img src="uploadfiles/login_img_03.jpg" width="489" height="173" /></dd>
            </dl>
        </div>
        <div class="clear"></div>
    </div>
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript">
        $(".login_dl table label").click(function(){
            var clas=$(this).find("i").attr("class");
            if(clas=="i"){
                $(this).find("i").removeClass("i")
            }else{
                $(this).find("i").addClass("i")
            }
        })
        //登录校验
        function checkLogin() {
            var username = $("#username").val().trim();
            var password = $("#password").val().trim();

            if (username=="") {
                layer.msg('用户名不能为空！', {icon:5,time:2000});
                return;
            }
            if(password==""){
                layer.msg('密码不能为空！', {icon:5,time:2000});
                return;
            }

            $.ajax({
                url:"sysUser/backLogin",
                type:"post",
                data:"username="+username+"&password="+password,
                success:function (data) {
                    if(data.result){
                        layer.msg(data.data, {icon:6,time:500},function(){
                            window.location.href="application/index.jsp";
                        });
                    }else{
                        layer.msg(data.data, {icon:5,time:500},function(){
                            window.location.href="application/login.jsp";
                        });
                    }
                }
            })

        }
    </script>

    <!-- footer -->
    <jsp:include page="common/footer.jsp"/>
</body>
</html>
