<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>监控管理平台</title>
    <link rel="icon"  type="image/x-icon"   href="<%=imagesPath%>/icon_title_logo.ico"/>
    <link rel="stylesheet" href="<%=layuiPath%>/css/layui.css" media="all">
    <link type="text/css"  href="<%=cssPath%>/font-awesome.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="<%=cssPath%>/app.css" media="all">
    <link rel="stylesheet" href="<%=cssPath%>/main.css">
    <style>
        .layui-header{
            background-color: #3B3F4B!important;
        }
        .layui-nav-item:hover{
            background-color: #4B4F5B;
        }
        .layui-logo{
            width: auto;margin-left: 5px;
        }

        .title-span{
            color: white;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            margin-left: 5px;
            margin-right: 8px;
        }
        .layui-side-scroll .layui-nav-item a span:hover{
            color: white!important;
        }
    </style>
    <script type="text/javascript" src="<%=jqueryPath%>"></script>
</head>

<body>
<div class="layui-layout layui-layout-admin kit-layout-admin" >
    <div class="layui-header" >
        <div class="layui-logo" ><img width="32px" height="16px" src="<%=imagesPath%>/icon_index_logo.png"><span class="title-span">${user.org.orgName}</span></div>
        <div class="layui-title" >监控管理平台</div>
        <div class="layui-logo kit-logo-mobile" style="width: auto;margin-left: 5px;"><img src="<%=imagesPath%>/icon_index_logo.png"><span class="title-span">${user.org.orgName}</span></div>
        <ul class="layui-nav layui-layout-right kit-nav">
            <li class="layui-nav-item"><a href="javascript:;">帮助</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    姓名
                </a>

            </li>
            <li class="layui-nav-item"><a href="javascript:;"  onclick="loginOut()"><fmt:message key="退出"/></a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black kit-side layui-side-bar">
        <div class="layui-side-scroll">
            <!--<div class="kit-side-fold"><i class="fa fa-navicon" aria-hidden="true"></i></div>-->
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="kitNavbar" kit-navbar>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;"><img src="<%=imagesPath%>/nav_icon_hot_20.png"><span>常用菜单</span></a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" kit-target data-options="{url:'${pageContext.request.contextPath }/authc/organization/fleetList.html',icon:'',title:'车队信息',id:'111'}">
                                <!--<i class="layui-icon">&#xe6c6;</i>--><span>车队信息</span></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="form.html"  kit-target data-options="{url:'<%=applicationPath%>/authc/vehicleList.html',icon:'',title:'车辆信息',id:'100'}"><span> 车辆信息</span></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="nav.html"   kit-target data-options="{url:'<%=applicationPath%>/authc/driver/driverList.html',icon:'',title:'驾驶员信息',id:'103'}"><span>驾驶员信息</span></a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><img src="<%=imagesPath%>/nav_icon_car_20.png"/><span>车辆管理</span></a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" kit-target data-options="{url:'${pageContext.request.contextPath }/authc/organization/fleetList.html',icon:'',title:'车队信息',id:'111'}">
                                <!--<i class="layui-icon">&#xe6c6;</i>--><span> 车队信息</span></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="form.html"  kit-target data-options="{url:'<%=applicationPath%>/authc/vehicleList.html',icon:'',title:'车辆信息',id:'100'}"><span> 车辆信息</span></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="nav.html"   kit-target data-options="{url:'<%=applicationPath%>/authc/driver/driverList.html',icon:'',title:'驾驶员信息',id:'103'}"><span> 驾驶员信息</span></a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><img src="<%=imagesPath%>/nav_icon_set_20.png"/><span> 设备管理</span></a>
                    <dl class="layui-nav-child">
                        <!-- 设备列表 -->
                        <dd>
                            <a href="javascript:;" data-url=""  kit-target data-options="{url:'<%=applicationPath%>/authc/equip/equipList.html',icon:'',title:'设备信息',id:'220'}"><span> 设备信息</span></a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="javascript:;" kit-target data-options="{url:'',icon:'',title:'运维管理',id:'300'}"><img src="<%=imagesPath%>/nav_icon_maintain_20.png"><span> 运维管理</span></a></li>
                <li class="layui-nav-item"><a href="javascript:;" kit-target data-options="{url:'',icon:'',title:'验收管理',id:'400'}"><img src="<%=imagesPath%>/nav_icon_statistics_20.png"><span> 验收管理</span></a></li>
                <li class="layui-nav-item"><a href="javascript:;" kit-target data-options="{url:'',icon:'',title:'平台管理',id:'500'}"><img src="<%=imagesPath%>/nav_icon_platform_20.png"><span> 平台管理</span></a></li>
                <li class="layui-nav-item"><a href="javascript:;" kit-target data-options="{url:'',icon:'',title:'任务管理',id:'600'}"><img src="<%=imagesPath%>/nav_icon_task_20.png"><span> 任务管理</span></a></li>
            </ul>
        </div>
    </div>
    <div class="layui-body" id="container">
    </div>

    <div class="layui-footer"  style="text-align: center;background-color:#f0f2f5"> <%----%>
        <!-- 底部固定区域 -->
        ©CopyRight 2018 ${user.org.orgName}

    </div>
</div>
<script type="text/javascript">
    var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cspan id='cnzz_stat_icon_1264021086'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s22.cnzz.com/z_stat.php%3Fid%3D1264021086%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));
</script>
<script src="<%=jqueryPath%>" type="text/javascript" ></script>
<script src="<%=layuiPath%>/layui.js"></script>
<script>
    var message;
    layui.config({
        base: '<%=jsPath%>/'
    }).use(['app', 'message'], function() {
        var app = layui.app,
            $ = layui.jquery,
            layer = layui.layer;
        //将message设置为全局以便子页面调用
        message = layui.message;
        //主入口
        app.set({
            type: 'iframe'
        }).init();
    });
    $(".layui-nav-tree li a").focus(function(){
        var length  = $(this).next("dl").length;
        if(length>0)
        {
            $(this).children("span").css("color","#222222");
        }
    });
    function loginOut() {
        location="<%=applicationPath%>/logout.html";
    }

    function addTab(title,content,id,icon) {
        layui.use('element', function () {
            var $ = layui.jquery
                , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

            var length = $(".layui-tab-title").find("li[lay-id=" + id + "]").length;
            if(length>0){
                element.tabChange('kitTab', id);
            }else{

                if(icon){
                    element.tabAdd('kitTab', {
                        title: '<i class="layui-icon" aria-hidden="true">'+icon+'</i>&nbsp;'+title
                        ,content: content //支持传入html
                        ,id: id

                    });
                }else{
                    element.tabAdd('kitTab', {
                        title: title
                        ,content: content //支持传入html
                        ,id: id

                    });
                }
                $(".layui-tab-title").find("li[lay-id=" + id + "]").append('<i class="layui-icon layui-unselect layui-tab-close">ဆ</i>');
                element.tabChange('kitTab', id);
            }
            /*关闭选项卡事件*/
            $('i.layui-tab-close').on('click', function(){
                var layId = $(this).parent().attr('lay-id');
                element.tabDelete('kitTab', layId); //删除 lay-id="xxx" 的这一项
            });
        });
    };
</script>
</body>

</html>
