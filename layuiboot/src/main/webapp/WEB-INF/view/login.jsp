<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
	<title>LarryCMS后台登录</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="../js/login/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="../js/login/css/login.css" media="all">
</head>
<body>
<div class="layui-canvs"></div>
<div class="layui-layout layui-layout-login">
	<h1>
		 <strong>MrLiuCMS管理系统后台</strong>
		 <em>Management System</em>
	</h1>
	<div class="layui-user-icon larry-login">
		 <input type="text" placeholder="用户名" name="loginnumber" id="loginnumber" class="login_txtbx"/>
	</div>
    <div class="layui-val-icon larry-login">
    	<div class="layui-code-box">
    		<input type="text" id="verification"  placeholder="验证码" maxlength="6" style="width: 170px;margin-right:42%;" class="login_txtbx">
    	</div>
    </div>
	<div class="layui-submit larry-login">
		<input type="button" id="getYzm" value="获取验证码" class="submit_btn"/>
	</div>
    <div class="layui-submit larry-login">
    	<input type="button" value="立即登陆" class="submit_btn" id="loginbut"/>
    </div>
	<div id="container" style="margin-top:34%;margin-left: 45%;display:none;">
		<div class="stick"></div>
		<div class="stick"></div>
		<div class="stick"></div>
		<div class="stick"></div>
		<div class="stick"></div>
		<div class="stick"></div>
		<h1>Loading...</h1>
	</div>
    <div class="layui-login-text">
    	<p>© 2018 Mr.Liu 版权所有</p>
        <p>冀xxxxxx</p>
    </div>
</div>
<script type="text/javascript" src="../js/login/common/layui/lay/dest/layui.all.js"></script>
<script type="text/javascript" src="../js/login/js/login.js"></script>
<script type="text/javascript" src="../js/login/jsplug/jparticle.jquery.js"></script>
<script type="text/javascript">
$(function(){
	$(".layui-canvs").jParticle({
		background: "#141414",
		color: "#E6E6E6"
	});
});
//刷新验证码
flag = true;
/*function updateImg(){
    $("#updateImgCode").attr('src',"../ImgServlet?"+Date.parse(new Date()));
}*/
    $("#loginbut").click(function () {
        var checkCode = $("#verification").val();
        if (checkCode == "" && checkCode == null) {
            layer.alert("验证码不能为空")
            return;
        }
        if (checkCode.length != 6) {
            layer.alert("验证码必须六位")
            return;
        }
        $.ajax({
            url: "<%=request.getContextPath()%>/login/userLoginMethod",
            type: "post",
            data: {"loginnumber": $("#loginnumber").val(), "verification": $("#verification").val()},
            dataType: "json",
            async: true,
            success: function (data) {
                if (data.success || data.success == "true") {
                    location.href = "<%=request.getContextPath()%>/tree/toIndex.do";
                } else {
                    layer.alert("验证码错误");
                }
            }
        });
    })
var count = 5;
var time;
function countdown(){
    flag = false;
    $('#getYzm').val(--count+"s");
    if(count <= 0){
        $('#getYzm').val("获取验证码");
        count = 5;
        flag = true;
        window.clearInterval(time);
    }
}

    $("#getYzm").click(function () {
        var loginnumber = $("#loginnumber").val();
        if (loginnumber == "" && loginnumber == null) {
            layer.alert("用户名不能为空");
            return;
        }
        if ($('#getYzm').val() == "获取验证码"){
            if(flag) {
                time = window.setInterval('countdown()', 1000)
            }
            $.ajax({
                url: "../login/getInterfaceSMS",
                type: "post",
                dataType: "json",
                data: {"loginnumber": $("#loginnumber").val()},
                async: true,
                success: function (data) {
                    if (data.success == 1) {
                        layer.alert("发送成功！请注意查收！");
                    }
                    if (data.success == 2) {
                        layer.alert("该手机号未注册！");
                    }
                    if (data.success == 3) {
                        layer.alert("请稍后！ 亲");
                    }
                    if (data.success == 3) {
                        layer.alert("系统繁忙");
                    }
                }
            });
        }
    })



//登录
/*function landing(){
    if(flag==false){
        $('#container').css('display','block');
        flag=true;
        var loginnumber=$("#loginnumber").val();
        if(loginnumber==""){
            layer.alert('提示','用户名不能为空')
            flag=false
            return;
        }
        /!*var password=$("#password").val();
        if(password==""){
            layer.alert('提示','密码不能为空')
            flag=false
            return;
        }*!/
        var checkCode=$("#checkCode").val();
        if(checkCode==""){
            layer.alert('提示','验证码不能为空')
            flag=false
            return;
        }
        if (checkCode.length!=6) {
            layer.alert('提示','验证码必须六位')
            flag=false
            return;
        }
        $.ajax({
            url:"../login/toLogin.do",
            type:'post',
            async:false,
            data:{
                loginNumber:loginnumber,
                password:password,
                checkNumber:checkCode
            },
            datatype:'json',
            success:function(data){
                if(data.flag==5){
                    location.href="../index/toIndex.do";
                }else if(data.flag==1){
                    $('#container').css('display','none');
                    $.messager.alert('提示','验证码错误!');
                    updateImg();
                    flag=false;
                }
                else if(data.flag==2){
                    $('#container').css('display','none');
                    $.messager.alert('提示','用户名或密码错误');
                    updateImg();
                    flag=false;
                }
                else if(data.flag==3){
                    $('#container').css('display','none');
                    $.messager.alert('提示','账户被锁定');
                    updateImg()
                    flag=false;
                }
                else if(data.flag==4){
                    $.messager.alert('警告','警告消息');
                    $.messager.confirm('确认','账号不在常用地址登陆',function(r){
                        if (r){
                            location.href="../index/toIndex.do";
                        }
                    });

                }
            }
        })
    }else{
        $.messager.alert('提示','请勿重复登录')
    }
}*/
//回车登录
$(document).keypress(function(e) {
    var eCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
    if (eCode == 13){
        landing();
    }
});
</script>
</body>
</html>