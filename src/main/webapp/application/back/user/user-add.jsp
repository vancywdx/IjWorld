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
    <title>添加用户</title>
</head>
<body>
<div class="pd-20">
    <form action="sysUser/add" type="post" class="form form-horizontal" id="form-user-add">
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>用户名：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" value="" placeholder="" id="username" name="username" datatype="*2-16" nullmsg="用户名不能为空">
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>密码：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" value="" placeholder="" id="password" name="password" datatype="*2-16" nullmsg="密码不能为空">
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3" for="birthday"><span class="c-red">*</span>生日：</label>
            <div class="formControls col-5">
                <input type="date" class="input-text" value="" placeholder="" id="birthday" name="birthday" datatype="*2-16" nullmsg="生日不能为空">
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>性别：</label>
            <div class="formControls col-5 skin-minimal">
                <div class="radio-box">
                    <input type="radio" id="sex-1" name="sex" value="1" datatype="*" nullmsg="请选择性别！" sucmsg=" ">
                    <label for="sex-1">男</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-2" name="sex" value="0">
                    <label for="sex-2">女</label>
                </div>

            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>手机：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" value="" placeholder="" id="phone" name="phone"  datatype="m" nullmsg="手机不能为空">
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>邮箱：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" placeholder="@" name="email" id="email" datatype="e" nullmsg="请输入邮箱！">
            </div>
            <div class="col-4"> </div>
        </div>

        <div class="row cl">
            <label class="form-label col-3">是否管理员：</label>
            <div class="formControls col-5"> <span class="select-box">
        <select class="select" size="1" name="isAdmin" datatype="*" nullmsg="请选择！">
          <option value="" selected>请选择</option>
          <option value="1">是</option>
          <option value="0">否</option>
        </select>
        </span> </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3">个人介绍：</label>
            <div class="formControls col-5">
                <textarea name="introduce" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,100)"></textarea>
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

//        $("#form-user-add").Validform({
//            tiptype:2,
//            callback:function(form){
//                //form[0].submit();
//                $.ajax({
//                    url:"sysUser/add",
//                    type: "post",
//                    data:$("#form-user-add").serialize(),
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

        //用户-添加
        $("#form-user-add").Validform({
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


