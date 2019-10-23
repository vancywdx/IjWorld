<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lcyex
  Date: 2019/10/11
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <title>商品类别管理</title>
</head>
<body id="goodsTypeBody">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 类别管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
    <div class="text-c">
        <input type="text" class="input-text" style="width:250px" placeholder="输入商品类别" id="gtypeName" name="gtypeName" value="${gtypeName}">
        <button type="submit" class="btn btn-success radius" id="query" name="" onclick="getGoodsTypeListByCondition()"><i class="Hui-iconfont">&#xe665;</i> 搜类别</button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                <i class="Hui-iconfont">&#xe6e2;</i> 批量删除
            </a>
            <a href="javascript:;" onclick="gtype_add('添加商品类别','goodsType/toAdd','','300')" class="btn btn-primary radius" id="add">
                <i class="Hui-iconfont">&#xe600;</i> 添加商品类别
            </a>
        </span>
        <span class="r">共有数据：<strong>${pageInfo.total}</strong> 条</span>
    </div>
    <table class="table table-border table-bordered table-hover table-bg table-sort" id="tab">
        <thead>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="80">ID</th>
            <th width="100">类别名</th>
            <th width="100">父类名</th>
            <th width="70">状态</th>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="goodsType">
            <tr class="text-c">
                <td><input type="checkbox" value="1" name=""></td>
                <td>${goodsType.id}</td>
                <td>${goodsType.gtypeName}</td>
                <td>${goodsType.gtypeParentName == null? '无':goodsType.gtypeParentName}</td>
                <td class="td-status">
                    ${goodsType.flag ? '<span class="label label-success radius">已启用</span>':'<span class="label label-defaunt radius">已停用</span>'}
                </td>
                <td class="td-manage">
                    <c:choose>
                        <c:when test="${goodsType.flag eq 'true'}">
                            <a title="停用" href="javascript:;" onClick="gtype_stop(this,'${goodsType.id}')" style="text-decoration:none">
                                <i class="Hui-iconfont">&#xe631;</i>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a title="启用" href="javascript:;" onClick="gtype_start(this,'${goodsType.id}')" style="text-decoration:none">
                                <i class="Hui-iconfont">&#xe6e1;</i>
                            </a>
                        </c:otherwise>
                    </c:choose>
                    <a title="编辑" href="javascript:;" onclick="gtype_edit('编辑','goodsType/toUpdate','${goodsType.id}','','310')" class="ml-5" style="text-decoration:none">
                        <i class="Hui-iconfont">&#xe6df;</i>
                    </a>
                    <a title="删除" href="javascript:;" onclick="gtype_del(this,'${goodsType.id}')" class="ml-5" style="text-decoration:none">
                        <i class="Hui-iconfont">&#xe6e2;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--展示分页导航条--%>
    <jsp:include page="/application/back/common/page.jsp">
        <jsp:param name="bodyId" value="goodsTypeBody"></jsp:param>
    </jsp:include>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">

    //根据条件查询商品类别信息
    function getGoodsTypeListByCondition(){
        var gtypeName = $("#gtypeName").val();
        $("#goodsTypeBody").load("goodsType/getGoodsTypeListByCondition",{'gtypeName':gtypeName})
    }

    //商品类别-添加
    function gtype_add(title,url,w,h){
        layer_show(title,url,w,h);
    }

    //商品类别-停用
    function gtype_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            $.ajax({
                url: "goodsType/stopGoodsType",
                type: "post",
                data: "id="+id,
                success: function(data){
                    if(data.result){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="gtype_start(this,'+id+')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
                        $(obj).remove();
                        layer.msg('已停用!',{icon: 6,time:2000});
                    }else{
                        layer.msg('停用失败!',{icon: 5,time:2000});
                    }
                }
            })
        });
    }

    //商品类别-启用
    function gtype_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            $.ajax({
                url: "goodsType/startGoodsType",
                type: "post",
                data: "id="+id,
                success: function(data){
                    if(data.result){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="gtype_stop(this,'+id+')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                        $(obj).remove();
                        layer.msg('已启用!',{icon: 6,time:2000});
                    }else{
                        layer.msg('启用失败!',{icon: 5,time:2000});
                    }
                }
            })
        });
    }

    //商品类别-删除
    function gtype_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                url: "goodsType/deleteGoodsTypeById",
                type: "post",
                data: "id="+id,
                success:function(data){
                    if(data.result){
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!',{icon:6,time:2000});
                    }else{
                        layer.msg('删除失败!',{icon:5,time:2000});
                    }
                }
            })
        });
    }

    //商品类别-编辑
    function gtype_edit(title,url,id,w,h){
        url = url + "?id="+id;
        layer_show(title,url,w,h);
    }

</script>
</body>
</html>
