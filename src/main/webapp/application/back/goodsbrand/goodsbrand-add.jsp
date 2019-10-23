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
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <link href="/lib/layui/css/layui.css" rel="stylesheet"  media="all">
    <title>添加商品品牌</title>
    <style>
        .preview_no{
            display: none;
        }
    </style>
</head>
<body>
<div class="pd-20">
    <form class="form form-horizontal" id="form-gbrand-add" enctype="multipart/form-data" method="post">
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>品牌名称：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" placeholder=""  name="gbrandName"  datatype="*2-16" nullmsg="品牌名称不能为空">
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl" id="preview1">
            <label class="form-label col-3"><span class="c-red">*</span>Logo：</label>
            <div class="formControls col-5">
                <img src="" width="100px" height="100px" id="logo_preview"/>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><div id="preview1_1" style="display: none"><span class="c-red">*</span>Logo：</div></label>
            <div class="formControls col-5">
                <span class="btn-upload form-group">
			        <input class="input-text upload-url" type="text" readonly datatype="*" nullmsg="请添加附件！"  style="width:200px">
			        <a href="javascript:;" class="btn btn-primary upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
			        <input type="file" id="gbrandLogo" name="gbrandLogo" accept="image/png,image/jpeg" class="input-file">
		        </span>
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl" id="preview2">
            <label class="form-label col-3"><span class="c-red">*</span>Logo缩略图：</label>
            <div class="formControls col-5">
                <img src="" width="100px" height="50px" id="logothum_preview"/>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><div id="preview2_1" style="display: none"><span class="c-red">*</span>Logo缩略图：</div></label>
            <div class="formControls col-5">
                <span class="btn-upload form-group">
			        <input class="input-text upload-url" type="text" readonly datatype="*" nullmsg="请添加附件！" style="width:200px">
			        <a href="javascript:;" class="btn btn-primary upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
			        <input type="file" id="gbrandLogoThum" name="gbrandLogoThum" accept="image/png,image/jpeg" class="input-file">
		        </span>
            </div>
            <div class="col-4"> </div>
        </div>

        <div class="row cl">
            <label class="form-label col-3">品牌介绍：</label>
            <div class="formControls col-5">
                <textarea name="gbrandDesc" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入15个字符" datatype="*10-255" dragonfly="true" nullmsg="简介不能为空！" onKeyUp="textarealength(this,255)"></textarea>
                <p class="textarea-numberbar"><em class="textarea-length">0</em>/255</p>
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <div class="col-9 col-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</div>
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


        $("#preview1").css("display","none");
        $("#preview1_1").css("display","block");
        $("#preview2").css("display","none");
        $("#preview2_1").css("display","block");

        //上传图片预览（Logo）
        $('#gbrandLogo').change(function(){
            // 获取FileList的第一个元素
            var logo = document.getElementById('gbrandLogo').files[0];
            src = window.URL.createObjectURL(logo);
            document.getElementById('logo_preview').src = src
            $("#preview1_1").css("display","none");
            $("#preview1").css("display","block");
        })

        //上传图片预览（Logo缩略图）
        $("#gbrandLogoThum").change(function () {
            var logothum = document.getElementById('gbrandLogoThum').files[0];
            src = window.URL.createObjectURL(logothum);
            document.getElementById('logothum_preview').src = src
            $("#preview2_1").css("display","none");
            $("#preview2").css("display","block");
        })



        //商品品牌-添加
        $("#form-gbrand-add").Validform({
            tiptype:2,
            ajaxPost:true,
            callback:function(form){
                $.ajax({
                    url : "goodsBrand/addGoodsBrand",
                    type : 'POST',
                    data : new FormData($("#form-gbrand-add")[0]),
                    dataType: 'JSON',
                    cache: false,
                    processData: false,
                    contentType: false,
                    success: function(data){
                        if(data.result){
                            parent.layer.msg(data.data,{icon:6, time:1000}, function(){
                                //刷新父框架数据
                                parent.$('.layui-laypage-refresh')[0].click();
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
                    },
                    error : function(err) {
                    }
                });
                return false;
            }
        });
    });
</script>
</body>
</html>
