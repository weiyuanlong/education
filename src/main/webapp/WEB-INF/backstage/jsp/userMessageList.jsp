<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户留言管理</title>
    <link rel="stylesheet" href="<%=layuiPath%>/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=cssPath%>/doc.css" media="all">
    <link rel="stylesheet" href="<%=cssPath%>/main.css">

</head>
<body>
<div class="tab-body">
<div class="portlet box">
<div class="layui-fluid">
    <div class="layui-row" >
        <div class="layui-col-md12 layui-col-xs12">
            <div id="toolbox">
                <form class="layui-form" id="dataForm" onsubmit="return pagedataHandel.sumbit();" >
                    <div class="layui-row">
                        <div class="layui-col-md3 layui-col-xs3">
                            <div class="layui-form-item">
                                <label class="layui-form-label">姓名</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="userName" lay-verify="" placeholder="请输入" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md3 layui-col-xs3">
                            <div class="layui-form-item">
                                <label class="layui-form-label">电话</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="telephone" lay-verify="" placeholder="请输入" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md3 layui-col-xs3">
                            <div class="layui-form-item">
                                <label class="layui-form-label">处理状态</label>
                                <div class="layui-input-inline">
                                    <select name="status" lay-filter="" lay-verify="" lay-search>
                                        <option value="">请选择</option>
                                        <option value=0>未处理</option>
                                        <option value=1>已处理</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md3 layui-col-xs3" >
                            <div class="layui-form-item">
                                <div class="layui-input-block" style="text-align: center;margin-right: 70px">
                                    <button  class="layui-btn layui-btn-normal"  lay-filter="submit">查询</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="layui-row" style="margin: 30px; margin-bottom: 10px;margin-top: 0px;padding-bottom: 10px">
                <div class="layui-col-md12 layui-col-xs12">
                    <table class="layui-hide" id="dataTable"></table>
                </div>
            </div>
        </div>

    </div>
</div>
</div>
</div>
<script src="<%=jsPath%>/main.js"></script>
<script src="<%=layuiPath%>/layui.all.js"></script>
<script src="<%=jsPath%>/pagedataHandel.js"></script>
<script src="<%=ztreePath%>/js/jquery.ztree.all.min.js"></script>
<script type="text/html" id="ID">
    <div style="width: 100%;text-align: center" >
        {{d.LAY_TABLE_INDEX+1}}
    </div>
</script>
<script type="text/html" id="opreationTool">
    <div style="width: 100%;text-align: center;">
        <a class="opreation" onclick="deleteData('{{d.id}}','{{d.userName}}','deleteUserMessageStatus')">删除</a>
        &nbsp;&nbsp;<span class="dispan">|</span>&nbsp;&nbsp;
        {{#  if(d.status){ }}
            <a class="opreation" style="color: red" onclick="upStatus('{{d.id}}',false,'updateUserMessageStatus')">取消处理</a>
        {{#  } else { }}
            <a class="opreation" onclick="upStatus('{{d.id}}',true,'updateUserMessageStatus')">处理</a>
        {{#  } }}
    </div>
</script>

<script type="text/html" id="statusTool">
    {{#  if(d.status){ }}
        已处理
    {{#  } else { }}
        未处理
    {{#  } }}
</script>
<script>
    var searchUrl = "<%=applicationPath %>/findUserMessageAll";
    var cols = [[ //标题栏
        {field: '', title: '', width: '5%', templet: '#ID'}
        , {field: 'userName', title: '姓名', width: '10%'}
        , {field: 'telephone', title: '电话', width: '10%'}
        , {field: 'content', title: '留言', width: '30%'}
        , {field: 'status', title: '处理状态', width: '8%', toolbar: '#statusTool'}
        , {field: 'createTime', title: '创建时间', width: '12.5%'}
        , {field: 'updateTime', title: '修改时间', width: '12.5%'}
        , {field: 'operation', title: '操作', width: '12.1%', toolbar: '#opreationTool', unresize: true}
    ]];

    $(function () {
        //加载数据表格
        pagedataHandel.init();
        pagedataHandel.initData(searchUrl, cols);
    });

    /**
     *停用
     * @param id
     * @param type
     */
    function upStatus(id, invalid, ctrl) {
        var title = "";
        if (invalid)
            title = "确定标记为处理吗？";
        else
            title = "确定恢复吗？";
        var url = "<%=applicationPath %>/"+ctrl;
        var data = {id: id, status: invalid};
        var successFun=function(data){
            mylayer.closeAll();
            if(data.success)
            {
                pagedataHandel.reloadData();
            }else {
                mylayer.alert(data.message,5);
            }
        };
        confirm(title,url,data,successFun);
    }

</script>
</body>
</html>