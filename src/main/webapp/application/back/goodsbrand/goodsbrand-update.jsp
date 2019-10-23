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
    <title>编辑品牌信息</title>
</head>
<body>
<div class="pd-20">
    <form class="form form-horizontal" id="form-gbrand-update" enctype="multipart/form-data" method="post">
        <input type="hidden" name="id" value="${goodsBrand.id}"/>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>品牌名称：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" placeholder=""  name="gbrandName" value="${goodsBrand.gbrandName}" datatype="*2-16" nullmsg="品牌名称不能为空">
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>Logo：</label>
            <div class="formControls col-5">
                <img src="uploadfiles/brand/${goodsBrand.gbrandLogo}" width="100px" height="100px" id="logo_preview"/>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"></label>
            <div class="formControls col-5">
                <span class="btn-upload form-group">
			        <input class="input-text upload-url" type="text" readonly datatype="*" ignore="ignore" style="width:200px">
			        <a href="javascript:;" class="btn btn-primary upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
			        <input type="file" id="gbrandLogo" name="gbrandLogo" accept="image/png,image/jpeg" class="input-file">
		        </span>
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>Logo缩略图：</label>
            <div class="formControls col-5">
                <img src="uploadfiles/brand/${goodsBrand.gbrandLogoThum}" width="100px" height="50px" id="logothum_preview"/>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"></label>
            <div class="formControls col-5">
                <span class="btn-upload form-group">
			        <input class="input-text upload-url" type="text" readonly datatype="*" ignore="ignore" style="width:200px">
			        <a href="javascript:;" class="btn btn-primary upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
			        <input type="file" id="gbrandLogoThum" name="gbrandLogoThum" accept="image/png,image/jpeg" class="input-file" >
		        </span>
            </div>
            <div class="col-4"> </div>
        </div>

        <div class="row cl">
            <label class="form-label col-3">品牌介绍：</label>
            <div class="formControls col-5">
                <textarea name="gbrandDesc" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入15个字符" datatype="*10-255" dragonfly="true" nullmsg="简介不能为空！" onKeyUp="textarealength(this,255)">${goodsBrand.gbrandDesc}</textarea>
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
<script type="text/javascript">

    $(function(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        <%--$("logo_preview").src("uploadfiles/goods/${goods.goodsLogo}");--%>
        <%--$("logothum_preview").src("uploadfiles/goods/${goods.goodsLogoThum}");--%>

        //上传图片预览（Logo）
        $('#gbrandLogo').change(function(){
            // 获取FileList的第一个元素
            var logo = document.getElementById('gbrandLogo').files[0];
            src = window.URL.createObjectURL(logo);
            document.getElementById('logo_preview').src = src
        })

        //上传图片预览（Logo缩略图）
        $("#gbrandLogoThum").change(function () {
            var logothum = document.getElementById('gbrandLogoThum').files[0];
            src = window.URL.createObjectURL(logothum);
            document.getElementById('logothum_preview').src = src
        })

        //商品品牌-编辑
        $("#form-gbrand-update").Validform({
            tiptype:2,
            ajaxPost:true,
            callback:function(form){
                $.ajax({
                    url : "goodsBrand/updateGoodsBrand",
                    type : 'POST',
                    data : new FormData($("#form-gbrand-update")[0]),
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
