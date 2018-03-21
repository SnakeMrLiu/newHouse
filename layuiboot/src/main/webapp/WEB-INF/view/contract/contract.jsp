<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/3/15
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>合同列表</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css"/>
    <script src="../js/layui/layui.js"></script>
    <script src="../js/jquery-1.8.0.js"></script>
</head>
<body>
 <table class="layui-table" id="LAY_table_house" lay-filter="test"></table>
 <div id="laypage"></div>
 <div class="site-demo-button" id="layerHtml" style="margin-bottom: 0;"></div>
</body>
<script>


  var limitcount = 10;
  var curnum = 1;
  var table;
  function openSendEmailDialog(){
      layui.use('layer', function() {
          var $ = layui.jquery, layer = layui.layer;
          layer.open({
              type: 1,
              closeBtn: true,
              area: ['600px', '600px'],
              shade: 0.8,
              content:createFrame("../contract/toContractInfo") ,
              btn:"发送",
              btnAlign: 'c'
          })
      })
  }




  //列表查询方法
    function productsearch(start,limitsize) {
        layui.use(['table', 'laypage', 'laydate'], function () {
            table = layui.table;
            laydate = layui.laydate,
            laypage = layui.laypage;
            table.render({
                id: 'idTest',
                elem: '#LAY_table_house'
                , url: '../contract/queryPactInfo?page=' + start + '&number=' + limitsize
                , cols: [[
                    {checkbox: true}
                    , {field: 'id', title: 'ID', width: 80}
                    , {field: 'name', title: '员工姓名', width: 120}
                    , {field: 'numberserial', title: '备注', width: 120}
                    , {field: 'lessor', title: '备注', width: 120}
                    , {field: 'tenantry', title: '备注', width: 120}
                    , {field: 'numberserial', title: '备注', width: 150}
                    , {field: 'tenantry', title: '备注', width: 120}
                    , {field: 'createtime', title: '备注', width: 150}
                    , {field: 'thefigure', title: '备注', width: 120}
                    , {field: '', title: '操作', toolbar: '#barDemo'}
                ]]
                , page: false
                , height: 450
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
                    location.href="../contract/toContractInfo?id="+data.id;
                }
            });
        })
    }
  productsearch( curnum, limitcount);
  function createFrame(url){
      return '<iframe frameborder="0"  src="'+ url + '" style="width:100%;height:100%;"  ></iframe>';
  }
</script>
<script type="text/html" id="barDemo">

    <a class="layui-btn layui-btn-xs" lay-event="edit">详情</a>
</script>
</html>
