
var pagedataHandel= {};

var table =null;
var form=null;

pagedataHandel.clientWidth=document.documentElement.clientWidth*0.925;
//页组
pagedataHandel.limits=[5, 10, 30,50,100];
//当前页
pagedataHandel.currPage=1;
//总页数
pagedataHandel.pageSize=10;
//请求地址
pagedataHandel.dataUrl="";
//列模板
pagedataHandel.cols=null;

//初始化
pagedataHandel.init=function(){
    form =$("#dataForm");
    table = layui.table;
}

//表格加载
pagedataHandel.initData=function (url,cols) {

    if (pagedataHandel.cols==null){
        $.each(cols[0],function(index,value){
            if(value.weight)
                value.width=(pagedataHandel.clientWidth*value.weight*0.9919);
        });
    }

    if(url)
        pagedataHandel.dataUrl=url;
    if(cols)
        pagedataHandel.cols=cols;


    var datas= form.serializeObject();

    if(datas.createDate){
        var sore = datas.createDate.split(' ~ ');
        datas.startTime=sore[0];
        datas.endTime=sore[1];
    }
    console.log(datas);
    table = layui.table;
    table.render({
        elem: '#dataTable'
        ,id: 'reloadData'
        ,method:'post'
        ,width:pagedataHandel.clientWidth
        ,url:pagedataHandel.dataUrl
        ,where:datas
        ,cols:pagedataHandel.cols
        ,done: function(res, curr, count){
            //得到当前页码
            pagedataHandel.currPage = curr;
            //得到当页长度
            pagedataHandel.pageSize = res.pageSize;

        }
       // ,skin: 'row' //表格风格
        ,height: 'full-200'
        /*, cellMinWidth: 80*/
        //,even: true//隔行背景
        ,page: true //是否分页
        ,limits:pagedataHandel.limits
        ,limit: pagedataHandel.pageSize //每页默认显示的数量
    });
    return false;
}

//表单提交
pagedataHandel.sumbit=function(){
    return pagedataHandel.initData(pagedataHandel.dataUrl,pagedataHandel.cols);
}

//表格刷新
pagedataHandel.reloadData=function () {
    $(".layui-laypage-btn").click();
}
