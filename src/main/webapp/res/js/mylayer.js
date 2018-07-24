var mylayer= {};
var layerIndex;

mylayer.shade=[0.1,"#000"];
mylayer.msg=function(msg,icon,anim){
    if(icon&&anim)
        layerIndex=layer.msg(msg, {icon:icon,anim:anim});
    else if(icon)
        layerIndex=layer.msg(msg, {icon: icon});
    else
        layerIndex=layer.msg(msg);

    return layerIndex;
};

mylayer.msgAnim=function(msg){
    layerIndex=layer.msg(msg,{
        anim:6
    });
    return layerIndex;
};

mylayer.alert=function(content,icon,anim){

    var p={
        title:false,
        closeBtn:0,
        shade:mylayer.shade
    };
    if(icon)
        p.icon=icon;
    if(anim)
        p.anim=anim;

    layerIndex=layer.alert(content,p);
};

mylayer.confirm=function(msg,btn1,btn2,fun1,fun2){
    layer.confirm(
        msg
        ,{
        time:10000,
        title:false,
        closeBtn:0,
        shade:mylayer.shade,
        icon:3,
        btn:[btn1,btn2]
        }
        ,fun1
        ,fun2);
};

mylayer.tip=function(msg,dm,color){
    if(color){
        layerIndex=layer.tips(msg, dm, {
            tips: [2, color]
        });
    }else{
        layerIndex=layer.tips(msg, dm, {
            tips: [2, '#1111aa']
        });
    }
    return layerIndex;
};

mylayer.loading=function(type,a,c){
    layerIndex=layer.load(type, {
        shade: [a,c] //0.1透明度的白色背景
    });
    return layerIndex;
};


mylayer.loaders=function(msg){
    layerIndex=layer.open({
        type: 1,
        area: ['100px', '100px'], //宽高
        shade:false, //[0.3,"#000"],
        closeBtn: 0, //不显示关闭按钮
        title: false, //不显示标题
        content:
        '  <link rel="stylesheet" type="text/css" href="/res/loaders/loaders.css"/>\n' +
        '     <div style="padding-left:50px;padding-top:40px; " align=center>\n' +
        '        <div class="loader-inner ball-clip-rotate-multiple">\n' +
        '          <div></div>\n' +
        '          <div></div>\n' +
        '        </div> <br/>\n' +
        '\t</div><br/> <div style="width: 100%;text-align: center">'+msg+'</div>\n'
    });

    return layerIndex;
};

mylayer.colse=function(index){
    if(index){
        layer.close(index);
    }else {
        layer.close(layerIndex);
    }
};

mylayer.closeAll=function(){
    layer.closeAll();
};

mylayer.open = function (url, width, height, title,child) {
    if(!title)
        title = "编辑";
    width=width+"";
    height=height+"";
    if(width.indexOf("%")==-1&&width.indexOf("px")==-1){
        width=width+"px";
    }
    if(height.indexOf("%")==-1&&height.indexOf("px")==-1){
        height=height+"px";
    }
    if(window.parent&&window.parent.layer&&!child){
        layerIndex=window.parent.layer.open({
            type: 2,
            title: title,
            shadeClose: false,
            maxmin: true, //开启最大化最小化按钮
            area: [width, height],
            content: url
        });
    }else{
        layerIndex=layer.open({
            type: 2,
            title: title,
            shadeClose: false,
            maxmin: true, //开启最大化最小化按钮
            area: [width, height],
            content: url
        });
    }
};

mylayer.dateTheme="#1286FF";
mylayer.dateType="datetime";
mylayer.dataFormat=null;
mylayer.dateRange=null;
mylayer.dateLang=null;

mylayer.date=function(id){
    var a={
         elem: id
    };
    if(mylayer.dateTheme!=null)
        a.theme=mylayer.dateTheme;
    if(mylayer.dateType!=null)
        a.type=mylayer.dateType;
    if(mylayer.dataFormat!=null)
        a.format=mylayer.dataFormat;
    if(mylayer.dateRange!=null)
        a.range=mylayer.dateRange;
    if(mylayer.dateLang!=null)
        a.lang=mylayer.dateLang;

    layui.laydate.render(a);
};




