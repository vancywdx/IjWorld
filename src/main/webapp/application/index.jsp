<%--
  Created by IntelliJ IDEA.
  User: wdx
  Date: 2019/10/10
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>爱机饰界-首页</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

    <script type="text/javascript">
        var navID = '1';
        var menuID = '0';
    </script>
</head>

<body>
<!-- header -->
<jsp:include page="common/header.jsp"/>

<div class="homeban">
    <ul class="banlist">
        <li style=" background:url(uploadfiles/homeban_1_03.jpg) no-repeat center top;"><a href="http://www.baidu.com" target="_blank"></a></li>
        <li style=" background:url(uploadfiles/homeban_1_03.jpg) no-repeat center top;"><a href="http://www.google.com" target="_blank"></a></li>
        <li style=" background:url(uploadfiles/homeban_1_03.jpg) no-repeat center top;"><a href="http://www.hao123.com" target="_blank"></a></li>
    </ul>
    <div class="tablist">
        <span></span>
        <span></span>
        <span></span>
        <div class="ban_next"></div>
    </div>
</div>
<script type="text/javascript">
    $(".ban_next").after('<div class="ban_list"><a href="http://www.baidu.com" target="_blank"><img src="uploadfiles/fwcx_03.jpg" /></a><a href="http://www.baidu.com" target="_blank"><img src="uploadfiles/mtbd_03.jpg" /></a><a href="http://www.baidu.com" target="_blank"><img src="uploadfiles/khfw_03.jpg" /></a></div>')
    $(".ban_list a:last").css("border","none")
</script>
<script type="text/javascript" src="js/banner.js"></script>
<div class="Contindex">
    <div class="home_pro">
        <h1 class="h1"><span class="span1 span"><em class="em">产品系列</em><a href="#">详细>></a></span><span class="span2"><em>关于我们</em><a href="#">详细>></a></span><span class="span3"><em>品牌浏览</em><a href="#">详细>></a></span></h1>
        <div class="div div_pro" style=" display:block;">
            <ul>
                <li>
                    <a href="#"><img src="uploadfiles/homr_pro_img_03.jpg" width="317" height="230" /></a>
                    <p><a href="#">超薄透明硅胶外壳</a></p>
                </li>
                <li>
                    <a href="#"><img src="uploadfiles/homr_pro_img_03.jpg" width="317" height="230" /></a>
                    <p><a href="#">超薄透明硅胶外壳</a></p>
                </li>
                <li>
                    <a href="#"><img src="uploadfiles/homr_pro_img_03.jpg" width="317" height="230" /></a>
                    <p><a href="#">超薄透明硅胶外壳</a></p>
                </li>
            </ul>
        </div>
        <div class="div">
            AINYTECH LIMITED创建于2000年，2006年在莫斯科成立了分公司。我们正在生产和销售配件的PDA，通信器，PSP和其他的高质量的产品。好的价格和快速的工作帮助我们在市场上占有一席之地，现在许多客户与我们一起工作，在中国和俄罗斯。商品采购和质量控制的专业从事独立的团队，这使我们为客户提供优质的商品，价格低，包括过去的新奇。提供的合作！公司AINYTECH LIMITED理想的合作伙伴！
        </div>
        <div class="div div_pro">
            <ul>
                <li>
                    <a href="#"><img src="uploadfiles/homr_pro_img_03.jpg" width="317" height="230" /></a>
                    <p><a href="#">超薄透明硅胶外壳</a></p>
                </li>
                <li>
                    <a href="#"><img src="uploadfiles/homr_pro_img_03.jpg" width="317" height="230" /></a>
                    <p><a href="#">超薄透明硅胶外壳</a></p>
                </li>
                <li>
                    <a href="#"><img src="uploadfiles/homr_pro_img_03.jpg" width="317" height="230" /></a>
                    <p><a href="#">超薄透明硅胶外壳</a></p>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">
        $(".home_pro .div_pro li").each(function() {
            if(($(this).index()+1)%3==0){
                $(this).css("margin","0");
            }
        });
        $(".home_pro .h1 span em").click(function(){
            $(".home_pro .h1 span em").removeClass("em");
            $(this).addClass("em");
            $(".home_pro .h1 span").removeClass("span");
            $(this).parent("span").addClass("span")
            var index=$(this).parent("span").index();
            $(".home_pro .div").hide();
            $(".home_pro .div").eq(index).show()
        })
    </script>
    <div class="clear"></div>
    <div class="home_news">
        <div class="home_news_t"></div>
        <div class="con">
            <img src="uploadfiles/home_news_img_03.jpg" width="329" height="236" />
            <div class="right">
                <h3 class="h3"><a href="#">更多>></a>最新资讯<em>/ News</em></h3>
                <ul>
                    <li><em>2014/09/02</em><span>【新品上市】</span><a href="#">开启新旅程 将亮相Macworld 2014</a></li>
                    <li><em>2014/09/02</em><span>【新品上市】</span><a href="#">开启新旅程 将亮相Macworld 2014</a></li>
                    <li><em>2014/09/02</em><span>【新品上市】</span><a href="#">开启新旅程 将亮相Macworld 2014</a></li>
                    <li><em>2014/09/02</em><span>【新品上市】</span><a href="#">开启新旅程 将亮相Macworld 2014</a></li>
                    <li><em>2014/09/02</em><span>【新品上市】</span><a href="#">开启新旅程 将亮相Macworld 2014</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="home_link">
        <div class="title">
            旗下平台<br /><span>000000</span>
        </div>
        <div class="hd">
            <ul>
                <li><a href="http://www.baidu.com" target="_blank"><img src="uploadfiles/link_img_03.jpg" width="123" height="31" /></a></li>
                <li><a href="http://www.google.com" target="_blank"><img src="uploadfiles/home_news_img_03.jpg" width="123" height="31" /></a></li>
                <li><a href="http://www.hao123.com" target="_blank"><img src="uploadfiles/homr_pro_img_03.jpg" width="123" height="31" /></a></li>
                <li><a href="http://www.360.com" target="_blank"><img src="uploadfiles/news_img_03.jpg" width="123" height="31" /></a></li>
                <li><a href="#" target="_blank"><img src="uploadfiles/regis_img_03.jpg" width="123" height="31" /></a></li>
                <li><a href="http://www.easou.com" target="_blank"><img src="uploadfiles/contact_img_03.jpg" width="123" height="31" /></a></li>
            </ul>
        </div>
        <div class="link_next"></div>
    </div>
    <div class="clear"></div>
</div>
<script type="text/javascript">
    $(function(){
        var _num=0;
        var _big=5;	//当li大于多少个才执行滚动效果
        var _leng=$(".home_link ul li").length;	//获取li个数
        var _width=$(".home_link ul li:first").outerWidth(true);	//获取li的内外边距+边框+宽度
        $(".home_link ul").css("width",_leng*2*_width);	//给ul加上宽度
        if(_leng>_big){	//当li个数大于big才执行的效果
            var html=$(".home_link ul li").clone();	//复制ul里的html
            $(".home_link ul li:last").after(html);//将复制的ul内容插入到ul后边
            $(".link_next").click(function(){
                if(!$(".home_link ul").is(":animated")){	//当单击按钮时判断ul是否在执行动画、不在执行动画时才触发单击效果。
                    _num++;
                    $(".home_link ul").animate({left:_num*-_width},500,function(){
                        if(_num>_leng-1){	//执行完滚动效果时判断_num值使其产生无缝滚动效果、如果_num值大于li个数立即让ul的left值等于0从而产生无缝滚动的效果。
                            _num=0;
                            $(".home_link ul").css("left","0");
                        }
                    })
                }
            })
        }
    })
</script>

<!-- footer -->
<jsp:include page="common/footer.jsp"/>
</body>
</html>
