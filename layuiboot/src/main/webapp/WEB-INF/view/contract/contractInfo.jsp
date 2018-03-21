<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/21
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>合同详情</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css"/>
    <script src="../js/layui/layui.js"></script>
    <%--<script src="../js/layui/layui.all.js"></script>--%>
    <script src="../js/jquery-1.8.0.js"></script>
</head>
<body>
<div>
    <body>
    <a href="../contract/toContract" class="layui-btn" >返回</a>
    <center><h2>租房协议书</h2></center>
    <pre>
            出租方(甲方)：_${contract.lessor}__________ 　　承租方(乙方)：____${contract.tenantry}_______ 　　
            甲、乙双方就房屋租赁事宜，达成如下协议： 　　
            一、甲方将位于 房屋出租给乙方居住使用. 　　
            二、租赁期限自 ${contract.starttime} 至 ${contract.endtime}，计__12_个月。 　　
            三、本房屋月租金为人民币___${contract.c}____，按_${contract.installment}__结算。每月月初_${contract.timelimit}__日内，乙方向甲方支付全月租金。 　　
            四、乙方应于签合约时交付甲方人民币_____${contract.b}_____整，租赁期满乙方如不续租，应交清所有租赁
        期间发生的费用，交清后，甲方应无息退还押金。 　　
            五、乙方租赁期间，水费、电费、电视费、电话费、物业费以及其它由乙方居住而产生的费用由乙方
        负担。租赁结束时，乙方须交清欠费。 　
            六、乙方不得随意损坏房屋设施，如需装修或改造，需先征得甲方同意，并承担装修改造费用。租赁
        结束时，乙方须将房屋设施恢复原状。 　　
            七、租赁期满后，如乙方要求继续租赁，则须提前1个月向甲方提出，甲方收到乙方要求后10天内答复。
        如同意继续租赁，则续签租赁合同。同等条件下，乙方享有优先租赁的权利。 　　
            八、租赁期间，任何一方提出终止合同，需提前1个月书面通知对方，经双方协商后签订终止合同书。
        若一方强行中止合同，须向另一方支付违约金__${contract.a}__。 　　
            九、发生争议，甲、乙双方友好协商解决。协商不成时，提请由当地人民法院仲裁。 　　
            十、本合同连一式2份，甲、乙双方各执1份，自双方签字之日起生效。

            　　
        甲方：             乙方： 　　
                                                                              日期：
    </pre>
    </body>
    <script>

    </script>
</div>
</body>
</html>
