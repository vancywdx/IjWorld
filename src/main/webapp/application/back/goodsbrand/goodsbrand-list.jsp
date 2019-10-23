<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lcyex
  Date: 2019/10/12
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <title>品牌管理</title>
</head>
<body id="goodsBrandBody">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 品牌管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
    <div class="text-c">
        <input type="text" class="input-text" style="width:250px" placeholder="输入品牌名称" id="gbrandName" name="gbrandName" value="${gbrandName}">
        <button type="submit" class="btn btn-success radius" id="query" name="" onclick="getGoodsBrandListByCondition()"><i class="Hui-iconfont">&#xe665;</i> 搜品牌</button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                <i class="Hui-iconfont">&#xe6e2;</i> 批量删除
            </a>
            <a href="javascript:;" onclick="gbrand_add('添加品牌','goodsBrand/toAdd')" class="btn btn-primary radius" id="add">
                <i class="Hui-iconfont">&#xe600;</i> 添加品牌
            </a>
        </span>
        <span class="r">共有数据：<strong>${pageInfo.total}</strong> 条</span>
    </div>
    <table class="table table-border table-bordered table-bg table-sort">
        <thead>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="25">ID</th>
            <th width="120">LOGO</th>
            <th width="120">品牌名称</th>
            <th>描述</th>
            <th width="50">状态</th>
            <th width="80">操作</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${pageInfo.list}" var="goodsBrand">
                <tr class="text-c">
                    <td><input name="" type="checkbox" value=""></td>
                    <td>${goodsBrand.id}</td>
                    <td><img src="/uploadfiles/brand/${goodsBrand.gbrandLogoThum eq ''?'nopic.png':goodsBrand.gbrandLogoThum}" width="100dp" height="50dp"></td>
                    <td>${goodsBrand.gbrandName}</td>
                    <td class="text-l">${goodsBrand.gbrandDesc}</td>
                    <td class="td-status">
                            ${goodsBrand.flag ? '<span class="label label-success radius">已上架</span>':'<span class="label label-defaunt radius">已下架</span>'}
                    </td>
                    <td class="td-manage">
                        <c:choose>
                            <c:when test="${goodsBrand.flag eq 'true'}">
                                <a title="下架" href="javascript:;" onClick="gbrand_stop(this,'${goodsBrand.id}')" style="text-decoration:none">
                                    <i class="Hui-iconfont">&#xe631;</i>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a title="上架" href="javascript:;" onClick="gbrand_start(this,'${goodsBrand.id}')" style="text-decoration:none">
                                    <i class="Hui-iconfont">&#xe6e1;</i>
                                </a>
                            </c:otherwise>
                        </c:choose>
                        <a title="编辑" href="javascript:;" onclick="gbrand_edit('修改品牌信息','goodsBrand/toUpdate','${goodsBrand.id}')" class="ml-5" style="text-decoration:none">
                            <i class="Hui-iconfont">&#xe6df;</i>
                        </a>
                        <a title="删除" href="javascript:;" onclick="gbrand_del(this,'${goodsBrand.id}')" class="ml-5" style="text-decoration:none">
                            <i class="Hui-iconfont">&#xe6e2;</i>
                        </a>
                    </td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
    <%--展示分页导航条--%>
    <jsp:include page="/application/back/common/page.jsp">
        <jsp:param name="bodyId" value="goodsBrandBody"></jsp:param>
    </jsp:include>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript" src="js/H-ui.admin.product.js"></script>
<script type="text/javascript">

    //根据条件查询商品品牌信息
    function getGoodsBrandListByCondition(){
        var gbrandName = $("#gbrandName").val();
        $("#goodsBrandBody").load("goodsBrand/getGoodsBrandListByCondition",{'gbrandName':gbrandName})
    }

    //商品品牌-添加
    function gbrand_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    //商品品牌-下架
    function gbrand_stop(obj,id){
        layer.confirm('确认要下架吗？',function(index){
            $.ajax({
                url: "goodsBrand/stopGoodsBrand",
                type: "post",
                data: "id="+id,
                success: function(data){
                    if(data.result){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="gbrand_start(this,'+id+')" href="javascript:;" title="上架"><i class="Hui-iconfont">&#xe6e1;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
                        $(obj).remove();
                        layer.msg('已下架!',{icon: 6,time:2000});
                    }else{
                        layer.msg('下架失败!',{icon: 5,time:2000});
                    }
                }
            })
        });
    }

    //商品品牌-上架
    function gbrand_start(obj,id){
        layer.confirm('确认要上架吗？',function(index){
            $.ajax({
                url: "goodsBrand/startGoodsBrand",
                type: "post",
                data: "id="+id,
                success: function(data){
                    if(data.result){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="gbrand_stop(this,'+id+')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe631;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已上架</span>');
                        $(obj).remove();
                        layer.msg('已上架!',{icon: 6,time:2000});
                    }else{
                        layer.msg('上架失败!',{icon: 5,time:2000});
                    }
                }
            })
        });
    }

    //商品品牌-删除
    function gbrand_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                url: "goodsBrand/deleteGoodsBrandById",
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

    //商品品牌-编辑
    function gbrand_edit(title,url,id){
        url = url + "?id="+id;
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

</script>
</body>
</html>
