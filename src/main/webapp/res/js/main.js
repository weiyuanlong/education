/*选项卡事件*/
/*layui.use('element', function(){
    var $ = layui.jquery
        ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

    /!*新增选项卡事件*!/
    element.on('nav(navBar)', function(elem){

        var data =  eval('(' + elem.children("a").attr('data-options') + ')'); //得到当前点击的DOM对象
        var title =data.title; /!*elem.children("a").html();*!/
        var length = $(".layui-tab-title").find("li[lay-id=" + data.id + "]").length;
        if(length>0){
            element.tabChange('tabs', data.id);
        }else{
            element.tabAdd('tabs', {
                title: title
                ,content: '选项卡的内容' //支持传$(".layui-nav-tree li a")入html
                ,id: data.id
            });
            $(".layui-tab-title").find("li[lay-id=" + data.id + "]").append('<i class="layui-icon layui-unselect layui-tab-close">ဆ</i>');
            element.tabChange('tabs', data.id);
        }
        /!*关闭选项卡事件*!/
        $('i.layui-tab-close').on('click', function(){
            var layId = $(this).parent().attr('lay-id');
            element.tabDelete('tabs', layId); //删除 lay-id="xxx" 的这一项
        });
    });
});*/



/*from表单序列化json对象*/
$.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

function formatDateTime(inputTime,format) {
    var date = new Date(inputTime);
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    m = m < 10 ? ('0' + m) : m;
    var d = date.getDate();
    d = d < 10 ? ('0' + d) : d;
    var h = date.getHours();
    h = h < 10 ? ('0' + h) : h;
    var minute = date.getMinutes();
    var second = date.getSeconds();
    minute = minute < 10 ? ('0' + minute) : minute;
    second = second < 10 ? ('0' + second) : second;
    if(format=='yyyy-MM-dd')return y + '-' + m + '-' + d;
    return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;
};
function getTaskTime(strDate) {
    if(null==strDate || ""==strDate){
        return "";
    }
    var dateStr=strDate.trim().split(" ");
    var strGMT = dateStr[0]+" "+dateStr[1]+" "+dateStr[2]+" "+dateStr[5]+" "+dateStr[3]+" GMT+0800";
    var date = new Date(Date.parse(strGMT));
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    m = m < 10 ? ('0' + m) : m;
    var d = date.getDate();
    d = d < 10 ? ('0' + d) : d;
    var h = date.getHours();
    var minute = date.getMinutes();
    minute = minute < 10 ? ('0' + minute) : minute;
    var second = date.getSeconds();
    second = second < 10 ? ('0' + second) : second;

    return y+"-"+m+"-"+d+" "+h+":"+minute+":"+second;
};