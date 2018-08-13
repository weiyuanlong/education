<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<style>
    @media  screen and (min-width: 992px){
        .carousel-inner .item img{width:100% !important;height:550px !important;}
     }
     @media  screen and (min-width: 768px) and (max-width: 992px) {
        .carousel-inner .item img{width:100% !important;height:550px !important;}
     }
     @media  screen and (max-width: 767px) {
         .carousel-inner .item img{width:auto !important;height:auto !important;}
     }
</style>
<body>

<nav class="navbar navbar-default">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html"><img src="static/images/logo.png"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <%if(String.valueOf(request.getAttribute("menu")).equals("1")) {%>
                    <li class="active">
                        <a href="<%=applicationPath%>/pro/getIndex?menu=1">学校介绍</a>
                    </li>
                <%} else { %>
                    <li>
                        <a href="<%=applicationPath%>/pro/getIndex?menu=1">学校介绍</a>
                    </li>
                <%} %>
                <%if(String.valueOf(request.getAttribute("menu")).equals("2")) {%>
                    <li class="active">
                        <a href="<%=applicationPath%>/pro/getProfessPro?menu=2">专业介绍</a>
                    </li>
                <%} else { %>
                    <li>
                        <a href="<%=applicationPath%>/pro/getProfessPro?menu=2">专业介绍</a>
                    </li>
                <%} %>
                <%if(String.valueOf(request.getAttribute("menu")).equals("3")) {%>
                    <li class="active">
                        <a href="<%=applicationPath%>/pro/getEnroll?menu=3">招生动态</a>
                    </li>
                <%} else { %>
                    <li>
                        <a href="<%=applicationPath%>/pro/getEnroll?menu=3">招生动态</a>
                    </li>
                <%} %>
                <%if(String.valueOf(request.getAttribute("menu")).equals("4")) {%>
                    <li class="active">
                        <a href="<%=applicationPath%>/pro/getConsult?menu=4">招生咨询</a>
                    </li>
                <%} else { %>
                    <li>
                        <a href="<%=applicationPath%>/pro/getConsult?menu=4">招生咨询</a>
                    </li>
                <%} %>
                <%if(String.valueOf(request.getAttribute("menu")).equals("5")) {%>
                    <li class="active">
                        <a href="<%=applicationPath%>/pro/getSchoolLive?menu=5">校园生活</a>
                    </li>
                <%} else { %>
                    <li>
                        <a href="<%=applicationPath%>/pro/getSchoolLive?menu=5">校园生活</a>
                    </li>
                <%} %>
                <%if(String.valueOf(request.getAttribute("menu")).equals("6")) {%>
                    <li class="active">
                        <a href="<%=applicationPath%>/pro/getConcat?menu=6">联系我们</a>
                    </li>
                <%} else { %>
                    <li>
                        <a href="<%=applicationPath%>/pro/getConcat?menu=6">联系我们</a>
                    </li>
                <%} %>
            </ul>

        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="<%=imagesPath%>/banner/banner1.jpg" >
            </div>
            <div class="item">
                <img src="<%=imagesPath%>/banner/banner2.jpg" >
            </div>
            <div class="item">
                <img src="<%=imagesPath%>/banner/banner3.jpg" >
            </div>
        </div>

        <!-- Controls -->
        <!-- <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a> -->
    </div>
</nav>

</body>
</html>
