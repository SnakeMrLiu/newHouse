<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房源列表</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css"/>
    <script src="../js/layui/layui.js"></script>
    <%--<script src="../js/layui/layui.all.js"></script>--%>
    <script src="../js/jquery-1.8.0.js"></script>
</head>
<body>
    <form class="layui-form" id="hoouseForm">
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline">
                <input type="hidden" id="id" name="id">
                <input type="text" class="layui-input" id="title" name="title">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">售价</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" class="layui-input" id="price" name="price"  placeholder="￥">
            </div>
            <div class="layui-form-mid">万</div>
            <label class="layui-form-label">参考单价</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" class="layui-input" id="unitPrice" name="unitPrice"  placeholder="￥">
            </div>
            <div class="layui-form-mid">万</div>
            <label class="layui-form-label">参考月供</label>
            <div class="layui-input-inline"  style="width: 100px;">
                <input type="text" class="layui-input" id="monthlyPayments" name="monthlyPayments"  placeholder="￥">
            </div>
            <div class="layui-form-mid">万</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地区</label>
            <div class="layui-input-inline">
                <select name="province" id="province" lay-filter="province">
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="city" id="city" lay-filter="city">
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="county" id="county">
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">建造年代</label>
            <div class="layui-input-inline"  style="width: 100px;">
                <select name="buildingTime" id="buildingTime">
                    <option value="">请选择</option>
                    <option value="1">70年代</option>
                    <option value="2">80年代</option>
                    <option value="3">90年代</option>
                </select>
            </div>
            <label class="layui-form-label">房屋类型</label>
            <div class="layui-input-inline"  style="width: 100px;">
                <select name="roomType" id="roomType">
                    <option value="">请选择</option>
                    <option value="1">四合院</option>
                    <option value="2">公寓</option>
                    <option value="3">普通住宅</option>
                    <option value="4">别墅</option>
                    <option value="5">其他</option>
                </select>
            </div>
            <label class="layui-form-label">小区名称</label>
            <div class="layui-input-inline"  style="width: 100px;">
                <select name="community" id="communityId">
                </select>
            </div>
            <label class="layui-form-label">装修程度</label>
            <div class="layui-input-inline"  style="width: 100px;">
                <select name="decorate" id="decorate">
                    <option value=""></option>
                    <option value="1">毛坯</option>
                    <option value="2">普通</option>
                    <option value="3">精装</option>
                    <option value="4">豪华</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">格局</label>
            <div class="layui-input-inline" style="width: 50px;">
                <input type="text" class="layui-input" id="room" name="room">
            </div>
            <div class="layui-form-mid">室</div>
            <div class="layui-input-inline" style="width: 50px;">
                <input type="text" class="layui-input" id="hall" name="hall">
            </div>
            <div class="layui-form-mid">厅</div>
            <div class="layui-input-inline" style="width: 50px;">
                <input type="text" class="layui-input" id="toilet" name="toilet">
            </div>
            <div class="layui-form-mid">卫</div>
            <label class="layui-form-label">面积</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" class="layui-input" id="area" name="area">
            </div>
            <div class="layui-form-mid">m²</div>
            <label class="layui-form-label">房屋方向</label>
            <div class="layui-input-inline" style="width: 80px;">
                <input type="text" class="layui-input" id="roomDirection" name="roomDirection">
            </div>
            <label class="layui-form-label">所在楼层</label>
            <div class="layui-input-inline" style="width: 100px;" >
                <input type="text" class="layui-input" id="floor" name="floor">
            </div>
            <div class="layui-form-mid">层</div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">核心卖点</label>
            <div class="layui-input-inline">
                <textarea class="layui-textarea" runat="server" id="sellingPoint"  name="sellingPoint" style="border: 0; width: 99%;height: 90px"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">业主心态</label>
            <div class="layui-input-inline">
                <textarea class="layui-textarea" runat="server" id="ownerMentality"  name="ownerMentality" style="border: 0; width: 99%;height: 90px"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">小区配套</label>
            <div class="layui-input-inline">
                <textarea class="layui-textarea" runat="server" id="communityComplete"  name="communityComplete" style="border: 0; width: 99%;height: 90px"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">服务介绍</label>
            <div class="layui-input-inline">
                <textarea class="layui-textarea" runat="server" id="serviceIntroduce"  name="serviceIntroduce" style="border: 0; width: 99%;height: 90px"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">室内图片</label>
            <div class="layui-input-inline">
                <div id="photoDiv1"></div>
                <div class="layui-upload-list" id="imgdemo1"></div>
                <div class="layui-upload-list" id="demo1"></div>
                <button type="button" class="layui-btn" id="test1">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">户型图片</label>
            <div class="layui-input-inline">
                <div id="photoDiv2"></div>
                <div class="layui-upload-list" id="imgdemo2"></div>
                <div class="layui-upload-list" id="demo2"></div>
                <button type="button" class="layui-btn" id="test2">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">环境图片</label>
            <div class="layui-input-inline">
                <div id="photoDiv3"></div>
                <div class="layui-upload-list" id="imgdemo3"></div>
                <div class="layui-upload-list" id="demo3"></div>
                <button type="button" class="layui-btn" id="test3">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
            </div>
        </div>
    </form>
    <center><button type="button" class="layui-btn" onclick="addHouse()"><i class="layui-icon">&#xe67c;</i>新增房源</button></center>
<script>
    layui.use(['form', 'layedit', 'laydate','layedit',"upload"], function(){
        var $ = layui.jquery
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,upload = layui.upload;
        //上传图片,必须放在 创建一个编辑器前面
        layedit.set({
            uploadImage: {
                url: '../sellhouse/uploadFile' //接口url
                ,type: 'post' //默认post
            }
        });
        //创建一个编辑器
        var editIndex = layedit.build('content',{
                height:400
            }
        );
        form.on('select(province)', function (data) {
            $("#county").text("请选择县/区");
            //加载市
            $.ajax({
                url:"../sellhouse/queryArea",
                type:"post",
                data:{"pid":data.value},
                dataType:"json",
                async:false,
                success:function(cityData){
                    var  province= '<option value="-1">请选择市</option>';
                    $.each(cityData,function(){
                        province += '<option value="'+this.id+'">'+this.name+'</option>'
                    })
                    $("#city").html(province);
                    form.render('select');
                }
            })
        });
        form.on('select(city)', function (data) {
            //加载县
            $.ajax({
                url:"../sellhouse/queryArea",
                type:"post",
                data:{"pid":data.value},
                dataType:"json",
                async:false,
                success:function(countyData){
                    var  province= '<option value="-1">请选择县/区</option>';
                    $.each(countyData,function(){
                        province += '<option value="'+this.id+'">'+this.name+'</option>'
                    })
                    $("#county").html(province);
                    form.render('select');
                }
            })

        });

        layui.use('layedit', function(){
            layedit = layui.layedit;

            indexs1 = layedit.build('sellingPoint',{
                height: 160,
            }); //建立编辑器
            indexs2 = layedit.build('ownerMentality',{
                height: 160,
            }); //建立编辑器
            indexs3 = layedit.build('communityComplete',{
                height: 160,
            }); //建立编辑器
            indexs4 = layedit.build('serviceIntroduce',{
                height: 160,
            }); //建立编辑器

        });

        //多图片上传
        upload.render({
            elem: '#test1' //绑定元素
            ,url: '../sellhouse/headImgUpload' //上传接口
            ,multiple: true
            ,done: function(res){
                //上传完毕回调
                $ = layui.jquery;
                $("#photoDiv1").append('<input type="hidden" name="url" value="'+res.path+'">');
                $("#photoDiv1").append('<input type="hidden" name="imgtype" value="1">');
                $('#imgdemo1').append('<img src="' + res.path + '" width="100px" height="100px" class="layui-upload-img">')
            }
        });
        //多图片上传
        upload.render({
            elem: '#test2' //绑定元素
            ,url: '../sellhouse/headImgUpload' //上传接口
            ,multiple: true
            ,done: function(res){
                //上传完毕回调
                $ = layui.jquery;
                $("#photoDiv2").append('<input type="hidden" name="url" value="'+res.path+'">');
                $("#photoDiv2").append('<input type="hidden" name="imgtype" value="2">');
                $('#imgdemo2').append('<img src="' + res.path + '" width="100px" height="100px" class="layui-upload-img">')
            }
        });
        //多图片上传
        upload.render({
            elem: '#test3' //绑定元素
            ,url: '../sellhouse/headImgUpload' //上传接口
            ,multiple: true
            ,done: function(res){
                //上传完毕回调
                $ = layui.jquery;
                $("#photoDiv3").append('<input type="hidden" name="url" value="'+res.path+'">');
                $("#photoDiv3").append('<input type="hidden" name="imgtype" value="3">');
                $('#imgdemo3').append('<img src="' + res.path + '" width="100px" height="100px" class="layui-upload-img">')
            }
        });
    });
    //新增方法
    function addHouse() {
        layui.use(['layer','layedit'], function() {
            layedit=layui.layedit;
            layedit.sync(indexs1);
            layedit.sync(indexs2);
            layedit.sync(indexs3);
            layedit.sync(indexs4);
            $.ajax({
                url: "../sellhouse/addHouseInfo",
                type: "post",
                dataType: "json",
                data: $("#hoouseForm").serialize(),
                async: true,
                success: function (data) {
                        layer.alert("添加成功")
                },
                error:function (){
                    layer.alert("添加成功")
                }
            });
            indexs1 = layedit.build('sellingPoint'); //建立编辑器
            indexs2 = layedit.build('ownerMentality'); //建立编辑器
            indexs3 = layedit.build('communityComplete'); //建立编辑器
            indexs4 = layedit.build('serviceIntroduce'); //建立编辑器
        })
    }

    //页面加载小区下拉框
        $.ajax({
            url:'../sellhouse/queryCommunity',
            type:"post",
            dataType:"json",
            async:false,
            success:function (data){
                var str= "<option value=''>请选择</option>";
                for (var i = 0;i<data.length;i++){
                    str += '<option value="'+data[i].id+'">'+data[i].name+'</option>'
                }
                $("#communityId").html(str);
            },
        });
    //加载省
    $.ajax({
        url:"../sellhouse/queryArea",
        type:"post",
        data:{"pid":0},
        dataType:"json",
        async:false,
        success:function(data){
            var  province= '<option value="-1">请选择省</option>';
            $.each(data,function(){
                province += '<option value="'+this.id+'">'+this.name+'</option>'
            })
            $("#province").html(province);
        }
    })

</script>

</body>
</html>
