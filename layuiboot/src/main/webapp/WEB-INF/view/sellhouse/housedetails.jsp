<%--
  Created by IntelliJ IDEA.
  User: snake
  Date: 2018/3/15
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    *{margin: 0;padding:0; }
    ul{list-style: none;}
    .banner{width: 600px;height: 300px;border: 2px solid #ccc;margin: 100px auto;position: relative;overflow: hidden;z-index: 1;}
    .img{position: absolute;top: 0;left: 0;}
    .des{position: absolute;bottom: 0;left: 0;z-index: -2;background: #ccc}
    .des li{float: left;width: 600px;}
    .img li{float: left;}
    .num{position: absolute;bottom: 10px;width: 100%;text-align: center;font-size: 0;}
    .num li{width: 10px;height: 10px;background:rgba(0,0,0,0.5);display: block;border-radius: 100%;display: inline-block;margin: 0 5px;cursor: pointer;}
    .btn{display: none;}
    .btn span{display: block;width: 50px;height: 100px;background: rgba(0,0,0,0.6);color: #fff;font-size: 40px;line-height: 100px;text-align: center;cursor:pointer;}
    .btn .prev{position: absolute;left: 0;top: 50%;margin-top: -50px;}
    .btn .next{position: absolute;right: 0;top: 50%;margin-top: -50px;}
    .num .active{background-color: #fff;}
    .hide{display: none;}
</style>
<head>
    <title>房屋详情</title>
    <link href="https://beijing.anjuke.com/prop/view/A1143604949" rel="canonical">
    <!--start-->
    <link rel="stylesheet" rev="stylesheet" href="https://include.anjukestatic.com/anjuke-user/res/20180315.1504.0/b/Ershou_Web_Property_View_View3.css" type="text/css" />
    <!--end-->
    <script type="text/javascript">var PAGESTART = +new Date(); var PHPVERSION = '20180315.1504.0';</script>

    <script type="text/javascript" src="//include.anjukestatic.com/usjs/base/logger/dom.dom/dom.query/ajax/event/ui.panel/ui.autocomplete/ui.exposure/cookie/site/utils.base/a7745b92361b3d50fe42c424545f2d56.js"></script>
    <!-- <script type="text/javascript" src="//include.anjukestatic.com/ujs/chat.opener/a7745b92361b3d50fe42c424545f2d56.js" crossorigin></script> -->
    <!-- -->
    <link rel="shortcut icon" href="https://pages.anjukestatic.com/usersite/site/img/global/1/favicon.ico" />
    <link rel="icon" href="https://pages.anjukestatic.com/usersite/site/img/global/1/favicon.ico" type="image/ico" />
    <script src="../js/jquery-1.8.0.js"></script>
    <script type="text/javascript" src="../js/unslider/unslider.min.js"></script>
    <link rel="stylesheet" href="../js/layui/css/layui.css"/>
    <script src="../js/layui/layui.js"></script>
</head>
<body>
<input type="hidden" id="houseId" value="${houseId}">
<div id="content">
    <div class="p_1180 p_crumbs">
        <a href="../sellhouse/toSellHouseList" class="layui-btn layui-btn-xs" >返回</a>
    </div>

    <div class="wrapper">
        <!--页面左侧-->
        <div class="wrapper-lf clearfix">
            <div class="basic-info clearfix" >
                <span class="light info-tag"><em>${house.price}</em>万</span>
                <span class="info-tag"><em>${house.room}</em>室<em>${house.hall}</em>厅</span>
                <span class="info-tag"><em>${house.area}</em>平方米</span>
                <!-- 这里锚点定位的代码在monthpay2组件里 -->
                <span class="info-tag no-border tag-cal"><i class="iconfont viewpage-calculator">&#xE015;</i>房贷计算</span>
                <div class="moreFunc">
                    <a rel="nofollow"  href="https://www.anjuke.com/mobile?pm=b1028&from=esf_page" class="moreFunc-entrance" id="js_report" target="_blank" data-soj="esf_page"><i class="iconfont">&#xE208;</i>下载app举报
                    </a>&nbsp;|&nbsp;<a href="https://kfzx.anjuke.com/faqDetail/queryDetail?faqId=123&faqTypeId=4" class="moreFunc-entrance" target="_blank">安选假赔百元细则</a>
                </div>
            </div>
            <div class="switch_warpper">
                <div class="switch_with_map">
                        <!-- 把要轮播的地方写上来 -->
                        <!---->
                        <div class="banner" id="b04">
                            <ul class="img" id="housesLideshow">
                            </ul>
                            <ul class="num"></ul>
                            <div class="btn">
                                <span class="prev"><</span>
                                <span class="next">></span>
                            </div>
                        </div>
                        <!---->
                    <div class="switch_tab_wrap " id="switch_tab_wrap">
                        <a class="switch_tag switch_tag_now" href="javascript:slideshow(1);" data-track=pc_fydy_switch_snt id="room_tab">
                            <i class="switch-icon iconfont switch-room-icon">&#xE026;</i>
                            <em class="title">室内图<span id="imgTypeNumber1"></span></em>
                        </a>

                        <a class="switch_tag switch_tag_now" href="javascript:slideshow(2);" data-track=pc_fydy_switch_hxt id="hx_tab">
                            <i class="switch-icon iconfont switch-hx-icon">&#xE013;</i>
                            <em class="title">户型图<span id="imgTypeNumber2"></span></em>
                        </a>
                        <a class="switch_tag switch_tag_now" href="javascript:slideshow(3);" data-track=pc_fydy_switch_hjt id="surround_tab">
                            <i class="switch-icon iconfont switch-surd-icon">&#xE014;</i>
                            <em class="title">环境图<span id="imgTypeNumber3"></span></em>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="houseInfoBox">
            <h4 class="block-title houseInfo-title">房屋信息
                <span class="anxian"><i class="ax-i"></i><span class="ax-d"><i class="iconfont">&#xE057;</i><span>保真保看</span><i class="iconfont">&#xE057;</i><span>真实在售</span><i class="iconfont">&#xE057;</i><span>假赔百元</span></span>
                <div class="anxuan-tip">
                    <em class="arrow-up-t">
                        <em class="arr-t"></em>
                    </em>
                    <p><span>安心挑房：</span>房源存在，价格真实，安心挑房远离虚假。</p>
                    <p><span>安选服务：</span>佣金透明，服务分级，安选服务顺畅交易。</p>
                    <p><span>安全沟通：</span>微聊聊天，保护手机，安全沟通杜绝骚扰。</p>
                </div>
                </span>
                <span class="house-encode">房屋编码： ${house.roomNum}，发布时间：${house.releaseTime}</span></h4>
            <a href="javascript:;" data-trace="{Exp_View_footerSeo:1}"></a>
            <div class="wrapper-rg clearfix">
                <!-- <p class="broker-title"><i class="iconfont">&#xE019;</i><span>经纪人</span></p> -->
                <div class="block-wrap block-nocopy brokerInfo_mod block-wrap-border" style="width: auto">
                    <!--经纪人信息-->
                    <div class="broker-wrap">
                        <div class="img-box system-link-track">

                            <a href="https://beijingfapaiwang.anjuke.com/gongsi-jjr-3979328/" _soj="esf_page"  target="_blank">
                                <img class="brokercard-img" src="${house.empphoto}" title="北京法拍网关越"/>
                            </a>

                            <p class="brokercard-name">${house.empname}</p>
                            <div class="broker-tagdiv clearfix">
                                <a href="javascript:" data-track=pc_fydy_jjrxx_zxzx class="chat-enterance chat-able" onMouseOut="hideImg()" onmouseover="showImg()"><i class="iconfont tag-chat">&#xE029;</i>在线咨询</a>
                                <div id="wxImg" style="display:none;height:80px;back-ground:#ff0000;position:absolute;"><img class="brokercard-img" src="${house.empweixin}" title="微信号"/></div>
                            </div>
                        </div>
                        <div class="broker-level clearfix">
                            <span class="stars-title">等级：</span>
                            <div class="stars-wrap-bk" style="width:36px">
                                <p class="stars-bg" style="width:36px"><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i></p>
                                <p class="stars-solid" style="width:36px"><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i><i class="iconfont">&#xE108;</i></p>
                            </div>
                            <!-- 如果持平显示与同城平均水平持平 -->
                            <div class="tip-box">
                                <!-- prd上规定如果等于平均水平展示‘与同城平均水平持平’ -->
                                <p>打败了22.1%的同城经纪人</p>
                                <i class="icon-arrow"><span></span></i>
                            </div>
                        </div>

                        <div class="brokercard-scorewrap clearfix">
                            <span class="brokercard-scoretitle">得分：</span>
                            <div class="brokercard-scoredetail">
                                <div class="brokercard-sd-cont clearfix">
                        <span class="score-up clearfix no-pd-left" style="height: 30px;">
                <em class="score-num" style="margin-top: -7px;">60</em><br><em>房源</em>
            </span>

                                    <span class="score-down clearfix" style="height: 30px;">
                <em class="score-num" style="margin-top: -7px;">0</em><br><em>服务</em>
            </span>

                                    <span class="score-up clearfix no-bd-rg" style="height: 30px;">
                <em class="score-num" style="margin-top: -7px;">80</em><br><em>评价</em>
            </span>
                                </div>
                                <div class="brokercard-sd-tip" style="bottom:47px;">
                                    <i class="arr-down"><i></i></i>

                                    <div class="score-up"><span class="mg-r">房源真实：<em class="score-num">60</em><i class="score-tag"></i></span><span>打败了9.8%的同城经纪人</span> </div>

                                    <div class="score-down"><span class="mg-r">服务效率：<em class="score-num">0</em><i class="score-tag"></i></span><span>打败了0%的同城经纪人</span>            </div>

                                    <div class="score-up"><span class="mg-r">用户评价：<em class="score-num">80</em><i class="score-tag"></i></span><span>打败了0%的同城经纪人</span>            </div>
                                </div>
                            </div>
                        </div>
                        <div class="brokercard-medal">
                            勋章：
                            <div class="jjr-medal"><i class="iconfont jjr-icn-broker" title="服务年限超过一年，业务熟练的经纪人">&#xE159;</i></div>    </div>

                        <p class="broker-mobile"><i class="iconfont">&#xE047;</i>${house.empphone}</p>

                        <div class="broker-background">
                            <div class="broker-company">

                                <p>公司：<a href="https://beijingfapaiwang.anjuke.com/" target="_blank">北京法拍网</a></p>

                                <p>门店：<a href="https://beijingfapaiwang.anjuke.com/gongsi-md-230935/" target="_blank">海淀万柳店</a></p>

                            </div>
                        </div>
                        <a href="https://beijingfapaiwang.anjuke.com/gongsi-jjr-3979328/" target="_blank" _soj="esf_page" class="broker-morehouse">查看TA的更多房源</a>
                    </div>

                    <div class="overlayback">
                        <div class="warn-win">
                            <div class="warnwin-title"><span>提示</span><i class="iconfont" id="closewin">&#xE073;</i></div>
                            <div class="warnwin-body">您是经纪人账号，请下载<a href="//pages.anjuke.com/app/anjuke/broker_app_v6.html" data-soj="esfwl">移动经纪人</a>随时微聊</div>
                        </div>
                    </div>

                    <div class="block-wrap block-nocopy no-bd-top">
            </div>
    </div>
</div>
            <div class="houseInfo-wrap">
                <div class="houseInfo-detail clearfix">
                    <div class="first-col detail-col">
                        <dl><dt>所属小区：</dt>
                            <dd>
                                <a href="https://beijing.anjuke.com/community/view/56722" target="_blank" _soj=propview>${house.garden}</a>
                            </dd>
                        </dl>
                        <dl><dt>所在位置：</dt>
                            <dd>

                                <p class="loc-text"><a href="https://beijing.anjuke.com/sale/chaoyang/" target="_blank" _soj=propview>${house.sheng}</a>－
                                    <a href="https://beijing.anjuke.com/sale/yayuncun/" target="_blank" _soj=propview>${house.shi}</a>－
                                    ${house.xian}</p>
                                <i class="iconfont i-location">&#xE003;</i>
                            </dd>
                        </dl>
                        <dl><dt>建造年代：</dt><dd>${house.buildingTime}</dd></dl>
                        <dl><dt>房屋类型：</dt><dd>${house.houseType}</dd></dl>
                    </div>
                    <div class="second-col detail-col">
                        <dl><dt>房屋户型：</dt><dd>
                            ${house.room}室
                            ${house.hall}厅
                            ${house.toilet}卫
                        </dd></dl>
                        <dl><dt>建筑面积：</dt><dd>${house.area}平方米</dd></dl>
                        <dl><dt>房屋朝向：</dt><dd>${house.roomDirection}</dd></dl>
                        <dl><dt>所在楼层：</dt><dd>${house.floor}</dd></dl>
                    </div>
                    <div class="third-col detail-col">
                        <dl><dt>装修程度：</dt><dd>${house.fitment}</dd></dl>
                        <dl><dt>房屋单价：</dt><dd>${house.unitPrice}元/m²</dd></dl>
                        <dl><dt>参考首付：</dt><dd>
                            ${house.monthlyPayments}万                    </dd></dl>
                        <dl><dt>参考月供：</dt>
                            <dd><span id="reference_monthpay"> ${house.monthlyPayments}</span></dd>
                        </dl>
                    </div>
                </div>
            </div>
<!--tags-->
<div class="houseInfo-desc">
    <!-- 二手房信息 -->
    <div class="houseInfo-item">
        <h5 class="houseInfo-item-title"><span class="iconfont">&#xE092;</span><span class="title-content">核心卖点</span></h5>
        <div class="houseInfo-item-desc js-house-explain">
            <span style="font-size:14px;">${house.sellingPoint}</span>        </div>
    </div>
    <!-- 二手房信息 -->
    <div class="houseInfo-item">
        <h5 class="houseInfo-item-title"><span class="iconfont">&#xE093;</span><span class="title-content">业主心态</span></h5>
        <div class="houseInfo-item-desc">
           ${house.ownerMentality} </div>
    </div>
    <!-- 二手房信息 -->
    <div class="houseInfo-item">
        <h5 class="houseInfo-item-title"><span class="iconfont">&#xE094;</span><span class="title-content">小区配套</span></h5>
        <div class="houseInfo-item-desc">
           ${house.communityComplete}  </div>
    </div>
    <!-- 二手房信息 -->
    <div class="houseInfo-item">
        <h5 class="houseInfo-item-title"><span class="iconfont">&#xE095;</span><span class="title-content">服务介绍</span></h5>
        <div class="houseInfo-item-tags clearfix">
            <span class="tags-service tags-money">佣金最高≤0.5%</span>
            <span class="tags-service">新房买卖</span>
            <span class="tags-service">新房代购</span>
            <span class="tags-service">投资咨询</span>
        </div>
        <div class="houseInfo-item-desc">
           ${house.serviceIntroduce}进入房地产行业已经3年，帮助数十位客户挑选满意的家，我们目前合作全北京100多个一手项目，长期合作的开发商有：远洋、、龙湖、、融创、鸿坤、融科、鲁能等地产龙头！ 我们公司理念是一个可以带您看全北京的项目，包括豪宅和别墅，为您快捷、高效、安全放心服务，节约您的时间和精力！ 如果您对本房不满意，可以点击我的头像进入我的房源库，更多全北京房源期待您的关注！        </div>
    </div>
    <!-- 租房信息 -->
</div>


</body>
<script>
    function slideshow(type){
        $.ajax({
            url:"../sellhouse/slideshow",
            type:"post",
            data:{"type":type,"sid":$("#houseId").val()},
            dataType:"json",
            async:false,
            success:function(data){
                var li = '';
                for(var i = 0;i < data.list.length;i++){
                    li += '<li><img src="'+data.list[i]+'" alt="图片已损坏" width="600" height="300"></li>';
                }
                $("#housesLideshow").html(li);
            }
        })
    }
    $(function(){
        $.ajax({
            url:"../sellhouse/slideshowCount",
            type:"post",
            data:{"houseId":$("#houseId").val()},
            dataType:"json",
            async:false,
            success:function(data){
                $("#imgTypeNumber1").text("(" + data.one + ")");
                $("#imgTypeNumber2").text("(" + data.two + ")");
                $("#imgTypeNumber3").text("(" + data.three + ")");
                var li = '';
                for(var i = 0;i < data.list.length;i++){
                    li += '<li><img src="'+data.list[i]+'" alt="图片已损坏" width="640" height="480" ></li>';
                }
                $("#housesLideshow").html(li);
            }
        })
        clickSlideshow();
    })

    function showImg(){
        document.getElementById("wxImg").style.display='block';
    }
    function hideImg(){
        document.getElementById("wxImg").style.display='none';
    }
    function clickSlideshow(){
        var i=0;
        var timer=null;
        for (var j = 0; j < $('.img li').length; j++) { //创建圆点
            $('.num').append('<li></li>')
        }
        $('.num li').first().addClass('active'); //给第一个圆点添加样式

        var firstimg=$('.img li').first().clone(); //复制第一张图片
        $('.img').append(firstimg).width($('.img li').length*($('.img img').width()));
        //第一张图片放到最后一张图片后，设置ul的宽度为图片张数*图片宽度
        $('.des').width($('.img li').length*($('.img img').width()));


        // 下一个按钮
        $('.next').click(function(){
            i++;
            if (i==$('.img li').length) {
                i=1; //这里不是i=0
                $('.img').css({left:0}); //保证无缝轮播，设置left值
            };

            $('.img').stop().animate({left:-i*600},300);
            if (i==$('.img li').length-1) { //设置小圆点指示
                $('.num li').eq(0).addClass('active').siblings().removeClass('active');
                $('.des li').eq(0).removeClass('hide').siblings().addClass('hide');
            }else{
                $('.num li').eq(i).addClass('active').siblings().removeClass('active');
                $('.des li').eq(i).removeClass('hide').siblings().addClass('hide');
            }

        })

        // 上一个按钮
        $('.prev').click(function(){
            i--;
            if (i==-1) {
                i=$('.img li').length-2;
                $('.img').css({left:-($('.img li').length-1)*600});
            }
            $('.img').stop().animate({left:-i*600},300);
            $('.num li').eq(i).addClass('active').siblings().removeClass('active');
            $('.des li').eq(i).removeClass('hide').siblings().addClass('hide');
        })

        //设置按钮的显示和隐藏
        $('.banner').hover(function(){
            $('.btn').show();
        },function(){
            $('.btn').hide();
        })

        //鼠标划入圆点
        $('.num li').mouseover(function(){
            var _index=$(this).index();
            $('.img').stop().animate({left:-_index*600},150);
            $('.num li').eq(_index).addClass('active').siblings().removeClass('active');
            $('.des li').eq(_index).removeClass('hide').siblings().addClass('hide');
        })

        //定时器自动播放
        timer=setInterval(function(){
            i++;
            if (i==$('.img li').length) {
                i=1;
                $('.img').css({left:0});
            };

            $('.img').stop().animate({left:-i*600},300);
            if (i==$('.img li').length-1) {
                $('.num li').eq(0).addClass('active').siblings().removeClass('active');
                $('.des li').eq(0).removeClass('hide').siblings().addClass('hide');
            }else{
                $('.num li').eq(i).addClass('active').siblings().removeClass('active');
                $('.des li').eq(i).removeClass('hide').siblings().addClass('hide');
            }
        },1000)

        //鼠标移入，暂停自动播放，移出，开始自动播放
        $('.banner').hover(function(){
            clearInterval(timer);
        },function(){
            timer=setInterval(function(){
                i++;
                if (i==$('.img li').length) {
                    i=1;
                    $('.img').css({left:0});
                };

                $('.img').stop().animate({left:-i*600},300);
                if (i==$('.img li').length-1) {
                    $('.num li').eq(0).addClass('active').siblings().removeClass('active');
                    $('.des li').eq(0).removeClass('hide').siblings().addClass('hide');
                }else{
                    $('.num li').eq(i).addClass('active').siblings().removeClass('active');
                    $('.des li').eq(i).removeClass('hide').siblings().addClass('hide');
                }
            },1000)
        })
    }

</script>
</head>
<body>
</html>
