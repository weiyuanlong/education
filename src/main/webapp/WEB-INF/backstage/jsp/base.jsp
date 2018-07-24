<%--
  Created by IntelliJ IDEA.
  User: LWC
  Date: 2018/3/24
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page   language="java"  contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%
        String applicationPath = request.getContextPath() ;
        String cssPath=applicationPath+"/res/css";
        String imagesPath=applicationPath+"/res/images";
        String jsPath=applicationPath+"/res/js";
        String jqueryPath=applicationPath+"/res/js/jquery-1.10.2.min.js";
        String layuiPath=applicationPath+"/res/layui/layui-v2.2.6";
        String ztreePath=applicationPath+"/res/ztree/ztree-v3.5.26";
    %>

    <link rel="stylesheet" href="<%=ztreePath%>/css/metroStyle/metroStyle.css" media="all">
   <style>
       .layui-ztree{
           height: 99%;overflow:auto;
       }
       /*滚动条样式*/
       .layui-ztree::-webkit-scrollbar {/*滚动条整体样式*/
           width: 6px;     /*高宽分别对应横竖滚动条的尺寸*/
           height: 0px;
       }
   </style>
    <script src="<%=jqueryPath%>"></script>
    <script src="<%=jsPath%>/jquery-form.js" charset="utf-8"></script>
    <script src="<%=jsPath%>/myajax.js"></script>
    <script src="<%=jsPath%>/mylayer.js"></script>
    <script type="text/javascript">

        /**
         *添加选项卡
         */
        function addNav(id,title,url,icon){
            var content="<iframe src="+url+" width='100%' height='95%'></iframe>"
            if(window.parent)
                window.parent.addTab(title,content,id,icon);
            else
                addTab(title,content,id,icon);
        }

        /**
         * 删除
         * @param id
         * @param title
         */
        function deleteData(id,title,ctrl) {
            var title =title+"-确定删除？";
            var url="<%=applicationPath %>/authc/"+ctrl+".html";
            var data = {id:id}
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


        /**
         *停用
         * @param id
         * @param type
         */
        function invalid(id,invalid,ctrl) {
            var title = "";
            if (invalid)
                title = "确定停用吗？";
            else
                title = "确定恢复吗？";
            var url = "<%=applicationPath %>/authc/"+ctrl+".html";
            var data = {id: id, invalid: invalid};
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

        /**
         * 公共提示
         * @param title
         * @param url
         * @param data
         * @param successFun
         */
        function confirm(title,url,data,successFun){
            mylayer.confirm(title
                ,"确定"
                ,"取消"
                ,function() {
                    mylayer.loaders('请稍后');
                    myajax.success=successFun,
                        myajax.error=function (data) {
                            mylayer.closeAll();
                                mylayer.alert("网络异常",5,6);
                        };
                    myajax.ajax(url,data);

                }
                ,function() {
                    mylayer.closeAll();
                }
            );
        }


        /**
         * 加载下拉框
         **/
        function createSelectCode(id,type,selected){
            var select=$(id);
            var form = layui.form;
            myajax.success=function (data) {
                $.each(data.data,function(index,value) {
                    if (selected == value.baseCode) {
                        if(lang!='zh_CN')
                            select.append("<option value='" + value.baseCode + "' selected='selected'>" + value.baseCode + "</option>");
                        else
                            select.append("<option value='" + value.baseCode + "' selected='selected'>" + value.baseName + "</option>");
                    }else {
                        if(lang!='zh_CN')
                            select.append("<option value='" + value.baseCode + "'>" + value.baseCode + "</option>");
                        else
                            select.append("<option value='" + value.baseCode + "'>" + value.baseName + "</option>");
                    }
                });
                form.render();
            };
            myajax.ajax("<%=applicationPath%>/authc/getBaseCodesByType.html",{type:type});
        }
        function createSelectId(id,type,selected){
            var select=$(id);
            var form = layui.form;
            myajax.success=function (data) {
                $.each(data.data,function(index,value){
                    if (selected == value.id) {
                        if(lang!='zh_CN')
                            select.append("<option value='" + value.id + "' selected='selected'>" + value.baseCode + "</option>");
                        else
                            select.append("<option value='" + value.id + "' selected='selected'>" + value.baseName + "</option>");
                    }else {
                        if(lang!='zh_CN')
                            select.append("<option value='" + value.id + "'>" + value.baseCode + "</option>");
                        else
                            select.append("<option value='" + value.id + "'>" + value.baseName + "</option>");
                    }
                });
                form.render();
            };
            myajax.ajax("<%=applicationPath%>/authc/getBaseCodesByType.html",{type:type});
        }

        /**
         * 组织树
         **/
        var orgP;
        function openOrgTree(t,t_url) {
          var url="<%=applicationPath%>/authc/organization/organizationTree.html"
            if(t_url)
                url=t_url;
            var p=$("#"+t.id);
            orgP=p;
            p.attr("class","layui-form-select layui-form-selected");
            layer.open({
                type: 2 //此处以iframe举例
                ,skin: 'layui-layer-demo' //样式类名
                ,closeBtn: 0 //不显示关闭按钮
                ,shade: 0
                ,title:false
                ,anim: 5
                ,isOutAnim:false
                ,shade: 0.00001
                ,area: [p.width()+'px', '400px']
                ,resize:true
                ,shadeClose: true //开启遮罩关闭
                , offset: [ //为了演示，随机坐标
                    p.offset().top+p.height()+5
                    ,   p.offset().left
                ]
                , content: url
            });
        }

        function selectOrg(treeNode) {
            orgP.attr("class","layui-form-select layui-unselect ");
            $("#orgId").val(treeNode.id);
            $("#orgName").val(treeNode.name);
        }


        /**
         * 树
         */
        var p;
        var pName;
        var pId;
        var pCode;
        function openTree(t,ctrl) {
            p=$("#"+t.id);
            p.attr("class","layui-form-select layui-form-selected");
            pName=$("#"+t.id+"Name");
            pId=$("#"+t.id+"Id");
            pCode=$("#"+t.id+"Code");
            layer.open({
                type: 1 //此处以iframe举例
                ,skin: 'layui-layer-demo' //样式类名
                ,closeBtn: 0 //不显示关闭按钮
                ,shade: 0
                ,title:false
                ,anim: 5
                ,isOutAnim:false
                ,shade: 0.00001
                ,area: [p.width()+'px', '400px']
                ,resize:true
                ,shadeClose: true //开启遮罩关闭
                , offset: [ //为了演示，随机坐标
                    p.offset().top+p.height()+5
                    ,   p.offset().left
                ]
                , content: '<div class="layui-ztree" ><ul id="ztree" class="ztree innerbox"></ul><div>'
            });

            var zTreeObj;
            // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
            var setting = {
                callback: {
                    beforeClick: zTreeBeforeClick
                }
                ,view: {
                    showLine: false
                    ,fontCss : {color:"#666"}
                    ,checkable: true
                    ,showIcon: false
                }
            };

            myajax.success=function (data) {
                if(data.success){
                    zTreeObj = $.fn.zTree.init($("#ztree"), setting, data.data);
                }

            };
            myajax.ajax("<%=applicationPath%>/authc/"+ctrl+".html",{});

        }

        function zTreeBeforeClick(treeId, treeNode, clickFlag) {
            p.attr("class","layui-form-select layui-unselect ");
            console.log(pName);
            if(pName!=null)
                pName.val(treeNode.name);
            if(pId!=null)
                pId.val(treeNode.id);
            if(pCode!=null)
                pCode.val(treeNode.code);

            layer.closeAll();
        }

    </script>

</head>
</html>