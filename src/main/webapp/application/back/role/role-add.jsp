<%--
  Created by IntelliJ IDEA.
  User: wdx
  Date: 2019/10/11
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/" >
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <title>添加角色</title>
</head>
<body>
<div class="pd-20">
    <form  action="role/addRole" type="post" class="form form-horizontal" id="form-role-add">
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>角色名：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" value="" placeholder="" id="roleName" name="roleName" datatype="*2-16" nullmsg="角色名不能为空">
            </div>
            <div class="col-4"> </div>
        </div>

        <div class="row cl">
            <label class="form-label col-3">角色描述：</label>
            <div class="formControls col-5">
                <textarea name="roleDesc" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="角色描述不能为空！" onKeyUp="textarealength(this,100)"></textarea>
                <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <div class="col-9 col-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;添加&nbsp;&nbsp;">
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

//        $("#form-role-add").Validform({
//            tiptype:2,
//            callback:function(form){
//                //form[0].submit();
//                $.ajax({
//                    url:"role/addRole",
//                    type: "post",
//                    data:$("#form-role-add").serialize(),
//                    success:function(data){
//                        if(data.result){
//                            parent.layer.msg('添加成功!',{icon: 6,time:1000});
//                        }else {
//                            parent.layer.msg('添加失败!',{icon: 5,time:1000});
//                        }
//                    }
//                })
//                var index = parent.layer.getFrameIndex(window.name);
//                //$('#refresh', parent.document).click();
//                parent.$('.layui-laypage-refresh')[0].click();
//                parent.layer.close(index);
//            }
//        });

        //角色-添加
        $("#form-role-add").Validform({
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


