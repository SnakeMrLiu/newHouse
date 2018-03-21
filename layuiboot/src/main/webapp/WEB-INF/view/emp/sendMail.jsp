<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/1/17
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../js/jquery-1.8.0.js"></script>
    <script src="../js/layui/layui.js"></script>
    <link rel="stylesheet" href="../js/layui/css/layui.css">

</head>
<body>
<div id="emailDIV">

    <form class="layui-form" id="sendMailForm"  style="padding-top:20px;">
        <input type="text" name="eid" value="${eid}">
        <div class="layui-form-item">
            <label class="layui-form-label">主题</label>
            <div class="layui-input-block">
                <input type="text" style="width: 360px" name="email_title" id="theme"  size="10" lay-verify="title" autocomplete="off" placeholder="请输入主题" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-block" style="width:70%;margin-left:12%;margin-top:1px;background-color:#fff;">
            <textarea class="layui-textarea" placeholder="请输入内容" name="email_conten" id="emailContent" >
            </textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">附件</label>
            <div class="layui-upload">
                <button type="button" class="layui-btn" id="emailFile">附件上传</button>
                <div style="padding-left: 100px" class="layui-upload-list"  id="emailaaaa"></div>
            </div>
        </div>
        <div class="layui-form-item" align="center">
            <div class="layui-input-block">
                <button class="layui-btn" onclick="addEmailButton()">提交</button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">


    //富文本编辑器 核心卖点
    layui.use('layedit', function(){
        layedit = layui.layedit;
        layedit.set({
            uploadImage: {
                //url: '<%=request.getContextPath()%>/house/uploadFileByEditor', //接口url
                type: 'post', //默认post

            }
        });
        indexsemail = layedit.build('emailContent',{
            height:240,

        }); //建立编辑器
    });

    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;

        upload.render({
            elem: '#emailFile'
            , url: '../empSendEmailInfo/emailImgUpload'
            , multiple: true
            , number: 5
            , size: 1024
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#emailaaaa').append('<img src="' + result + '" alt="' + file.name + '" class="layui-upload-img" height="100" width="100">');
                });
            }
            , done: function (res) {

            }
            , allDone: function (obj) {
                console.log(obj)
            }
        });
    })

    //添加
    function addEmailButton() {
        layedit.sync(indexsemail);
        $.ajax({
            url:"../empSendEmailInfo/emailSend",
            type:"post",
            data:$("#sendMailForm").serialize(),
            dateType:"json",
            success:function (data) {
                   if(data.success){

                   }
               //location.href="<%=request.getContextPath()%>/house/tiaocx"
            }
        })

    }


</script>

</body>
</html>
