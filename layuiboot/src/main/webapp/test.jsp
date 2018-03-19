<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/3/19
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="../js/jquery-1.8.0.js"></script>
<script src="//cstaticdun.126.net/load.min.js"></script>
<body>
<div class="form-container">
    <input type="text" name="username" id="username" placeholder="用户名"><br/>
    <input type="password" name="password" id="password" placeholder="密码"><br/>
    <br/><br/><br/><br/><br/><br/><div id="captcha"></div> <!-- 验证码容器元素 -->
    <button type="submit">登录</button>
</div>

</body>
<script>
    initNECaptcha({
        captchaId: '78aa3ee4d1cb437b9f1576f41eaf879e',
        element: '#captcha',
        mode: 'float',
        width: 320,
        onReady: function (instance) {
            // 验证码一切准备就绪，此时可正常使用验证码的相关功能
        },
        onVerify: function (err, data) {
            /**
             * 第一个参数是err（Error的实例），验证失败才有err对象
             * 第二个参数是data对象，验证成功后的相关信息，data数据结构为key-value，如下：
             * {
         *   validate: 'xxxxx' // 二次验证信息
         * }
             */
            // 点击登录按钮后可调用服务端接口，以下为伪代码，仅作示例用
            $.ajax({
                url:"../test/test",
                type:"post",
                data:{"captchaId":"78aa3ee4d1cb437b9f1576f41eaf879e","username":$('#username').val(),"password":$('#password').val(),"validate":data.validate},
                dataType:"json",
                success:function(data){
                    alert();
                }
            })
        }
    }, function onload (instance) {
        // 初始化成功
    }, function onerror (err) {
        // 验证码初始化失败处理逻辑，例如：提示用户点击按钮重新初始化
    })
</script>
</html>
