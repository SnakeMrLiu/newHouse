<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>layui布局</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css"/>
    <script src="../js/layui/layui.js"></script>
    <script src="../js/jquery-1.8.0.js"></script>
</head>
<body bgcolor="#e9e9e9">

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">刘大少的私人房地产</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${emp.photo}" class="layui-nav-img">
                    ${emp.name}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:openLogDialog()">我的日志</a></dd>
                    <dd><a href="javascript:openDialog()">我的发布</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="../login/logoutEmp">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="navBar layui-side-scroll"></div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 10px;">
            <div class="layui-tab" lay-filter="myTab" lay-allowclose="true">
                <ul class="layui-tab-title">
                    <li class="layui-this" lay-id="11">首页</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div class="layui-row"  style=" ;width:100%">
                            <div class="layui-col-lg6"  style="border:4px solid #ffffff; height:50%;width:50% " >
                                你的内容 9/12
                            </div>
                            <div class="layui-col-lg6" style="border-right:4px solid#ffffff;border-top:4px solid#ffffff;border-bottom:4px solid#ffffff; height:50%;width:50%">
                                你的内容 3/12
                            </div>
                        </div>
                        <div class="layui-row" style=" width:100%">
                            <div class="layui-col-lg6" style="border-right:4px solid#ffffff;border-left:4px solid#ffffff;border-bottom:4px solid#ffffff; height:50%;width:50%">
                                你的内容 9/12
                            </div>
                            <div class="layui-col-lg6" style="border-right:4px solid#ffffff;border-bottom:4px solid#ffffff; height:50%;width:50%">
                                <!-- 数据表格加分页 -->
                                <div id="auditDiv" >
                                    <table class="layui-hide" id="auditTable" lay-filter="toolInfo"></table>
                                    <div id="laypage"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;"></div>

<%--详情表单--%>
<div style="display: none" id="divInfo">
    <form class="layui-form" id="searchForm" style="padding-top: 20px">
        <div class="layui-form-item">
            <label class="layui-form-label">标题:</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="title" name="title" readonly="true">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">发布人:</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="ename" name="ename" readonly="true">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">发布时间:</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="time" name="time" readonly="true">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容:</label>
            <div class="layui-input-inline">
                <textarea class="layui-textarea" runat="server" id="content"    name="content" style="border: 0; width: 99%;height: 90px"></textarea>
            </div>
        </div>
    </form>
</div>
<div id="emailDIV" style="display: none">
        <form class="layui-form" id="sendMailForm"  style="padding-top:20px;">
            <input type="hidden" name="eid" id="sendEmailId">
            <div class="layui-form-item">
                <label class="layui-form-label">主题</label>
                <div class="layui-input-block">
                    <input type="text" style="width: 360px" name="email_title" id="theme"  size="10" lay-verify="title" autocomplete="off" placeholder="请输入主题" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">内容</label>
                <div class="layui-input-block" style="width:70%;margin-left:12%;margin-top:1px;background-color:#fff;">
            <textarea class="layui-textarea" placeholder="请输入内容" name="email_conten" id="emailContent" >
            </textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">附件</label>
                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="emailFile">附件上传</button>
                    <div style="padding-left: 100px" class="layui-upload-list"  id="emailaaaa"></div>
                </div>
            </div>
        </form>
</div>
</body>
<script>

    layui.use(['layedit','layer'], function() {
        layedit = layui.layedit;
        layer = layui.layer
        layedit.set({
            uploadImage: {
                url: '../sellhouse/uploadFile' //接口url
                ,type: 'post' //默认post
            }
        });
        indexs1 = layedit.build('content', {
            height: 160,
            contenteditable:false
        });
    })    //建立编辑器
    layui.use('layer', function(){
        var $ = layui.jquery, layer = layui.layer;
/*        layer.open({
            type: 1
            ,title: false //不显示标题栏
            ,closeBtn: false
            ,area: '300px;'
            ,shade: 0.8
            ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
            ,btn: ['我知道了']
            ,btnAlign: 'c'
            ,moveType: 1 //拖拽模式，0或者1
            ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">亲！欢迎光临流云地产<br><br>流云地产作为一个全球最大的军火商，由于其用户基数较大，所以常常会有人来购买导弹<br><br>流萤科技虽然是买军火的，但软件开发也是我们新的方向<br><br>我们此后的征途是星辰大海 ^_^</div>'
            ,success: function(layero){

            }
        });*/
    });
    //打开新的选项卡
    var $;
    layui.use(['element'], function(){
        $ = layui.jquery
        var element = layui.element
        var myTab  = function(){
            this.tabConfig = {
                closed : true,
                openTabNum : 10,
                tabFilter : "myTab"
            }
        };

        //查询树
    var navs = "";
    $.ajax({
        url:"../tree/getTree",
        type:"post",
        dataType:"json",
        success:function(data){
            //显示左侧菜单
            if($(".navBar").html() == ''){
                var _this = this;
                $(".navBar").html(navBar(data)).height($(window).height()-230);
                element.init();  //初始化页面元素
                $(window).resize(function(){
                    $(".navBar").height($(window).height()-230);
                })
            }
            // 添加新窗口
            $(".layui-nav .layui-nav-item a").on("click",function(){

                //判断当前节点是否是子节点
                if($(this).children("span").length == 0){
                    //判断选项卡是否被打开过
                    if(!hasTab($(this).find("cite").text())){
                        element.tabAdd('myTab', {
                            title: '<cite>'+$(this).find("cite").text()+'</cite>'//用于演示
                            ,content:createFrame($(this).attr("data-url"))
                            ,id: $(this).attr("data-id")
                        })
                        element.tabChange('myTab', $(this).attr("data-id"));
                    }else{
                        element.tabChange('myTab', $(this).attr("data-id"));
                    }
                }
            })
        }
    })
    });
    function createFrame(url){
        return '<iframe frameborder="0"  src="'+ url + '" style="width:100%;height:100%;"  ></iframe>';
    }

    function hasTab(title){
        var tabIndex = false;
        $(".layui-tab-title li").each(function(){
            if($(this).find("cite").text() == title){
                tabIndex = true;
            }
        })
        return tabIndex;
    }
    //tab选项卡的封装方法
    function navBar(data){
        var ulHtml = '<ul class="layui-nav layui-nav-tree" lay-filter="myTree">';
        for(var i=0;i<data.length;i++){
            if(data[i].spread){
                ulHtml += '<li class="layui-nav-item layui-nav-itemed">';
            }else{
                ulHtml += '<li class="layui-nav-item">';
            }
            if(data[i].children != undefined && data[i].children.length > 0){
                ulHtml += '<a href="javascript:;" data-id="'+data[i].id+'">';
                if(data[i].icon != undefined && data[i].icon != ''){
                    if(data[i].icon.indexOf("icon-") != -1){
                        ulHtml += '<i class="iconfont '+data[i].icon+'" data-icon="'+data[i].icon+'"></i>';
                    }else{
                        ulHtml += '<i class="layui-icon" data-icon="'+data[i].icon+'">'+data[i].icon+'</i>';
                    }
                }
                ulHtml += '<cite>'+data[i].title+'</cite>';;
                ulHtml += '<span class="layui-nav-more"></span>';
                ulHtml += '</a>'
                ulHtml += '<dl class="layui-nav-child">';
                for(var j=0;j<data[i].children.length;j++){
                    ulHtml += '<dd><a href="javascript:;" data-id="'+data[i].children[j].id+'" data-url="'+data[i].children[j].href+'">';
                    if(data[i].children[j].icon != undefined && data[i].children[j].icon != ''){
                        if(data[i].children[j].icon.indexOf("icon-") != -1){
                            ulHtml += '<i class="iconfont '+data[i].children[j].icon+'" data-icon="'+data[i].children[j].icon+'"></i>';
                        }else{
                            ulHtml += '<i class="layui-icon" data-icon="'+data[i].children[j].icon+'">'+data[i].children[j].icon+'</i>';
                        }
                    }
                    ulHtml += '<cite>'+data[i].children[j].title+'</cite></a></dd>';
                }
                ulHtml += "</dl>"
            }else{
                ulHtml += '<a href="javascript:;" data-id="'+data[i].id+'" data-url="'+data[i].href+'">';
                if(data[i].icon != undefined && data[i].icon != ''){
                    if(data[i].icon.indexOf("icon-") != -1){
                        ulHtml += '<i class="iconfont '+data[i].icon+'" data-icon="'+data[i].icon+'"></i>';
                    }else{
                        ulHtml += '<i class="layui-icon" data-icon="'+data[i].icon+'">'+data[i].icon+'</i>';
                    }
                }
                ulHtml += '<cite>'+data[i].title+'</cite></a>';
            }
            ulHtml += '</li>'
        }
        ulHtml += '</ul>';
        return ulHtml;
    }

    //定义分页数据
    var limitcount = 10;
    var curnum = 1;
    var table;
    //列表查询方法
    function productsearch(start,limitsize) {
        layui.use(['table','laypage'], function(){
            table = layui.table;
            laypage = layui.laypage,
                //方法级渲染
                table.render({
                    elem: '#auditTable'
                    ,url: '../announcement/queryAnnouncement.do?page='+start+'&number=' + limitsize
                    ,cols: [[
                        {checkbox: true}
                        ,{field:'title', title: '标题', width:100}
                        ,{field:'content', title: '内容', width:100}
                        ,{field:'ename', title: '发布人', width:100}
                        ,{field:'time', title: '发布时间', width:100}
                        , {field: 'poperation', title: '操作', toolbar: '#barDemo'}
                    ]]
                    , page: false
                    , height: 200
                    ,done: function(res, curr, count){
                        //如果是异步请求数据方式，res即为你接口返回的信息。
                        //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                        laypage.render({
                            elem:'laypage'
                            ,count:count
                            ,curr:curnum
                            ,limit:limitcount
                            ,layout: ['prev', 'page', 'next', 'skip','count','limit']
                            ,jump:function (obj,first) {
                                if(!first){
                                    curnum = obj.curr;
                                    limitcount = obj.limit;
                                    productsearch(curnum,limitcount);
                                }
                            }
                        })
                    }

                })
            table.on('tool(toolInfo)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                $ = layui.jquery
                var data = obj.data //获得当前行数据
                    , layEvent = obj.event; //获得 lay-event 对应的值
                if (layEvent === 'edit') {
                    layui.use('layer', function(){
                        var $ = layui.jquery, layer = layui.layer;
                        $("#title").val(data.title)
                        $("#ename").val(data.ename)
                        $("#time").val(data.time)
                        $("#content").val(data.content)
                        layer.open({
                            type: 1
                            ,content:$("#divInfo")
                            ,title:'发布详情'
                            ,area: ['800px', '600px']
                            ,btnAlign: 'c' //按钮居中
                            ,shade: 0 //不显示遮罩
                        });
                    })

                }else if(layEvent === 'sendMail'){
                    $("#sendEmailId").val(data.eid);
                    openSendEmailDialog();
                }
            });
            function createFrame(url){
                return '<iframe scrolling="auto" frameborder="0"  src="'+ url + '" style="width:100%;height:100%;"></iframe>';
            }

        });
    }
    productsearch( curnum, limitcount);
    function openDialog(){
            layui.use('layer', function(){
                var $ = layui.jquery, layer = layui.layer;
                layer.open({
                    type: 1
                    ,content: createFrame("../announcement/toMyauditPage")
                    ,title:'我的发布'
                    ,area: ['920px', '500px']
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                });
            })
    }

    function openLogDialog(){
        layui.use('layer', function(){
            var $ = layui.jquery, layer = layui.layer;
            layer.open({
                type: 1
                ,content: createFrame("../log/myLogInfoPage")
                ,title:'我的日志'
                ,title:'我的日志'
                ,area: ['920px', '500px']
                ,btnAlign: 'c' //按钮居中
                ,shade: 0 //不显示遮罩
            });
        })
    }
    function openSendEmailDialog(){
        layui.use('layer', function() {
            var $ = layui.jquery, layer = layui.layer;
            layer.open({
                type: 1,
                closeBtn: true,
                area: ['600px', '600px'],
                shade: 0.8,
                content: $("#emailDIV"),
                btn:"发送",
                btnAlign: 'c',
                yes:function(index){
                    layedit.sync(indexsemail);
                    $.ajax({
                        url:"../empSendEmailInfo/emailSend",
                        type:"post",
                        data:$("#sendMailForm").serialize(),
                        dateType:"json",
                        success:function (data) {
                            if(data.success){
                                layer.close(index);
                                layer.msg("发送成功");
                            }else{
                                layer.close(index);
                                layer.msg("网络延迟发送失败！");
                            }
                        }
                    })
                }
            })
        })
    }
    //富文本编辑器 核心卖点
    layui.use('layedit', function(){
        layedit = layui.layedit;
        layedit.set({
            uploadImage: {
                //url: '<%=request.getContextPath()%>/house/uploadFileByEditor', //接口url
                type: 'post', //默认post

            }
        });
        indexsemail = layedit.build('emailContent',{
            height:240,

        }); //建立编辑器
    });

    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;

        upload.render({
            elem: '#emailFile'
            , url: '../empSendEmailInfo/emailImgUpload'
            , multiple: true
            , number: 5
            , size: 1024
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#emailaaaa').append('<img src="' + result + '" alt="' + file.name + '" class="layui-upload-img" height="100" width="100">');
                });
            }
            , done: function (res) {

            }
            , allDone: function (obj) {
                console.log(obj)
            }
        });
    })

</script>
<script type="text/html" id="barDemo">

    <a class="layui-btn  layui-btn-xs" lay-event="edit">详情</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="sendMail">发送邮件</a>
</script>
</html>
