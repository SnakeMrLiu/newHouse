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
    <form class="layui-form" id="editForm">
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline">
                <input type="hidden" id="id" name="id" value="${sellHouseResource.id}" >
                <input type="text" class="layui-input" id="title" name="title" value="${sellHouseResource.title}">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">售价</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" class="layui-input" id="price" name="price" value="${sellHouseResource.price}"  placeholder="￥">
            </div>
            <div class="layui-form-mid">万</div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">格局</label>
            <div class="layui-input-inline" style="width: 50px;">
                <input type="text" class="layui-input" id="room" name="room" value="${sellHouseResource.room}">
            </div>
            <div class="layui-form-mid">室</div>
            <div class="layui-input-inline" style="width: 50px;">
                <input type="text" class="layui-input" id="hall" name="hall" value="${sellHouseResource.hall}">
            </div>
            <div class="layui-form-mid">厅</div>
            <div class="layui-input-inline" style="width: 50px;">
                <input type="text" class="layui-input" id="toilet" name="toilet" value="${sellHouseResource.toilet}">
            </div>
            <div class="layui-form-mid">卫</div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">面积</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" class="layui-input" id="area" name="area" value="${sellHouseResource.area}">
            </div>
            <div class="layui-form-mid">m²</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">建造年代</label>
            <div class="layui-input-inline" >
                <select name="buildingTime" id="buildingTime" value="${sellHouseResource.buildingTime}" >
                    <option value="">请选择</option>
                    <option value="1" selected>四合院</option>
                    <option value="2" selected>公寓</option>
                    <option value="3" selected>普通住宅</option>
                    <option value="4" selected>别墅</option>
                    <option value="5" selected>其他</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">小区名称</label>
            <div class="layui-input-inline">
                <select name="community" id="communityId" value="${sellHouseResource.buildingTime}">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地区</label>
            <div class="layui-input-inline">
                <select name="province" id="province" lay-filter="province" value="${sellHouseResource.province}">
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="city" id="city" lay-filter="city" value="${sellHouseResource.city}">
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="county" id="county" value="${sellHouseResource.county}">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">房屋类型</label>
            <div class="layui-input-inline">
                <select name="roomType" id="roomType" value="${sellHouseResource.roomType}">

                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">房屋方向</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="roomDirection" name="roomDirection"value="${sellHouseResource.roomDirection}" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所在楼层</label>
            <div class="layui-input-inline" style="width: 100px;" >
                <input type="text" class="layui-input" id="floor" name="floor" value="${sellHouseResource.floor}">
            </div>
            <div class="layui-form-mid">层</div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">装修程度</label>
            <div class="layui-input-inline">
                <select name="decorate" id="decorate" value="${sellHouseResource.decorate}">

                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">参考单价</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" class="layui-input" id="unitPrice" name="unitPrice"  placeholder="￥" value="${sellHouseResource.unitPrice}">
            </div>
            <div class="layui-form-mid">万</div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">参考月供</label>
            <div class="layui-input-inline"  style="width: 100px;">
                <input type="text" class="layui-input" id="monthlyPayments" name="monthlyPayments" value="${sellHouseResource.monthlyPayments}" placeholder="￥">
            </div>
            <div class="layui-form-mid">万</div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">核心卖点</label>
            <div class="layui-input-inline">
                <textarea class="layui-textarea" runat="server" id="sellingPoint"  name="sellingPoint" style="border: 0; width: 99%;height: 90px">
                    ${sellHouseResource.sellingPoint}
                </textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">业主心态</label>
            <div class="layui-input-inline">
                <textarea class="layui-textarea" runat="server" id="ownerMentality"  name="ownerMentality" style="border: 0; width: 99%;height: 90px">
                    ${sellHouseResource.ownerMentality}
                </textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">小区配套</label>
            <div class="layui-input-inline">
                <textarea class="layui-textarea" runat="server" id="communityComplete"  name="communityComplete" style="border: 0; width: 99%;height: 90px">
                    ${sellHouseResource.communityComplete}
                </textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">服务介绍</label>
            <div class="layui-input-inline">
                <textarea class="layui-textarea" runat="server" id="serviceIntroduce"  name="serviceIntroduce" style="border: 0; width: 99%;height: 90px">
                    ${sellHouseResource.serviceIntroduce}
                </textarea>
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
    <center><button type="button" class="layui-btn" onclick="updateHouse()"><i class="layui-icon">&#xe67c;</i>修改房源</button></center>
<script>

    layui.use(['form', 'layedit', 'laydate','layedit',"upload"], function(){
        var $ = layui.jquery
         form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,upload = layui.upload;
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
    //房屋类型
    $.ajax({
        url: "../sellhouse/queryHouseType",
        type: "post",
        dataType: "json",
        async: false,
        success: function (data) {
            $("#roomType").html("");
            var  roomType =  '<option value="" selected>别墅类型</option>' ;
            $.each(data,function(){
                roomType += '<option value="'+this.id+'" selected>'+this.name+'</option>'
            })
            $("#roomType").append(roomType);
        }
    })
    //装修程度
    $.ajax({
        url: "../sellhouse/queryDecorate",
        type: "post",
        dataType: "json",
        async: false,
        success: function (data) {
            $("#decorate").html("");
            var  decorate =  '<option value=""selected>装修</option>' ;
            $.each(data,function(){
                decorate += '<option value="'+this.id+'"selected>'+this.name+'</option>'
            })
            $("#decorate").append(decorate);
        }
    })
    //新增方法
    function updateHouse() {
        layui.use(['layer','layedit'], function() {
            layedit=layui.layedit;
            layedit.sync(indexs1);
            layedit.sync(indexs2);
            layedit.sync(indexs3);
            layedit.sync(indexs4);
            $.ajax({
                url: "../sellhouse/updateHouseInfo",
                type: "post",
                dataType: "json",
                data: $("#editForm").serialize(),
                async: true,
                success: function (data) {
                        layer.alert("修改成功")
                },
                error:function (){
                    layer.alert("修改成功")
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
                var str= "<option value=''selected>请选择</option>";
                for (var i = 0;i<data.length;i++){
                    str += '<option value="'+data[i].id+'" selected>'+data[i].name+'</option>'
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
                if(this.id == ${sellHouseResource.province}){      //这里是选中省的
                    province += '<option value="'+this.id+'" selected>'+this.name+'</option>'
                }
                province += '<option value="'+this.id+'">'+this.name+'</option>'
            })
            $("#province").html(province);
        }
    })

    //加载市
    $.ajax({
        url:"../sellhouse/queryArea",
        type:"post",
        data:{"pid":${sellHouseResource.province}},
        dataType:"json",
        async:false,
        success:function(cityData){
            var  province= '<option value="-1">请选择市</option>';
            $.each(cityData,function(){
                if(this.id == ${sellHouseResource.city}){//这里是选中市的
                    province += '<option value="'+this.id+'" selected>'+this.name+'</option>'
                }
                province += '<option value="'+this.id+'">'+this.name+'</option>'
            })
            $("#city").html(province);
           // form.render('select');
        }
    })
    alert("市"+${sellHouseResource.city})
    alert("县"+${sellHouseResource.county})
    //加载县
    $.ajax({
        url:"../sellhouse/queryArea",
        type:"post",
        data:{"pid":${sellHouseResource.city}},
        dataType:"json",
        async:false,
        success:function(countyData){
            var  province= '<option value="-1">请选择县/区</option>';
            $.each(countyData,function(){
                alert
                if(this.id == ${sellHouseResource.county}){ //这里是选中县的
                    province += '<option value="'+this.id+'" selected>'+this.name+'</option>'
                }
                province += '<option value="'+this.id+'">'+this.name+'</option>'
            })
            $("#county").html(province);
           // form.render('select');
        }
    })

 $.ajax({
     url:"../sellhouse/queryImg",
     type:"post",
     data:{"sid":'${sellHouseResource.id}'},
     dataType:"json",
     async:false,
     success: function (data) {
         for(var i=0;i<data.list.length;i++){
             if(data.list[i].imgtype == 1){
                 $("#demo1").append('<img src="'+data.list[i].url+'" width="100px" height="100px"/>');
             }else if(data.list[i].imgtype == 2){
                 $("#demo2").append('<img src="'+data.list[i].url+'" width="100px" height="100px"/>');
             }else{
                 $("#demo3").append('<img src="'+data.list[i].url+'" width="100px" height="100px"/>');
             }
         }

     }
 })

</script>

</body>
</html>
