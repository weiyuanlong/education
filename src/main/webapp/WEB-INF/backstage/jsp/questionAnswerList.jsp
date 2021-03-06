<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>问答管理</title>
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
                        <div class="layui-col-md4 layui-col-xs4">
                            <div class="layui-form-item">
                                <label class="layui-form-label">问题名称</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="question" lay-verify="" placeholder="请输入" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md4 layui-col-xs4" >
                            <div class="layui-form-item">
                                <div class="layui-input-block" style="text-align: center;margin-right: 70px">
                                    <button  class="layui-btn layui-btn-normal"  lay-filter="submit">查询</button>
                                    <input type="button" class="layui-btn layui-btn-normal"  lay-filter="add" onclick="addUser()" value="添加" />
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
        <a class="opreation" onclick="editQuestion('{{d.id}}','{{d.question}}')" >编辑</a>
        &nbsp;&nbsp;<span class="dispan">|</span>&nbsp;&nbsp;
        <a class="opreation" onclick="deleteData('{{d.id}}','{{d.question}}','deleteQuestion')">删除</a>
        &nbsp;&nbsp;<span class="dispan">|</span>&nbsp;&nbsp;
        {{#  if(d.invalid){ }}
            <a class="opreation" style="color: red" onclick="invalid('{{d.id}}',false,'updateQuestion')">启用</a>
        {{#  } else { }}
            <a class="opreation" onclick="invalid('{{d.id}}',true,'updateQuestion')">停用</a>
        {{#  } }}
    </div>
</script>

<script type="text/html" id="statusTool">
    {{#  if(d.invalid){ }}
        停用
    {{#  } else { }}
        正常
    {{#  } }}
</script>
<script>
    var searchUrl = "<%=applicationPath %>/queryQuestion";
    var cols=[[ //标题栏
        {field: '', title: '', width: '5%',templet: '#ID'}
        ,{field: 'question', title: '问题', width:'15%'}
        ,{field: 'answer', title: '答案', width: '35%'}
        ,{field: 'invalid', title: '状态', width:'5%',toolbar: '#statusTool'}
        ,{field: 'createTime', title: '创建时间', width:'12.5%'}
        ,{field: 'updateTime', title: '修改时间', width:'12.5%'}
        ,{field: 'operation', title: '操作', width:'15%',toolbar: '#opreationTool', unresize: true}
    ]];

    $(function(){
        //加载数据表格
        pagedataHandel.init();
        pagedataHandel.initData(searchUrl,cols);
    });

    /**
     * 新增
     */
    function addUser() {
        addNav(121,'添加','<%=applicationPath %>/getAddOrEditQuestion');
    }

    /**
     * 编辑
     * @param id
     * @param title
     */
    function editQuestion(id,title) {
        addNav(122+'-'+id,'编辑'+'-'+title,'<%=applicationPath %>/getAddOrEditQuestion?id='+id,"&#xe642;");
    }


    /**
     *修改状态
     * @param id
     * @param type
     */
    function update(id,userState) {
        var title = "";
        if (userState == 2)
            title = "停用？";
        else
            title = "启用？";
        var url = "<%=applicationPath %>/setUserState.html";
        var data = {id: id, userState: userState};
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