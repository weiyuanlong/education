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
    function previewImage(file,fileName,imghead,previewImg,preview) {
        var MAXWIDTH  = 800;
        var MAXHEIGHT = 300;
        var div = document.getElementById(preview);
        if (file.files && file.files[0]) {
            div.innerHTML ='<img id='+imghead+' onclick=$('+previewImg+').click()>';
            var img = document.getElementById(imghead);
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
            div.innerHTML = '<img id='+imghead+'>';
            var img = document.getElementById(imghead);
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
        }
        logoUpload(fileName,previewImg);
    }

    /**
     * logo图片上传
     */
    function logoUpload(fileName,previewImg) {
        var formData = new FormData();
        formData.append("orgLogo", $(previewImg)[0].files[0]);
        $.ajax({
            type: 'POST',
            url: "<%= applicationPath%>/logoUpload?fileName="+fileName,
            dataType:"json",
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            scriptCharset: 'utf-8',
            success: function(data){
                console.log(data);
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
    <form class="layui-form" id="myForm" method="post" action = "">

        <div class="layui-row layui-col-space15">
            <div class="layui-col-xs12 layui-col-md12">
                <div class="portlet box">
                    <div class="portlet-body">
                        <div class="layui-form-item">
                            <!-- 图片上传 -->
                            <div class="layui-inline">
                                <label class="layui-form-label" >图片1</label>
                                <div class="layui-inline" id="preview1">
                                    <img id="imghead1" style="width:800px;height:300px" border="0" src="<%=applicationPath%>/static/images/banner/banner1.jpg" onclick="$('#previewImg1').click();">
                                </div>
                                <input type="file" onchange="previewImage(this,'banner1.jpg','imghead1','#previewImg1','preview1')" style="display: none;" id="previewImg1">
                            </div>
                            <input type="hidden" name="orgLogo">
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md12">
                <div class="portlet box">
                    <div class="portlet-body">
                        <div class="layui-form-item">
                            <!-- 图片上传 -->
                            <div class="layui-inline">
                                <label class="layui-form-label" >图片2</label>
                                <div class="layui-inline" id="preview2">
                                    <img id="imghead2" style="width:800px;height:300px" border="0" src="<%=applicationPath%>/static/images/banner/banner2.jpg" onclick="$('#previewImg2').click();">
                                </div>
                                <input type="file" onchange="previewImage(this,'banner2.jpg','imghead2','#previewImg2','preview2')" style="display: none;" id="previewImg2">
                            </div>
                            <input type="hidden" name="orgLogo">
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-md12">
                <div class="portlet box">
                    <div class="portlet-body">
                        <div class="layui-form-item">
                            <!-- 图片上传 -->
                            <div class="layui-inline">
                                <label class="layui-form-label" >图片1</label>
                                <div class="layui-inline" id="preview3">
                                    <img id="imghead3" style="width:800px;height:300px" border="0" src="<%=applicationPath%>/static/images/banner/banner3.jpg" onclick="$('#previewImg3').click();">
                                </div>
                                <input type="file" onchange="previewImage(this,'banner3.jpg','imghead3','#previewImg1','preview3')" style="display: none;" id="previewImg3">
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
