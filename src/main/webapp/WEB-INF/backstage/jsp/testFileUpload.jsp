<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>测试上传文件</title>
    <link rel="stylesheet" href="<%=layuiPath%>/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=cssPath%>/doc.css" media="all">
    <link rel="stylesheet" href="<%=cssPath%>/main.css">
    <style>
        .layui-form-label{
            text-align: left;
        }
        .portlet-body button{
            margin: 8px;
        }

        .layui-form-label{
            min-width: 100px;
            max-width: 80%;
        }

        .layui-input{
            min-width: 300px;
        }
    </style>
</head>

<body>
<div class="tab-body" id="vehicleInfo">

</div>
<script src="<%=layuiPath%>/layui.all.js" charset="utf-8"></script>
<script src="<%=jsPath%>/jquery-1.10.2.min.js"></script>
<script src="<%=jsPath%>/main.js"></script>
<script>

    $(function() {
        loadTemplate({});
    })


    /*加载模板*/
    function loadTemplate(data){
        var laytpl = layui.laytpl;
        var getVehicleTpl = vehicleInfoModle.innerHTML
            ,view =$("#vehicleInfo");
        laytpl(getVehicleTpl).render(data, function(html){
            view.html(html);
        });
        console.log(data);
    }

    /**
     * 图片上传
     * @param file
     */
    function previewImage(file) {
        var MAXWIDTH  = 90;
        var MAXHEIGHT = 90;
        var div = document.getElementById('preview');
        if (file.files && file.files[0]) {
            div.innerHTML ='<img id=imghead onclick=$("#previewImg").click()>';
            var img = document.getElementById('imghead');
            img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
                img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top+'px';
            }
            var reader = new FileReader();
            reader.onload = function(evt){img.src = evt.target.result;}
            reader.readAsDataURL(file.files[0]);
        }else {
            //兼容IE
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
        }
        logoUpload();
    }

    /**
     * logo图片上传
     */
    function logoUpload() {
        var formData = new FormData();
        formData.append("orgLogo", $("#previewImg")[0].files[0]);
        formData.append("logoPath", $("#driverLogo").val());
        $.ajax({
            type: 'POST',
            url: "<%= applicationPath%>/authc/driver/logoUpload",
            dataType:"json",
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            scriptCharset: 'utf-8',
            success: function(data){
                console.log(data);
                $("#driverLogo").val(data.message);
            }
        });
    }
    /**
     * 图片规格
     */
    function clacImgZoomParam( maxWidth, maxHeight, width, height ){
        var param = {top:0, left:0, width:width, height:height};
        if( width>maxWidth || height>maxHeight ){
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if( rateWidth > rateHeight ){
                param.width =  maxWidth;
                param.height = Math.round(height / rateWidth);
            }else{
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }
        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
    }
</script>

<script type="text/html" id="vehicleInfoModle">
    <form class="layui-form" id="myForm" method="post" action = "<%= applicationPath%>${requestScope.id==null?'/authc/driver/addDriverInfo.html':'/authc/driver/editDriverInfo.html'}">
        <input type="hidden" name="id" value="${requestScope.id==null||requestScope.id==''?0:requestScope.id}"/>

        <div class="layui-row layui-col-space15">
            <div class="layui-col-xs12 layui-col-md12">
                <div class="portlet box">
                    <div class="portlet-header">
                        <!-- 司机基本详情 -->
                        <label class="layui-form-label" ><nobr>图片上传</nobr></label>
                        <div class="tools"></div>
                    </div>
                    <div class="portlet-body">
                        <div class="layui-form-item">
                            <!-- 图片上传 -->
                            <div class="layui-inline">
                                <label class="layui-form-label" >图片</label>
                                <div class="layui-inline" id="preview">
                                    <img id="imghead" style="width:104px;height:104px" border="0" src="{{d.logo_path==undefined?'<%=imagesPath%>/cross.png':'<%=imagesPath%>/'+d.showImg}}" onclick="$('#previewImg').click();">
                                </div>
                                <input type="file" onchange="previewImage(this)" style="display: none;" id="previewImg">
                                <input type = "hidden" name = "logoPath" id = "driverLogo">
                            </div>
                            <input type="hidden" name="orgLogo">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-row layui-col-space15">
            <div class="layui-form-item" style="margin-left: 30px">
                <div class="layui-input-block">
                    <button class="layui-btn layui-btn-normal  formItem inputItem" lay-submit="" lay-filter="driverSubmit"  style="width: 16% ;">提交</button>
                </div>
            </div>
        </div>
    </form>
</script>

</body>
</html>
