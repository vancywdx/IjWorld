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
    <title>添加商品类别</title>
</head>
<body>
<div class="pd-20">
    <form action="goodsType/addGoodsType" type="post" class="form form-horizontal" id="form-gtype-add">
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>商品类别名：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" placeholder=""  name="gtypeName" datatype="*2-16" nullmsg="商品类别名不能为空">
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>所属类别：</label>
            <div class="formControls col-5"> <span class="select-box">
        <select class="select" size="1" name="gtypeParentid" datatype="*" nullmsg="请选择所属类别！">
          <option value="0" selected>无</option>
           <c:forEach items="${goodsTypeList}" var="goodsType">
               <option value="${goodsType.id}">${goodsType.gtypeName}</option>
           </c:forEach>
        </select>
        </span> </div>
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

//        $("#form-gtype-add").Validform({
//            tiptype:2,
//            callback:function(form){
//                //form[0].submit();
//                $.ajax({
//                    url:"goodsType/addGoodsType",
//                    type:"post",
//                    data:$("#form-gtype-add").serialize(),
//                    success:function(data){
//                        if(data.result){
//                            //弹出提示
//                            parent.layer.msg(data.data, {icon:6, time:2000});
//                        }else{
//                            parent.layer.msg(data.data,{icon: 5,time:2000});
//                        }
//                    }
//                });
//                var index = parent.layer.getFrameIndex(window.name);
//                //刷新父框架数据
//                parent.$('.layui-laypage-refresh')[0].click();
//                //关闭弹出层
//                parent.layer.close(index);
//            }
//        });

        //商品类别-添加
        $("#form-gtype-add").Validform({
            tiptype:2,
            ajaxPost:true,
            callback:function(data){
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
            }
        });
    });

</script>
</body>
</html>
