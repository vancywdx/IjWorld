<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lcyex
  Date: 2019/10/11
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <link href="/css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <link href="/lib/layui/css/layui.css" rel="stylesheet"  media="all">

    <title>编辑收货地址</title>
</head>
<body>
<div class="pd-20">
    <form action="address/updateAddress" method="post" class="form form-horizontal" id="form-address-update" method="post">
        <input type="hidden" name="id" value="${address.id}"/>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>收货人姓名：</label>
            <div class="formControls col-4">
                <input type="text" class="input-text" placeholder="" value="${address.receiver}" name="receiver" datatype="*2-20" nullmsg="收货人姓名不能为空"/></div>
            <div class="col-3"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>手机号码：</label>
            <div class="formControls col-4">
                <input type="text" class="input-text" placeholder="" value="${address.phone}" name="phone" datatype="m" nullmsg="手机号码不能为空"/></div>
            <div class="col-3"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>地址：</label>
            <div class="formControls col-4">
                <input type="text" class="input-text" placeholder="" value="${address.address}" name="address" datatype="*" nullmsg="地址不能为空"/></div>
            <div class="col-3"> </div>
        </div>
        <div class="row cl">
            <div class="col-9 col-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript" src="lib/layui/layui.js"></script>
<script type="text/javascript">

    $(function() {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        //地址-修改
        $("#form-address-update").Validform({
            tiptype:2,
            ajaxPost:true,
            callback:function(data){
                if(data.result){
                    parent.layer.msg(data.data,{icon:6, time:1000}, function(){
                        // 父页面刷新
                        parent.location.reload();
                        //关闭弹出层
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                    })
                }else{
                    parent.layer.msg(data.data,{icon:5, time:1000}, function(){
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                    })
                }
            }
        });
    });
</script>
</body>
</html>
