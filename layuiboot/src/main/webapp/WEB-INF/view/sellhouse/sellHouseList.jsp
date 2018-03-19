<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/3/15
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>房源列表</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css"/>
    <script src="../js/layui/layui.js"></script>
    <script src="../js/jquery-1.8.0.js"></script>
</head>
<body>
<%--条件查询--%>
<form class="layui-form" id="searchForm">
    <div class="layui-form-item">
        <label class="layui-form-label">区域:</label>
        <div class="layui-input-inline" style="width: 100px;">
            <select name="province" id="province" lay-filter="province">
                <option value="">请选择省</option>
            </select>
        </div>
        <div class="layui-input-inline" style="width: 100px;">
            <select name="city" id="city" lay-filter="city">
                <option value="">请选择市</option>
            </select>
        </div>
        <div class="layui-input-inline" style="width: 100px;">
            <select name="county" id="county">
                <option value="">请选择县/区</option>
            </select>
        </div>
        <label class="layui-form-label">售价:</label>
        <div class="layui-input-inline" style="width: 100px;">
            <input type="text" name="minprice" id="minprice" placeholder="￥" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid">-</div>
        <div class="layui-input-inline" style="width: 100px;">
            <input type="text" name="maxprice" id="maxprice" placeholder="￥" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid">万</div>
    </div>

    <div class="layui-form-item" pane="">
        <label class="layui-form-label">房型:</label>
        <div class="layui-input-block">
            <input type="radio" name="room" value="-1" title="全部" >
            <input type="radio" name="room" value="1" title="一室" >
            <input type="radio" name="room" value="2" title="二室">
            <input type="radio" name="room" value="3" title="三室">
            <input type="radio" name="room" value="4" title="四室">
            <input type="radio" name="room" value="5" title="五室">
            <input type="radio" name="room" value="6" title="五室以上">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">更多</label>
        <div class="layui-input-inline" style="width: 100px;">
            <select name="buildingTime" id="buildingTime">
                <option value="-1" selected="">建造年代</option>
                <option value="1" >70年代</option>
                <option value="2">80年代</option>
                <option value="3">90年代</option>
            </select>
        </div>
        <div class="layui-input-inline" style="width: 100px;">
            <select name="roomType" id="roomType">
                <option value="-1" selected="">房屋类型</option>
            </select>
        </div>
        <div class="layui-input-inline"style="width: 100px;">
            <select name="decorate" id="decorate">
                <option value="-1" selected="">装修</option>
            </select>
        </div>
        <label class="layui-form-label">面积:</label>
        <div class="layui-input-inline" style="width: 100px;">
            <input type="text" name="minarea" id="minarea" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid">-</div>
        <div class="layui-input-inline" style="width: 100px;">
            <input type="text" name="maxarea" id="maxarea" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid">m²</div>

    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-inline" >
            <a href="#" class="layui-btn" onclick="searchSellHouse()">搜索</a>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>

    </div>
</form>
    <table class="layui-table" id="LAY_table_house" lay-filter="test"></table>
    <div id="laypage"></div>
</body>
<script>

    function searchSellHouse() {
        var province = $("#province").val();
        var city = $("#city").val();
        var county = $("#county").val();
        var minprice = $("#minprice").val();
        var maxprice = $("#maxprice").val();
        var minarea = $("#minarea").val();
        var maxarea = $("#maxarea").val();
        var buildingTime = $("#buildingTime").val();
        var roomType = $("#roomType").val();
        var decorate = $("#decorate").val();
        var room = $("[name='room']:checked").val()
        table.reload('idTest', {
            where: {
                province: province,
                city: city,
                county: county,
                minprice: minprice,
                maxprice: maxprice,
                buildingTime: buildingTime,
                roomType: roomType,
                decorate: decorate,
                room: room,
                minarea: minarea,
                maxarea: maxarea,
            }
            ,page: {
                curr: 1 //重新从第 1 页开始
            }
        })
    }
    //Demo
    layui.use('form', function(){
        var form = layui.form;
        form.on('select(province)', function (data) {
            //加载市

            $.ajax({
                url:"../sellhouse/queryArea",
                type:"post",
                data:{"pid":data.value},
                dataType:"json",
                async:false,
                success:function(cityData){
                    $("#city").html("");
                    var  city= '<option value="-1">请选择市</option>';
                    $.each(cityData,function(){
                        city += '<option value="'+this.id+'">'+this.name+'</option>'
                    })
                    $("#city").append(city);
                    form.render('select');
                }
            })
        });
        form.on('select(city)', function (data) {
            //加载县
            $.ajax({
                url:"../sellhouse/queryArea",
                type:"post",
                data:{"pid":data.value},
                dataType:"json",
                async:false,
                success:function(countyData){
                    $("#county").html("");
                    var  county= '<option value="-1">请选择县/区</option>';
                    $.each(countyData,function(){
                        county += '<option value="'+this.id+'">'+this.name+'</option>'
                    })
                    $("#county").append(county);
                    form.render('select');
                }
            })

        });
    });
    //加载省
    $.ajax({
        url:"../sellhouse/queryArea",
        type:"post",
        data:{"pid":0},
        dataType:"json",
        async:false,
        success:function(data){
            $("#province").html("");
            var  province= '<option value="-1">请选择省</option>';
            $.each(data,function(){
                province += '<option value="'+this.id+'">'+this.name+'</option>'
            })
            $("#province").append(province);
        }
    })
    //房屋类型
    $.ajax({
        url: "../sellhouse/queryHouseType",
        type: "post",
        dataType: "json",
        async: false,
        success: function (data) {
            $("#roomType").html("");
            var  roomType =  '<option value="-1">别墅类型</option>' ;
            $.each(data,function(){
                roomType += '<option value="'+this.id+'">'+this.name+'</option>'
            })
            $("#roomType").append(roomType);
        }
    })
    //装修程度
    $.ajax({
        url: "../sellhouse/queryDecorate",
        type: "post",
        dataType: "json",
        async: false,
        success: function (data) {
            $("#decorate").html("");
            var  decorate =  '<option value="-1">装修</option>' ;
            $.each(data,function(){
                decorate += '<option value="'+this.id+'">'+this.name+'</option>'
            })
            $("#decorate").append(decorate);
        }
    })

  var limitcount = 10;
  var curnum = 1;
  var table;
    //列表查询方法
    function productsearch(start,limitsize) {
        layui.use(['table', 'laypage', 'laydate'], function () {
            table = layui.table;
            laydate = layui.laydate,
            laypage = layui.laypage;
            table.render({
                id: 'idTest',
                elem: '#LAY_table_house'
                , url: '../sellhouse/queryHouse.do?page=' + start + '&number=' + limitsize
                , cols: [[
                    {checkbox: true}
                    , {field: 'title', title: '标题', width: 100}
                    , {field: 'price', title: '售价', width: 100}
                    , {field: 'room', title: '室', width: 60}
                    , {field: 'hall', title: '厅', width: 60}
                    , {field: 'area', title: '面积', width: 60}
                    , {field: 'garden', title: '所属小区', width: 120}
                    , {field: 'houseType', title: '房屋类型', width: 80}
                    , {field: 'floor', title: '所在楼层', width: 80}
                    , {field: 'fitment', title: '装修程度', width: 80}
                    , {field: 'releaseTime', title: '发布日期', width: 120}
                    , {field: '', title: '操作', toolbar: '#barDemo'}
                ]]
                , page: false
                , height: 230
                , done: function (res, curr, count) {
                    //如果是异步请求数据方式，res即为你接口返回的信息。
                    //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                    laypage.render({
                        elem: 'laypage'
                        , count: count
                        , curr: curnum
                        , limit: limitcount
                        , layout: ['prev', 'page', 'next', 'skip', 'count', 'limit']
                        , jump: function (obj, first) {
                            if (!first) {
                                curnum = obj.curr;
                                limitcount = obj.limit;
                                productsearch(curnum, limitcount);
                            }
                        }
                    })
                }
            })
            table.on('tool(test)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                $ = layui.jquery
                var data = obj.data //获得当前行数据
                    , layEvent = obj.event; //获得 lay-event 对应的值
                if (layEvent === 'detail') {
                    viewLableInfo(data.attrId);
                    layer.msg(data.attrId);
                } else if (layEvent === 'del') {
                    layer.confirm("确认要删除吗，删除后不能恢复", {title: "删除确认"}, function (index) {
                        layer.close(index);
                        $.post("../sellhouse/deleteHouseOne.do?id=" + data.id, function (data) {
                            layer.msg("删除成功!");
                            location.reload();
                        });
                    });
                    /* window.location.href="../book/deleteBook.do?id="+data.id;*/
                } else if(layEvent == 'query'){
                    location.href="../sellhouse/toQueryHousePage.do?id="+data.id;
                }else if(layEvent == "edit"){
                    location.href="../sellhouse/toEditPage?id="+data.id;
                }
            });
        })
    }
  productsearch( curnum, limitcount);
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs" lay-event="query">查看</a>
</script>
</html>
