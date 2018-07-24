<%--
  Created by IntelliJ IDEA.
  User: LWC
  Date: 2018/3/9
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>
    <link rel="stylesheet" href="<%=layuiPath%>/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=cssPath%>/doc.css" media="all">
    <link rel="stylesheet" href="<%=cssPath%>/main.css"><!--
    <link rel="stylesheet" href="res/css/bootstrap.min.css">-->

</head>

<body>
<div class="kit-doc">
    <div class="page-content">
        <div id="tab-general">
            <div class="layui-row layui-col-space15" >
                <div class="layui-col-xs12 layui-col-md6">
                    <div class="portlet box">
                        <div class="portlet-header">
                            <div class="caption">自定义功能</div>
                            <div class="tools"></div>
                        </div>
                        <div class="portlet-body">
                            <div  style="width: 100%; height:310px">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-md6">
                    <div class="portlet box">
                        <div class="portlet-header">
                            <div class="caption">平台数据</div>
                            <div class="tools"></div>
                        </div>
                        <div class="portlet-body">
                            <div class="layui-row layui-col-space5">
                                <div class="layui-col-xs6 layui-col-md3">
                                    <div class="panelBox">
                                        <span>40000</span>
                                        <p>上线</p>
                                        <div>
                                            <img src="<%=imagesPath%>/home_icon_car_bluesmall_28.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-xs6 layui-col-md3">
                                    <div class="panelBox">
                                        <span>40000</span>
                                        <p>上线</p>
                                        <div>
                                            <img src="<%=imagesPath%>/home_icon_car_green_28.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-xs6 layui-col-md3">
                                    <div class="panelBox">
                                        <span>10000</span>
                                        <p>离线</p>
                                        <div>
                                            <img src="<%=imagesPath%>/home_icon_car_gray_28.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-xs6 layui-col-md3">
                                    <div class="panelBox">
                                        <span>10000</span>
                                        <p>停车</p>
                                        <div>
                                            <img src="<%=imagesPath%>/home_icon_car_yellow_28.png">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-col-space5">
                                <div class="layui-col-xs6 layui-col-md3">
                                    <div class="panelBox">
                                        <span>66.6%</span>
                                        <p>今日上线率</p>
                                        <div>
                                            <img src="<%=imagesPath%>/home_icon_round_28.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-xs6 layui-col-md3">
                                    <div class="panelBox">
                                        <span>1234976</span>
                                        <p>今日报警总次数</p>
                                        <div>
                                            <img src="<%=imagesPath%>/home_icon_warn_28.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-xs6 layui-col-md3">
                                    <div class="panelBox">
                                        <span>34976</span>
                                        <p>超高危报警次数</p>
                                        <div>
                                            <img src="<%=imagesPath%>/home_icon_line_red_28.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-xs6 layui-col-md3">
                                    <div class="panelBox">
                                        <span>23413</span>
                                        <p>高危报警次数</p>
                                        <div>
                                            <img src="<%=imagesPath%>/home_icon_line_redhalf_28.png">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-col-space5">
                                <div class="layui-col-xs6 layui-col-md3">
                                    <div class="panelBox">
                                        <span>234976</span>
                                        <p>危险报警次数</p>
                                        <div>
                                            <img src="<%=imagesPath%>/home_icon_line_yellow_28.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-xs6 layui-col-md3">
                                    <div class="panelBox">
                                        <span>563633</span>
                                        <p>较危险报警次数</p>
                                        <div>
                                            <img src="<%=imagesPath%>/home_icon_line_yellowhalf_28.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-xs6 layui-col-md3">
                                    <div class="panelBox">
                                        <span>532246</span>
                                        <p>正常</p>
                                        <div>
                                            <img src="<%=imagesPath%>/home_icon_line_green_28.png">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-col-xs6 layui-col-md3">
                                    <div class="panelBox">
                                        <span>4976</span>
                                        <p>平台在线人数</p>
                                        <div>
                                            <img src="<%=imagesPath%>/home_icon_man_28.png">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-row layui-col-space15">
                <div class="layui-col-xs12 layui-col-md6">
                    <div class="portlet box">
                        <div class="portlet-header">
                            <div class="caption">公告</div>
                            <div class="tools"><button type="button" class="ant-btn"><span>更多</span></button><!--<a href="#" >更多</a>--></div>
                        </div>
                        <div class="portlet-body">
                            <table class="layui-table" lay-even="" lay-skin="nob">
                                <colgroup>
                                    <col width="450">
                                    <col width="50">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <td>人生似修行</td>
                                    <td>1989-10-14</td>
                                </tr>
                                <tr>
                                    <td>于千万人之中遇见你所遇见的人，于千万年之中</td>
                                    <td>1920-09-30</td>
                                </tr>
                                <tr>
                                    <td>于千万人之中遇见你所遇见的人，于千万年之中</td>
                                    <td>1920-09-30</td>
                                </tr>
                                <tr>
                                    <td>于千万人之中遇见你所遇见的人，于千万年之中</td>
                                    <td>1920-09-30</td>
                                </tr>
                                <tr>
                                    <td>于千万人之中遇见你所遇见的人，于千万年之中</td>
                                    <td>1920-09-30</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-md6">
                    <div class="portlet box">
                        <div class="portlet-header">
                            <div class="caption">动态</div>
                            <div class="tools"></div>
                        </div>
                        <div class="portlet-body">
                            <table class="layui-table" lay-even="" lay-skin="nob">
                                <colgroup>
                                    <col width="450">
                                    <col width="50">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <td>人生似修行</td>
                                    <td>1989-10-14</td>
                                </tr>
                                <tr>
                                    <td>于千万人之中遇见你所遇见的人，于千万年之中</td>
                                    <td>1920-09-30</td>
                                </tr>
                                <tr>
                                    <td>于千万人之中遇见你所遇见的人，于千万年之中</td>
                                    <td>1920-09-30</td>
                                </tr>
                                <tr>
                                    <td>于千万人之中遇见你所遇见的人，于千万年之中</td>
                                    <td>1920-09-30</td>
                                </tr>
                                <tr>
                                    <td>于千万人之中遇见你所遇见的人，于千万年之中</td>
                                    <td>1920-09-30</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<%=layuiPath%>/layui.js"></script>
</body>

</html>
