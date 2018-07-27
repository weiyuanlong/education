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
    <title>添加或修改专业</title>
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

        .ztree li {
            margin-top: 12px;
        }
        .ztree li span{
            font-size: 14px;
        }
        .ztree li span:hover{
            font-size: 14px;
            color: #222;
        }
        .ztree li a:hover{
            text-decoration : none;
        }
        .ztree li span.button.chk{
            width: 17px;
            height: 16px;
            margin-left: 12px;
            margin-right: 8px;
        }

    </style>
</head>

<body>

<div class="tab-body" id="dictTypeInfo"></div>
<script type="text/html" id="dictTypeInfoModle">
    <form class="layui-form" action="">
        <input type="hidden" name="id" value="${requestScope.id==null||requestScope.id==''?0:requestScope.id}"/>
        <div class="portlet box" style="height: 85%">
            <div class="portlet-header">
                <label class="layui-form-label" ></label>
                <div class="tools"></div>
            </div>
            <div class="portlet-body">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">专业名称</label>
                        <div class="layui-inline">
                            <input type="text" name="professName" placeholder="请输入" value="{{d.professName==undefined?'':d.professName}}" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">上级专业</label>
                        <div class="layui-inline">
                            <select name="parentId" id="parentId" lay-verify="" lay-filter="" lay-search >
                                <option value=0>无</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">岗位</label>
                        <div class="layui-inline">
                            <input type="text" name="quartName" placeholder="请输入" value="{{d.quartName==undefined?'':d.quartName}}" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">薪水</label>
                        <div class="layui-inline">
                            <input type="text" name="salary" placeholder="请输入" value="{{d.salary==undefined?'':d.salary}}" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">招生人数</label>
                        <div class="layui-inline">
                            <input type="text" name="studentNum" placeholder="请输入" value="{{d.studentNum==undefined?'':d.studentNum}}" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <!-- 备注 -->
                    <label class="layui-form-label">描述</label>
                    <div class="layui-input-inline">
                        <textarea placeholder="请输入" name="content"  class="layui-textarea">{{d.content==undefined?'':d.content}}</textarea>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-normal formItem inputItem" style="width: 16%" lay-submit="" lay-filter="submitButton">提交</button>
                        <button class="layui-btn layui-btn-primary"  style="width: 16%" type="reset" >返回</button>
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
    var parentUrl = "<%= applicationPath%>/findProfessParents";

    $(function(){
        var id='${id}';
        console.log("id==========" + id);
        if (id != 0) {
            initData(id);
        } else {
            initTpl({});
            createSelectId2("#parentId", parentUrl, "professName", "","");
        }
    });

    /**
     * 加载数据
     * @param id
     */
    function initData(id) {
        var url = "<%= applicationPath%>/findProfessInfo";
        var id="${id}";

        mylayer.loaders('加载中');
        myajax.success=function(data){
            mylayer.closeAll();
            if(data.success){
                initTpl(data.data);
                // 加载下拉框
                createSelectId2("#parentId", parentUrl, "professName", data.data.parentId,"");
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
    function  initTpl(data){
        console.log(data);
        var laytpl = layui.laytpl;
        var getUserTpl = dictTypeInfoModle.innerHTML;
        var view =$("#dictTypeInfo");
        laytpl(getUserTpl).render(data, function(html){
            view.html(html);
            form.render();
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
        var url="<%=applicationPath%>/addOrEditProfess"
        myajax.contentType="application/json; charset=utf-8";
        myajax.ajax(url,param);
        return false;
    });

    /**
     *  动态加载下拉选择框
     *  @Param selectId 下拉框的ID  #id
     *  @Param searchUrl 查询数据的路径  如果为数据字典 可以为空
     *  @Param showField 显示字段的属性名
     *  @Param selectedValue 默认值
     *  @Param dictType searchUrl为空时，字典类型
     **/
    function createSelectId2(selectId,searchUrl,showField,selectedValue,dictType){
        var select=$(selectId);
        var form = layui.form;
        myajax.success=function (data) {
            console.log(data);
            $.each(data.data,function(index,value){
                if (selectedValue == value.id) {
                    select.append("<option value='" + value.id + "' selected='selected'>" + value[showField] + "</option>");
                }else {
                    select.append("<option value='" + value.id + "'>" + value[showField] + "</option>");
                }
            });
            form.render();
        };
        if(searchUrl !== null && searchUrl != ""){
            myajax.ajax(searchUrl,{});
        }else {
            myajax.ajax("<%=applicationPath%>/getBaseCodesByType",{type:dictType});
        }
    }

</script>
</body>

</html>
