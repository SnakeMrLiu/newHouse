<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/15
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增员工信息</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css"/>
    <script src="../js/layui/layui.js"></script>
    <%--<script src="../js/layui/layui.all.js"></script>--%>
    <script src="../js/jquery-1.8.0.js"></script>
</head>
<body>
<!-- 新增员工信息form表单 -->
    <form class="layui-form" id="empForm" >

        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="name" name="name">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">登录帐号</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="loginnumber" name="loginnumber">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" class="layui-input" id="password" name="password">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">联系方式</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="phonenumer" name="phonenumer">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">微信二维码</label>
            <input type="hidden" name="weixin" id="weixinImg">

            <div class="layui-upload-list" id="weixinUpLoad"></div>

            <button type="button" class="layui-btn" id="weixinBt">
                <i class="layui-icon">&#xe67c;</i>上传微信二维码
            </button>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">头像</label>
            <input type="hidden" name="photo" id="photoImg">

            <div class="layui-upload-list" id="photoUpLoad"></div>

            <button type="button" class="layui-btn" id="photoBt">
                <i class="layui-icon">&#xe67c;</i>上传头像
            </button>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" id="addBt">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</body>
<script>
    
    $("#addBt").click(function () {
        $.ajax({
            url:"../emp/addEmpInfo.do",
            type:"post",
            data:$("#empForm").serialize(),
            dataType:"json",
            success:function(data){
                if(data.success){
                    layer.msg("新增成功!");
                    location.reload();
                }else{
                    layer.msg("新增失败!");
                }
            }
        })
    })

    layui.use(["upload"],function(){
        var $ = layui.jquery
            ,upload = layui.upload;

        //微信图片上传
        upload.render({
            elem: '#weixinBt' //绑定元素
            ,url: '../emp/uploadPhoto.do' //上传接口
            ,done: function(res){
                if(res.success){
                    //上传完毕回调
                    $ = layui.jquery;
                    $("#weixinImg").val(res.path);
                    $('#weixinUpLoad').append('<img src="' + res.path + '" width="100px" height="200px" class="layui-upload-img">')
                    //alert($("#weixinImage").val());
                }else{
                    layer.msg("上传失败!");
                }
            }
            ,error: function(res){

            }
        });
        //头像图片上传
        upload.render({
            elem: '#photoBt' //绑定元素
            ,url: '../emp/uploadPhoto.do' //上传接口
            ,done: function(res){
                if(res.success){
                    //上传完毕回调
                    $ = layui.jquery;
                    $("#photoImg").val(res.path);
                    $('#photoUpLoad').append('<img src="' + res.path + '" width="100px" height="100px" class="layui-upload-img">')
                    //alert($("#photoImage").val());
                }else{
                    layer.msg("上传失败!");
                }
            }
            ,error: function(res){

            }
        });
    });

</script>
</html>
