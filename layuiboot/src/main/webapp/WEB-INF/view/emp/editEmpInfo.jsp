<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/15
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改员工信息</title>
    <script src="../js/jquery-1.8.0.js"></script>
    <link rel="stylesheet" href="../js/layui/css/layui.css"/>
    <script src="../js/layui/layui.js"></script>
    <script src="../js/layui/layui.all.js"></script>
</head>
<body>
<a href="../emp/toEmpInfoList"> &lt;返回</a>
<!-- 修改员工信息form表单 -->
    <form class="layui-form" id="empForm" >

        <input type="hidden" name="id" id="id" value="${emp.id}"/>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" id="name" name="name" value="${emp.name}">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">登录帐号</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" id="loginnumber" name="loginnumber" value="${emp.loginnumber}">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" class="layui-input" id="password" name="password">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="password" class="layui-input" id="password2">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">联系方式</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" id="phonenumer" name="phonenumer" value="${emp.phonenumer}">
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
    </form>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" id="addBt">确定修改</button>
        </div>
    </div>


<script>

    $("#weixinUpLoad").html('<img src="${emp.weixin}" width="100px" height="100px">');
    $("#photoUpLoad").html('<img src="${emp.photo}" width="100px" height="100px">');

    $("#addBt").click(function () {
        layer.confirm("确认要编辑数据吗?",{title:"确认修改"},function(){
            var passwordValue = $('#password').val();
            var passwordValue2 = $("#password2").val();
            if(passwordValue2 != passwordValue){
                layer.msg("两次输入的密码不一致!");
                return false;
            }else{
                $.ajax({
                    url:"../emp/addEmpInfo.do",
                    type:"post",
                    data:$("#empForm").serialize(),
                    dataType:"json",
                    success:function(data){
                        if(data.success){
                            layer.msg("修改成功!");
                            location.href="../emp/toEmpInfoList";
                        }else{
                            layer.msg("修改失败!");
                        }
                    }
                })
            }
        })
    });

    //图片上传
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
                    $('#weixinUpLoad').html('<img src="' + res.path + '" width="100px" height="100px" class="layui-upload-img">')
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
                    $('#photoUpLoad').html('<img src="' + res.path + '" width="100px" height="100px" class="layui-upload-img">')
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

</body>
</html>
