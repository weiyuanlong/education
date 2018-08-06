<%--
  Created by IntelliJ IDEA.
  User: LWC
  Date: 2018/3/9
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>添加或修改问答</title>
    <link rel="stylesheet" href="<%=layuiPath%>/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=cssPath%>/doc.css" media="all">
    <link rel="stylesheet" href="<%=cssPath%>/main.css">
    <style>

        .layui-form-label{
            text-align: right;
        }
        .portlet-body button{
            margin: 8px;
        }
        .layui-form-item{
            margin-top: 15px;
        }

        .layui-form-label{
            min-width: 100px;
            max-width: 80%;
        }

        .layui-input{
            min-width: 300px;
        }

        .layui-inline{
            width: 80%
        }

    </style>
</head>

<body>

<div class="tab-body" id="dictTypeInfo"></div>
<script type="text/html" id="dictTypeInfoModle">
    <form class="layui-form" action="">
        <input type="hidden" name="id" value="${requestScope.id==null||requestScope.id==''?null:requestScope.id}"/>
        <div class="portlet box" style="height: 85%">
            <div class="portlet-header">
                <label class="layui-form-label">问答管理</label>
                <div class="tools"></div>
            </div>
            <div class="portlet-body">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">问题</label>
                        <div class="layui-inline">
                            <input type="text" name="question" required value="{{d.question==undefined?'':d.question}}"  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">回答</label>
                        <div class="layui-inline">
                            <textarea name="answer" id="demo" placeholder="请输入内容" class="layui-textarea">{{d.answer==undefined?'':d.answer}}</textarea>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-normal formItem inputItem" style="width: 16%" lay-submit="" lay-filter="submitButton">提交</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
 </script>
<script src="<%=layuiPath%>/layui.all.js"></script>
<script src="<%=ztreePath%>/js/jquery.ztree.all.min.js"></script>
<script>
    var form = layui.form;

    $(function(){
        var id='${id}';
        console.log("id==========" + id);
        if (id != 0) {
            initData(id);
        } else {
            initTpl({});
        }
    });

    /**
     * 加载数据
     * @param id
     */
    function initData(id) {
        var url = "<%= applicationPath%>/findQuestionById";

        mylayer.loaders('加载中');
        myajax.success=function(data){
            mylayer.closeAll();
            if(data.success){
                initTpl(data.data);

            }else{
                mylayer.alert(data.msg);
            }
        };
        myajax.error=function (data) {
            mylayer.closeAll();
            mylayer.alert("网络异常",5,6);
        };
        myajax.ajax(url,{id:id});
    }

    /**
     * 加载模板
     */
    function initTpl(data){
        console.log(data);
        var laytpl = layui.laytpl;
        var getUserTpl = dictTypeInfoModle.innerHTML;
        var view =$("#dictTypeInfo");
        laytpl(getUserTpl).render(data, function(html){
            view.html(html);
            form.render();
        });

        layui.use('layedit', function(){
            var layedit = layui.layedit;
            layedit.build('demo'); //建立编辑器
        });
    }

    /**
     * 表单提交
     */
    form.on('submit(submitButton)', function (data) {
        var param = JSON.stringify(data.field);
        console.log(param);

        mylayer.loaders('加载中。。。');
        myajax.success=function(data){
            mylayer.closeAll();
            if(data.success)
            {
                mylayer.alert(data.message,1);
            }else {
                mylayer.alert(data.message,5);
            }
        };
        myajax.error=function (data) {
            mylayer.alert("网络异常",5,6);
        };
        var url="<%=applicationPath%>/addOrEditQuestion"
        myajax.contentType="application/json; charset=utf-8";
        myajax.ajax(url,param);
        return false;
    });

</script>
</body>

</html>
