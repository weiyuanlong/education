myajax={};

myajax.method="POST";
myajax.url="";
myajax.data=null;
myajax.contentType=null;
myajax.dataType="json";
myajax.success=null;
myajax.error=null;

myajax.ajax=function (url,data,method) {


    if(url)
        myajax.url=url;
    if(data)
        myajax.data=data;
    if(method)
        myajax.method=method;

    var a={
        type: myajax.method,
        url: myajax.url,
        data:myajax.data,
        dataType: myajax.dataType,
        success: myajax.success,
        error:myajax.error
    }

    if(myajax.contentType!=null)
        a.contentType=myajax.contentType;

    $.ajax(a);
}