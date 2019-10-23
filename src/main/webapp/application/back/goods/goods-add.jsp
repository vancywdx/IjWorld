<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lcyex
  Date: 2019/10/13
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/"/>
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <link href="lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
    <title>新增商品</title>
</head>
<body>
<div class="pd-20">
    <form action="" method="post" class="form form-horizontal" id="form-goods-add">
        <div class="row cl">
            <label class="form-label col-2"><span class="c-red">*</span>商品名称：</label>
            <div class="formControls col-8">
                <input type="text" class="input-text" id="goodsName" name="goodsName" datatype="*2-50" nullmsg="商品名称不能为空">
            </div>
            <div class="col-2"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-2"><span class="c-red">*</span>商品图片：</label>
            <div class="formControls col-8">
                <span class="btn-upload form-group">
			        <input class="input-text upload-url" type="text" readonly datatype="*" nullmsg="请选择商品图片！" style="width:750px">
			        <a href="javascript:;" class="btn btn-primary upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
			        <input type="file" name="goodsImg" accept="image/png,image/jpeg" class="input-file">
		        </span>
            </div>
            <div class="col-2"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-2"><span class="c-red">*</span>所属类别：</label>
            <div class="formControls col-4">
                <span class="select-box">
                    <select name="goodsParentid" class="select" id="goodsParentid">
                        <c:forEach items="${gtypeParentList}" var="gtype_parent">
                            <option value="${gtype_parent.id}">${gtype_parent.gtypeName}</option>
                        </c:forEach>
                    </select>
				</span>
            </div>
            <div class="formControls col-4">
                <span class="select-box">
                    <select name="goodsFatherid" class="select" id="goodsFatherid">
                        <option value="-1">请选择</option>
                    </select>
				</span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-2"><span class="c-red">*</span>商品品牌：</label>
            <div class="formControls col-4">
                <span class="select-box">
                    <select name="goodsBrandid" class="select">
                       <c:forEach items="${gbrandList}" var="gbrand">
                           <option value="${gbrand.id}">${gbrand.gbrandName}</option>
                       </c:forEach>
                    </select>
				</span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-2"><span class="c-red">*</span>价格：</label>
            <div class="formControls col-4">
                <input type="text" name="goodsPrice" id="goodsPrice" placeholder="" value="" class="input-text" style="width:90%" datatype="*" nullmsg="商品价格不能为空">
                元</div>
            <div class="col-2"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-2"><span class="c-red">*</span>库存：</label>
            <div class="formControls col-4">
                <input type="text" name="goodsStock" id="goodsStock" placeholder="" value="" class="input-text" style="width:90%" datatype="*" nullmsg="商品库存不能为空">
                件</div>
            <div class="col-2"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-2"><span class="c-red">*</span>折扣：</label>
            <div class="formControls col-4">
                <input type="text" name="goodsDiscount" id="goodsDiscount" placeholder="" value="" class="input-text" datatype="/^(0.\d+|0|1)$/" nullmsg="折扣不能为空" errormsg="折扣必须是0-1之间的小数" style="width:90%">
            </div>
            <div class="col-2"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-2">折扣价：</label>
            <div class="formControls col-4">
                <input type="text" name="goodsPriceOff" id="goodsPriceOff" placeholder="" value="" readonly class="input-text" style="width:90%">
                元</div>

        </div>
        <div class="row cl">
            <label class="form-label col-2"><span class="c-red">*</span>商品描述：</label>
            <div class="formControls col-8">
                <textarea name="goodsDesc" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="商品描述不能为空！" onKeyUp="textarealength(this,200)"></textarea>
                <p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
            </div>
            <div class="col-2"> </div>
        </div>
        <div class="row cl">
            <div class="col-10 col-offset-2">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;立即提交&nbsp;&nbsp;">
                <button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
    $(function() {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#goodsDiscount").change(function(){

            if($("#goodsPrice").val() != ''){
                var priceoff = $("#goodsPrice").val() * $("#goodsDiscount").val();
                $("#goodsPriceOff").val(priceoff.toFixed(2));
            }else{
                return;
            }

        })


        //级联设置二级类别
        $("#goodsParentid").change(function(){
            var parentId = ($(this).val());
            //根据ID获取父类类别
            $.ajax({
                url: "goodsType/getGoodsTypeListByParentid",
                type: "post",
                data: "id="+parentId,
                success:function(data){
                    var gtype = eval(data);
                    var text = "";
                    for(var i=0;i<gtype.length;i++){
                        text += '<option value="'+gtype[i].id+'">'+gtype[i].gtypeName+'</option>';
                    }
                    $("#goodsFatherid").html(text);
                }
            })
        })

        $("#goodsParentid").trigger("change");

        //商品-添加
        $("#form-goods-add").Validform({
            tiptype:2,
            ajaxPost:true,
            callback:function(form){
                $.ajax({
                    url : "goods/addGoods",
                    type : 'POST',
                    data : new FormData($("#form-goods-add")[0]),
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
    })
</script>
</body>
</html>
