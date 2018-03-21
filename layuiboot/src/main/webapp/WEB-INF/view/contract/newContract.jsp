<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房源列表</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css"/>
    <script src="../js/layui/layui.js"></script>
    <%--<script src="../js/layui/layui.all.js"></script>--%>
    <script src="../js/jquery-1.8.0.js"></script>



</head>
<body>
    <%--房屋表格--%>
    <div id="houseDiv" style="display:none;">
        <table class="layui-table" id="LAY_table_house" lay-filter="test"></table>
        <div id="laypage"></div>
    </div>

    <%--新建合同--%>
    <form class="layui-form" id="contractForm">
        <div class="layui-form-item">
            <label class="layui-form-label">合同编号</label>
            <div class="layui-input-inline">
                <input type="text"  readonly="true" class="layui-input" id="numberserial" name="numberserial" value="${num}" readonly="true">
            </div>
            <label class="layui-form-label">房屋编号</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="hidden" name="sid" id="sid">
                <input type="text" class="layui-input" id="roomNum" name="roomNum" readonly="true">
            </div>
            <label class="layui-form-label"></label>
            <a href="#" class="layui-btn" onclick="querySellHouse()">查看房屋</a>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">出租方</label>
            <div class="layui-input-inline" >
                <input type="text" class="layui-input" id="lessor" name="lessor"  >
            </div>
            <label class="layui-form-label">承租方</label>
            <div class="layui-input-inline" >
                <input type="text" class="layui-input" id="tenantry" name="tenantry"  >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">开始日期</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" name="starttime" id="starttime"  >
            </div>

            <label class="layui-form-label">结束日期</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" name="endtime" id="endtime"  >
            </div>
        </div>
        <div class="layui-form-item">

            <label class="layui-form-label">分期方式</label>
            <div class="layui-input-inline" >
                <select name="installment" id="installment" lay-filter="installment">
                    <option value="">请选择</option>
                    <option value="1">一个季度</option>
                    <option value="2">半年一付</option>
                    <option value="3">三个季度一付</option>
                    <option value="4">一次性付款一年</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">付款方式</label>
            <div class="layui-input-block">
                <input type="radio" name="payment" value="1" title="支付宝" >
                <input type="radio" name="payment" value="2" title="微信">
                <input type="radio" name="payment" value="3" title="转账">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">租金</label>
            <div class="layui-input-inline" style="width: 100px" readonly="true">
                <input type="text" class="layui-input" id="rent"  placeholder="￥" readonly="true" >
            </div>
            <div class="layui-form-mid">元</div>
            <label class="layui-form-label">付款金额</label>
            <div class="layui-input-inline" style="width: 100px" readonly="true">
                <input type="text" class="layui-input" id="thefigure" name="thefigure" placeholder="￥"readonly="true">
            </div>
            <div class="layui-form-mid">元</div>
            <label class="layui-form-label"></label>
            <div class="layui-input-inline" style="width: 50px">
                <input type="text" class="layui-input" id="timelimit" name="timelimit">
            </div>
            <div class="layui-form-mid">日内完成付款</div>
            <label class="layui-form-label">违约金</label>
            <div class="layui-input-inline" style="width: 100px">
                <input type="text" class="layui-input" id="dedit" name="dedit"  placeholder="￥" readonly="true">
            </div>
            <div class="layui-form-mid">元</div>

        </div>
        <div align="center">

        <a href="#" class="layui-btn" onclick="addContract()">新建合同</a>
        </div>


<script>
   layui.use('form', function() {
        var form = layui.form;
        form.on('select(installment)', function (data) {
            var rent = $("#rent").val()
           if(data.value==1){
               var installment = rent*4
               $("#thefigure").val(installment)
           }else if(data.value==2){
               var installment = rent*7
               $("#thefigure").val(installment)
           }else if(data.value==3){
               var installment = rent*10
               $("#thefigure").val(installment)
           }else if(data.value==4){
               var installment = rent*13
               $("#thefigure").val(installment)
           }


        });
    })
    function querySellHouse(){
        layui.use(['table','layer'], function(){
            var $ = layui.jquery,
                layer = layui.layer;
                table = layui.table;
            layer.open({
                type: 1
                ,content:$("#houseDiv")
                ,title:'我的发布'
                ,area: ['1000px', '500px']
                ,btnAlign: 'c' //按钮居中
                ,shade: 0 //不显示遮罩
                ,btn:['确 定','取 消'],
                yes:function(index){
                    var checkStatus = table.checkStatus('LAY_table_house'),
                        data = checkStatus.data;
                        if(data.length==1){
                            $("#sid").val(data[0].id)
                            $("#roomNum").val(data[0].roomNum)
                            $("#rent").val(data[0].rent)
                            $("#dedit").val(data[0].rent)
                            layer.close(index);
                        }else{
                            layer.alert("只能选中一条数据")
                        }
                }
            });
        })
    }
    function addContract(){
        $.ajax({
            url: "../contract/addContract",
            type: "post",
            data: $("#contractForm").serialize(),
            dataType: "json",
            async: false,
            success: function (data) {
                layer.alert("新建成功！");

            }
        })
    }
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
                elem: '#LAY_table_house'
                , url: '../sellhouse/queryUnrentableHouse?page=' + start + '&number=' + limitsize
                , cols: [[
                    {checkbox: true}
                    , {field: 'title', title: '标题', width: 100}
                    , {field: 'price', title: '售价', width: 100}
                    , {field: 'roomNum', title: '房屋编号', width: 100}
                    , {field: 'rent', title: '租金', width: 100}
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

    layui.use(['form', 'layedit', 'laydate','layedit',"upload"], function(){
        var $ = layui.jquery
       form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,upload = layui.upload;
        //初始化日期
        var nowTime = new Date().valueOf();
        var max = null;
        var start = laydate.render({
            elem: '#starttime',
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
            elem: '#endtime',
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
    });
    productsearch( curnum, limitcount);
</script>

</body>
</html>
