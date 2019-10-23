<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lcyex
  Date: 2019/10/13
  Time: 10:02
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
    <link rel="stylesheet" href="/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <title>商品列表</title>
</head>
<body class="pos-r" id="goodsBody">
<%--<div class="pos-a" style="width:0px;left:0;top:0; bottom:0; height:100%; border-right:1px solid #e5e5e5; background-color:#f5f5f5">
    <ul id="treeDemo" class="ztree">
    </ul>
</div>--%>
<div style="margin-left:0px;">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 商品列表 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="pd-20">
        <div class="text-c">
            <input type="text" id="goodsName" name="goodsName" value="${goodsName}"  placeholder="输入商品名称" style="width:250px" class="input-text">
            <button name="" id="query" onclick="getGoodsListByCondition()" class="btn btn-success" type="submit" ><i class="Hui-iconfont">&#xe665;</i> 搜商品</button>
        </div>
        <div class="cl pd-5 bg-1 bk-gray mt-20">
            <span class="l">
                <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                    <i class="Hui-iconfont">&#xe6e2;</i> 批量删除
                </a>
                <a class="btn btn-primary radius" onclick="goods_add('添加商品','goods/toAdd')" href="javascript:;">
                    <i class="Hui-iconfont">&#xe600;</i> 添加商品</a>
            </span>
            <span class="r">共有数据：<strong>${pageInfo.total}</strong> 条</span>
        </div>
        <table class="table table-border table-bordered table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="40"><input name="" type="checkbox" value=""></th>
                <th width="40">ID</th>
                <th width="60">商品图片</th>
                <th width="80">商品名称</th>
                <th width="100">描述</th>
                <th width="100">单价</th>
                <th width="60">库存</th>
                <th width="60">状态</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${pageInfo.list}" var="goods">
                    <tr class="text-c va-m">
                        <td><input name="" type="checkbox" value=""></td>
                        <td>${goods.id}</td>
                        <td><a onClick="product_show('${goods.goodsName}','product-show.html','10001')" href="javascript:;"><img width="120dp" height="120dp" class="product-thumb" src="/uploadfiles/goods/${goods.goodsPic}"></a></td>
                        <td class="text-l"><a style="text-decoration:none" onClick="product_show('${goods.goodsName}','product-show.html','10001')" href="javascript:;">${goods.goodsName}</a></td>
                        <td class="text-l">${goods.goodsDesc}</td>
                        <td><span class="price">${goods.goodsPrice}</span> 元/件</td>
                        <td>${goods.goodsStock}</td>
                        <td class="td-status">
                            ${goods.flag ? '<span class="label label-success radius">已上架</span>':'<span class="label label-defaunt radius">已下架</span>'}
                        </td>
                        <td class="td-manage">
                            <c:choose>
                                <c:when test="${goods.flag eq 'true'}">
                                    <a title="下架" href="javascript:;" onClick="goods_stop(this,'${goods.id}')" style="text-decoration:none">
                                        <i class="Hui-iconfont">&#xe6de;</i>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a title="上架" href="javascript:;" onClick="goods_start(this,'${goods.id}')" style="text-decoration:none">
                                        <i class="Hui-iconfont">&#xe603;</i>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                            <a style="text-decoration:none" class="ml-5" onClick="goods_edit('商品编辑','goods/toUpdate','${goods.id}')" href="javascript:;" title="编辑">
                                <i class="Hui-iconfont">&#xe6df;</i>
                            </a>
                            <a style="text-decoration:none" class="ml-5" onClick="goods_del(this,'${goods.id}')" href="javascript:;" title="删除">
                                <i class="Hui-iconfont">&#xe6e2;</i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <%--展示分页导航条--%>
        <jsp:include page="/application/back/common/page.jsp">
            <jsp:param name="bodyId" value="goodsBody"></jsp:param>
        </jsp:include>
    </div>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: false,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable:true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function(treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree");
                if (treeNode.isParent) {
                    zTree.expandNode(treeNode);
                    return false;
                } else {
                    demoIframe.attr("src",treeNode.file + ".html");
                    return true;
                }
            }
        }
    };

    var zNodes =[
        { id:1, pId:0, name:"一级分类", open:true},
        { id:11, pId:1, name:"二级分类"},
        { id:111, pId:11, name:"三级分类"},
        { id:112, pId:11, name:"三级分类"},
        { id:113, pId:11, name:"三级分类"},
        { id:114, pId:11, name:"三级分类"},
        { id:115, pId:11, name:"三级分类"},
        { id:12, pId:1, name:"二级分类 1-2"},
        { id:121, pId:12, name:"三级分类 1-2-1"},
        { id:122, pId:12, name:"三级分类 1-2-2"},
    ];

    var code;

    function showCode(str) {
        if (!code) code = $("#code");
        code.empty();
        code.append("<li>"+str+"</li>");
    }

    $(document).ready(function(){
        var t = $("#treeDemo");
        t = $.fn.zTree.init(t, setting, zNodes);
        demoIframe = $("#testIframe");
        demoIframe.bind("load", loadReady);
        var zTree = $.fn.zTree.getZTreeObj("tree");
        zTree.selectNode(zTree.getNodeByParam("id",'11'));
    });

    /*图片-查看*/
    function product_show(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    //根据条件查询商品信息
    function getGoodsListByCondition(){
        var goodsName = $("#goodsName").val();
        $("#goodsBody").load("goods/getGoodsListByCondition",{'goodsName':goodsName})
    }

    //商品-下架
    function goods_stop(obj,id){
        layer.confirm('确认要下架吗？',function(index){
            $.ajax({
                url: "goods/stopGoods",
                type: "post",
                data: "id="+id,
                success: function(data){
                    if(data.result){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="goods_start(this,'+id+')" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
                        $(obj).remove();
                        layer.msg(data.data,{icon: 6,time:2000});
                    }else{
                        layer.msg(data.data,{icon: 5,time:2000});
                    }
                }
            })
        });
    }

    //商品-上架
    function goods_start(obj,id){
        layer.confirm('确认要上架吗？',function(index){
            $.ajax({
                url: "goods/startGoods",
                type: "post",
                data: "id="+id,
                success: function(data){
                    if(data.result){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="goods_stop(this,'+id+')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已上架</span>');
                        $(obj).remove();
                        layer.msg(data.data,{icon: 6,time:2000});
                    }else{
                        layer.msg(data.data,{icon: 5,time:2000});
                    }
                }
            })
        });
    }

    //商品-删除
    function goods_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                url: "goods/deleteGoodsById",
                type: "post",
                data: "id="+id,
                success:function(data){
                    if(data.result){
                        $(obj).parents("tr").remove();
                        layer.msg(data.data,{icon:6,time:2000});
                    }else{
                        layer.msg(data.data,{icon:5,time:2000});
                    }
                }
            })
        });
    }

    //商品-添加
    function goods_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    //商品-编辑
    function goods_edit(title,url,id){
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
