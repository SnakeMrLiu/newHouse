<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/3/15
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>客户列表</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css"/>
    <script src="../js/layui/layui.js"></script>
    <script src="../js/jquery-1.8.0.js"></script>
</head>
<body>
<%--条件查询--%>
<form class="layui-form" id="searchForm">
 <div class="layui-form-item">

        <label class="layui-form-label">客户姓名:</label>
        <div class="layui-input-inline" style="width: 100px;">
            <input type="text" name="customerName" id="customerName" autocomplete="off" class="layui-input">
        </div>
     <label class="layui-form-label">预约房源</label>
     <div class="layui-input-inline" style="width: 100px;">
         <input type="text" name="orderHouse" id="orderHouse" autocomplete="off" class="layui-input">
     </div>

     <label class="layui-form-label">预约时间</label>
     <div class="layui-input-inline">
         <input type="text" class="layui-input" name="minTime" id="minTime"  >

     </div>
     <div class="layui-form-mid">-</div>
     <div class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->
         <input type="text" name="maxTime" id="maxTime"  class="layui-input">
     </div>
 </div>
    <div class="layui-form-item">
    </div>
<div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-inline" >
            <a href="#" class="layui-btn" onclick="searchCustomer()">搜索</a>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>

    </div>
</form>
    <table class="layui-table" id="LAY_table_house" lay-filter="test"></table>
    <div id="laypage"></div>
</body>
<script>

    function searchCustomer() {
        var customerName = $("#customerName").val();
        var orderHouse = $("#orderHouse").val();
        var minTime=$("#minTime").val();
        var maxTime=$("#maxTime").val();

        table.reload('idTest', {
            where: {
                customerName: customerName,
                orderHouse: orderHouse,
                maxTime:maxTime,
                minTime:minTime,
            }

        })
    }
    //Demo
    layui.use('form', function() {
        var form = layui.form;

        var limitcount = 10;
        var curnum = 1;
        //var table;

        //列表查询方法
        function productsearch(start, limitsize) {
            layui.use(['table', 'laypage', 'laydate'], function () {
                table = layui.table;
                laydate = layui.laydate,
                    laypage = layui.laypage;
                table.render({
                    id: 'idTest',
                    elem: '#LAY_table_house'
                    , url: '../customer/queryCustomer.do?page=' + start + '&number=' + limitsize
                    , cols: [[
                        {checkbox: true}
                        , {field: 'customerName', title: '客户姓名', width: 120}
                        , {field: 'customerPhone', title: '手机号码', width: 120}
                        , {field: 'customerAge', title: '客户年龄', width: 120}
                        , {field: 'orderTime', title: '预约时间', width: 120}
                        , {field: 'orderNum', title: '预约次数', width: 120}
                        , {field: 'name', title: '预约房屋', width: 120}
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
                    } else if (layEvent == 'query') {
                        location.href = "../sellhouse/toQueryHousePage.do?id=" + data.id;
                    } else if (layEvent == "edit") {
                        location.href = "../sellhouse/toEditPage?id=" + data.id;
                    }
                });
            })
        }
        productsearch(curnum, limitcount);
    })

    layui.use('laydate', function(){
        var laydate = layui.laydate;
        var nowTime = new Date().valueOf();
        var max = null;
        var start = laydate.render({
            elem: '#minTime',
            type: 'date',
            max: nowTime,
            btns: ['clear', 'confirm'],
            done: function(value, date){
                endMax = end.config.max;
                end.config.min = date;
                end.config.min.month = date.month -1;
            }
        });
        var end = laydate.render({
            elem: '#maxTime',
            type: 'date',
            max: nowTime,
            done: function(value, date){
                if($.trim(value) == ''){
                    var curDate = new Date();
                    date = {'date': curDate.getDate(), 'month': curDate.getMonth()+1, 'year': curDate.getFullYear()};
                }
                start.config.max = date;
                start.config.max.month = date.month -1;
            }
        });
     /*   //执行一个laydate实例
        laydate.render({
            elem: '#minTime' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#maxTime' //指定元素
        });*/
    });
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
 <a class="layui-btn layui-btn-xs" lay-event="query">查看</a>
</script>
</html>
