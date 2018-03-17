<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/15
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工列表</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css"/>
    <script src="../js/layui/layui.js"></script>
    <%--<script src="../js/layui/layui.all.js"></script>--%>
    <script src="../js/jquery-1.8.0.js"></script>
</head>
<body>
    <!-- 表格上面的按钮 -->
    <div class="layui-btn-group">
        <button class="layui-btn" onclick="deleteEmp()">批量删除</button>
    </div>

    <!-- 数据表格加分页 -->
    <div id="pTable" >
        <table class="layui-hide" id="LAY_table_emp" lay-filter="toolInfo"></table>
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
        layui.use(['table','laypage','laydate','form'], function(){
            table = layui.table;
            laydate=layui.laydate,
                laypage = layui.laypage,
                form = layui.form
            //方法级渲染
            table.render({
                elem: '#LAY_table_emp'
                ,url: '../emp/getEmpInfo.do?page='+start+'&number=' + limitsize
                ,cols: [[
                    {checkbox: true}
                    ,{field:'id', title: 'ID', width:100}
                    ,{field:'name', title: '姓名', width:100}
                    ,{field:'weixin', title: '微信二维码', width:100,
                        templet:'<div><img src="{{d.weixin}}"></div>',
                        style:'height:30px;width:50px;line-height:50px!important;'
                    }
                    ,{field:'photo', title: '头像', width:100,
                        templet:'<div><img src="{{d.photo}}"></div>',
                        style:'height:30px;width:50px;line-height:50px!important;'
                    }
                    ,{field:'phonenumer', title: '联系方式', width:100}
                    ,{field:'loginnumber', title: '登录帐号', width:100}
                    ,{field:'password', title: '密码', width:100}
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
                    layer.confirm("确认删除吗?删除后不能恢复",{title:"删除确认"},
                        function(index){
                            $.post("../emp/deleteOneEmpInfo.do?id="+data.id, function (data) {
                                if(data.success){
                                    layer.msg("删除成功!");
                                    location.reload();
                                }else{
                                    layer.msg("删除失败!");
                                }
                            });
                        });
                } else if(layEvent === 'edit'){
                    location.href="../emp/queryEditEmpInfoById.do?id="+data.id;
                }
            });
        });
    }
    productsearch( curnum, limitcount);

    function deleteEmp(){
        var ids = new Array();
        var checkStatus = table.checkStatus('LAY_table_emp'),
            data = checkStatus.data;
        for (var i in data){
            ids.push(data[i].id);
        }
        if(ids.length <= 0){
            layer.msg("请选择需要删除的信息");
        }else{
            layer.confirm("确认删除勾选的信息？", {icon: 3, title:"确认"}, function(){
                $.ajax({
                    url:"../emp/deleteAllEmp.do",
                    type:"post",
                    data:{"ids[]":ids},
                    dataType:"json",
                    success:function(data){
                        if(data.success){
                            layer.msg("删除成功!");;
                            window.location.href = location;
                        }
                    }
                })
            }, function(){
            });
        }
    }

</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>

</html>
