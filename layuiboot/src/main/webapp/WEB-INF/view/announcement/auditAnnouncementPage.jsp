<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/3/20
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>审核列表</title>
</head>
<link rel="stylesheet" href="../js/layui/css/layui.css"/>
<script src="../js/layui/layui.js"></script>
<script src="../js/jquery-1.8.0.js"></script>
<body>
<!-- 数据表格加分页 -->
<div id="auditDiv" >
    <table class="layui-hide" id="auditTable" lay-filter="toolInfo"></table>
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
                elem: '#auditTable'
                ,url: '../announcement/queryNoAuditInfo.do?page='+start+'&number=' + limitsize
                ,cols: [[
                    {title: '序号',templet: '#indexTpl'}
                    ,{field:'title', title: '标题', width:200}
                    ,{field:'content', title: '内容', width:200}
                    ,{field:'ename', title: '发布人', width:100}
                    ,{field:'time', title: '发布时间', width:200}
                    , {field: 'poperation', title: '操作', toolbar: '#barDemo'}
                ]]
                , page: false
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
            //监听工具条
            table.on('tool(toolInfo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                $ = layui.jquery;
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
                if(layEvent === 'detail'){
                    viewLableInfo(data.attrId);
                    layer.msg(data.attrId);
                } else if(layEvent === 'del'){
                    layer.confirm("确认审核通过吗?",{title:"确认"},
                        function(index){
                            $.post("../announcement/auditAnnouncement?id="+data.id+"&status=" + 2, function (data) {
                                if(data.success){
                                    layer.msg("审核成功!");
                                    location.reload();
                                }else{
                                    layer.msg("审核失败!");
                                }
                            });
                        });
                } else if(layEvent === 'edit'){
                    layer.confirm("确认审核不通过吗?",{title:"确认"},
                        function(index){
                            $.post("../announcement/auditAnnouncement?id="+data.id+"&status=" + 3, function (data) {
                                if(data.success){
                                    layer.msg("审核成功!");
                                    location.reload();
                                }else{
                                    layer.msg("审核失败!");
                                }
                            });
                        });
                }
            });
        });
    }
    productsearch( curnum, limitcount);
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">√</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">×</a>
</script>
<!---表格序号-->
<script type="text/html" id="indexTpl">
    {{d.LAY_TABLE_INDEX+1}}
</script>
</html>
