<%--
  Created by IntelliJ IDEA.
  User: lcyex
  Date: 2019/10/14
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="lib/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="lib/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="lib/vendor/linearicons/style.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="/lib/vendor/main.css">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="lib/vendor/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="lib/vendor/img/favicon.png">
    <title>登录后台管理系统</title>
</head>
<body>
<div id="wrapper">
    <div class="vertical-align-wrap">
        <div class="vertical-align-middle">
            <div class="auth-box ">
                <div class="left">
                    <div class="content">
                        <div class="header">
                            <h4 class="heading">后台管理系统</h4>
                            <%--<div class="logo text-center"><img src="lib/vendor/img/logo-dark.png" alt="Klorofil Logo"></div>--%>
                        </div>
                        <form class="form-auth-small" id="form-admin-login">
                            <div class="form-group">
                                <input type="hidden" name="flag" value="1" >
                                <label for="username" class="control-label sr-only">用户名</label>
                                <input type="text" class="form-control" id="username" name="username" placeholder="用户名">
                            </div>
                            <div class="form-group">
                                <label for="password" class="control-label sr-only">密码</label>
                                <input type="password" class="form-control" id="password" name="password"  placeholder="密码">
                            </div>
                            <div class="form-group clearfix">
                                <label class="fancy-checkbox element-left">
                                    <input type="checkbox" id="rememberMe" name="rememberMe">
                                    <span>记住我</span>
                                </label>
                                <label class="fancy-checkbox element-right">
                                    <a href="#">忘记密码?</a>
                                </label>
                            </div>
                            <input readonly class="btn btn-primary btn-lg btn-block"  onclick="backlogin()" value="登录"/>
                        </form>
                    </div>
                </div>
                <div class="right">
                    <div class="overlay"></div>
                    <div class="content text">
                       <%-- <h1 class="heading">爱机饰界</h1>
                        <p>一直被模仿，从未被超越</p>--%>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript">
    function backlogin() {
        var username = $("#username").val().trim();
        var password = $("#password").val().trim();

        if(username==""){
            layer.msg('用户名不能为空！', {icon:5,time:2000});
            return;
        }

        if(password==""){
            layer.msg('密码不能为空！', {icon:5,time:2000});
            return;
        }

        $.ajax({
            url: "sysUser/backLogin",
            type: "post",
            data: $("#form-admin-login").serialize(),
            success: function(data){
                if(data.result){
                    layer.msg(data.data, {icon:6,time:500},function(){
                        window.location.href="application/back/index.jsp";
                    });
                }else{
                    layer.msg(data.data, {icon:5,time:500},function(){
                        window.location.href="sysUser/logout";
                    });
                }
            }
        })
    }
</script>
</body>
</html>
