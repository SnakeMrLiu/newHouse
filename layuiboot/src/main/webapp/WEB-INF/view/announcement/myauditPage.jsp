<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/3/20
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="../js/layui/css/layui.css"/>
<script src="../js/layui/layui.js"></script>
<script src="../js/jquery-1.8.0.js"></script>
<body>
<!-- 数据表格加分页 -->
<div id="auditDiv" >
    <table class="layui-hide" id="myAuditTable" lay-filter="toolInfo"></table>
    <div id="laypage"></div>
</div>
</body>
<script>
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
                    elem: '#myAuditTable'
                    ,url: '../announcement/queryMyAuditInfo?page='+start+'&number=' + limitsize
                    ,cols: [[
                        {title: '序号',templet: '#indexTpl'}
                        ,{field:'title', title: '标题', width:100}
                        ,{field:'content', title: '内容', width:100}
                        ,{field:'time', title: '发布时间', width:100}
                        ,{field:'status', title: '发布状态', width:100}
                       // ,{field:'reason', title: '理由', width:100}
                    ]]
                    , page: false
                    ,done: function(res, curr, count){
                        //分类显示中文名称
                        $("[data-field='status']").children().each(function () {
                            if ($(this).text() == 1) {
                                $(this).text("待审核")
                            } else if ($(this).text() == 2) {
                                $(this).text("成功")
                            } else if ($(this).text() == 3) {
                                $(this).text("失败")
                            }
                        })
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
        });
    }
    productsearch( curnum, limitcount);
</script>
<!---表格序号-->
<script type="text/html" id="indexTpl">
    {{d.LAY_TABLE_INDEX+1}}
</script>
</html>
