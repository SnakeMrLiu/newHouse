<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/3/20
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css"/>
    <script src="../js/layui/layui.js"></script>
    <%--<script src="../js/layui/layui.all.js"></script>--%>
    <script src="../js/jquery-1.8.0.js"></script>
</head>
<body>
    <form class="layui-form" id="addAnnouncmentForm">
        <div class="layui-form-item">
            <label class="layui-form-label">标题:</label>
            <div class="layui-input-inline">
                <input type="hidden" id="id" name="id">
                <input type="text" class="layui-input" id="title" name="title">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容:</label>
            <div class="layui-input-inline">
                <textarea class="layui-textarea" runat="server" id="content"  name="content" style="border: 0; width: 99%;height: 90px"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <button type="button" class="layui-btn" onclick="release()"><i class="layui-icon">&#xe67c;</i>发布公告</button>
            </div>
        </div>
    </form>
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
            });
        })    //建立编辑器
        function release(){
            $.ajax({
                url: "../announcement/release",
                type: "post",
                data: $("#addAnnouncmentForm").serialize(),
                dataType: "json",
                async: false,
                success: function (data) {
                    if(data.success){
                        layer.alert("发布成功")
                    }else{
                        layer.alert("系统错误,请等待修复")
                    }

                }
            })
        }
    </script>
</body>
</html>
