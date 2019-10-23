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
    <title>爱机饰界-用户注册</title>
<%--    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />--%>
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

    <script type="text/javascript">
        var navID = '0';
        var menuID = '0';
    </script>
</head>
<body>
    <!-- header -->
    <jsp:include page="common/header.jsp"/>

    <!-- content -->
    <div class="regis">
        <div class="regis_dl">
            <h1 class="h1"><a href="javascript:window.location.href = 'application/register.jsp';"  class="a">注<span></span>册</a></h1>
            <h3 class="h3"></h3>
            <dl>
                <dt>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="90" align="right">用户名</td>
                            <td><input type="text" class="text" id="username" name="username" onblur="checkName()"/></td>
                            <td id="usernameIcon"></td>
                        </tr>
                        <tr>
                            <td width="90" align="right">邮箱</td>
                            <td><input type="text" class="text" id="email" onblur="checkEmail()"/></td>
                            <td id="emailIcon"></td>
                        </tr>
                        <tr>
                            <td width="90" align="right">设置密码</td>
                            <td><input type="password" class="text" id="password" onblur="checkPassword()"/></td>
                            <td id="passwordIcon"></td>
                        </tr>
                        <tr>
                            <td width="90" align="right">确认密码</td>
                            <td><input type="password" class="text" id="repassword" onblur="checkRepassword()"/></td>
                            <td id="repasswordIcon"></td>
                        </tr>
                        <tr>
                            <td style=" padding:0;" colspan="2"><h6 class="h6" style=" width:365px; margin:0 auto; border-bottom:1px solid #f8f5fc;"></h6></td>
                        </tr>
                        <tr>
                            <td width="90"></td>
                            <td><input type="button" class="btn" onclick="checkData()"/><a href="application/login.jsp">已有账户，立即登录</a></td>
                        </tr>
                    </table>
                </dt>
                <dd><img src="uploadfiles/regis_img_03.jpg" width="489" height="253" style="margin-left: 10px"/></dd>
            </dl>
        </div>
        <div class="clear"></div>
    </div>

    <!-- footer -->
    <jsp:include page="common/footer.jsp"/>

    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript">
      function checkData() {
          var username = $("#username").val().trim();
          if(username==""){
              layer.msg('用户名不能为空！', {icon:5,time:2000});
              return;
          }
          var email = $("#email").val().trim();
          if(email==""){
              layer.msg('邮箱不能为空！', {icon:5,time:2000});
              return;
          }
          var password = $("#password").val().trim();
          if(password==""){
              layer.msg('密码不能为空！', {icon:5,time:2000});
              return;
          }
          var repassword = $("#repassword").val().trim();
          if(repassword==""){
              layer.msg('确认密码不能为空！', {icon:5,time:2000});
              return;
          }
          //异步提交数据
          $.ajax({
              url:"sysUser/registUser",
              type:"post",
              data:"username="+username+"&password="+password+"&email="+email,
              success:function (data) {
                  if(data.result){
                      layer.msg("注册成功，即将跳转到登录页面", {icon:6,time:2000},function(){
                          window.location.href="application/login.jsp";
                      });
                  }else{
                      layer.msg("注册失败", {icon:5,time:2000},function(){
                          window.location.href="application/register.jsp";
                      });
                  }
              }
          })

      }
      //判断用户是否存在
        function checkName() {
            var username = $("#username").val().trim();
            if(username==""){
                layer.msg('用户名不能为空！', {icon:5,time:2000});
                $("#usernameIcon").html("");
                return;
            }
            $.ajax({
                url:"sysUser/checkName",
                data:"username="+username,
                success:function (data) {
                    if(data.result){
                        layer.msg("该用户已存在", {icon:5,time:1000});
                    }else{
                        //layer.msg("该用户名可用", {icon:6,time:1000});
                        $("#usernameIcon").html("<i class='Hui-iconfont' style='font-size: 23px;color: #00c300'>&#xe6e1;</i>");
                    }
                }
            })
        }
        //判断邮箱是否存在
        function checkEmail() {
            var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
            var email = $("#email").val(); //要验证的对象
            if(email === ""){ //输入不能为空
                  layer.msg("邮箱不能为空!", {icon:5,time:1000});
                  $("#emailIcon").html("");
                  return ;
                }else if(!reg.test(email)){ //正则验证不通过，格式不对
                  layer.msg("邮箱格式不对，请重新输入!", {icon:5,time:1000});
                　return ;
                 }else{
                //格式正确，发送异步请求判断邮箱是否已存在
                $.ajax({
                    url:"sysUser/checkEmail",
                    data:"email="+email,
                    success:function (data) {
                        if(data.result){
                            layer.msg("该邮箱已存在", {icon:5,time:1000});
                        }else{
                            //layer.msg("该邮箱可用", {icon:6,time:1000});
                            $("#emailIcon").html("<i class='Hui-iconfont' style='font-size: 23px;color: #00c300'>&#xe6e1;</i>");
                        }
                    }
                })
            }
        }
        //检验密码强度
        function checkPassword() {
            //获取密码的值
            var password = $("#password").val();
            if(password==""){
                layer.msg("密码不能为空!", {icon:5,time:1000});
                $("#passwordIcon").html("");
                return ;
            }
            /*密码强度：
              最短6位，最长16位 {6,16}
              必须包含1个数字
              必须包含2个小写字母
              必须包含2个大写字母
              必须包含1个特殊字符*/
            var reg = /^.*(?=.{6,16})(?=.*\d)(?=.*[A-Z]{2,})(?=.*[a-z]{2,})(?=.*[!@#$%^&*?\(\)]).*$/;
            //判断值是否符合正则的规则
            var flag = reg.test(password);
            //提示信息
            if(!flag){
                layer.msg("密码至少包含1个数字，2个小写字母，2个大写字母和1个特殊字符，长度为6-16位", {icon:5,time:4000});
            }else {
                //layer.msg("密码强度符合!", {icon:6,time:1000});
                $("#passwordIcon").html("<i class='Hui-iconfont' style='font-size: 23px;color: #00c300'>&#xe6e1;</i>");
            }

        }
        //校验确认密码是否和密码一样
        function checkRepassword() {
            //获取密码的值
            var password = $("#password").val();
            //获取确认密码的值
            var repassword = $("#repassword").val();
            if(repassword==""){
                layer.msg("确认密码不能为空!", {icon:5,time:1000});
                $("#repasswordIcon").html("");
                return ;
            }
            if(password!=repassword){
                layer.msg("两次输入的密码不一致，请重新输入!", {icon:5,time:1000});
            }else {
                $("#repasswordIcon").html("<i class='Hui-iconfont' style='font-size: 23px;color: #00c300'>&#xe6e1;</i>");
            }
        }
    </script>
</body>
</html>
