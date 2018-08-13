<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">

	<head>
		<meta charset="utf-8" />
		<title>贵州省邮电学校</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="<%=cssPath%>/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="<%=cssPath%>/main.css" />
	</head>
    <style>
        .news-con ul li img{width:100% !important;}
    </style>
	<body>
		<jsp:include page="topCommon.jsp"/>
		
		<!--aboupg-->
		<div class="sec aboutpg container">
			<div class="pg-nav col-sm-3">
				<div class="tit-ab">
					<p>校园生活</p>
				</div>
				<ul>
					<li><a href="javascript:void(0)" onclick="showSchool()">美丽邮电</a></li>
					<li><a href="javascript:void(0)" onclick="showStudent()">学子风采</a></li>
				</ul>
				<div class="tit-ol">
					<p>社团活动</p>
				</div>
				<ul>
					<li><a href="javascript:void(0)" onclick="showCorpor()">社团活动</a></li>
				</ul>
			</div>
			<div class="col-sm-9">
				<section class="title">
					<h1>
						美丽邮电
						<span>Beautiful post and Telecommunications </span>
					</h1>
				</section>
				<div class="news-con con-pad">
					<ul>
					    <div clss="container">
                            <li class="col-md-3 col-md-offset-1">
                                <img id="pic_1" src='<%=imagesPath%>/butiful/corpor/corpor1.png' />
                            </li>
                            <li class="col-md-3 col-md-offset-1">
                                <img id="pic_2" src='<%=imagesPath%>/butiful/corpor/corpor2.png' />
                            </li>
                            <li class="col-md-3 col-md-offset-1">
                                <img id="pic_3" src='<%=imagesPath%>/butiful/corpor/corpor3.png' />
                            </li>
                        </div>
					    <div clss="container">
                            <li class="col-md-3 col-md-offset-1">
                                <img id="pic_4" src='<%=imagesPath%>/butiful/corpor/corpor4.png' />
                            </li>
                            <li class="col-md-3 col-md-offset-1">
                                <img id="pic_5" src='<%=imagesPath%>/butiful/corpor/corpor5.png' />
                            </li>
                            <li class="col-md-3 col-md-offset-1">
                                <img id="pic_6" src='<%=imagesPath%>/butiful/corpor/corpor6.png' />
                            </li>
                        </div>
					</ul>
				</div>
			</div>
		</div>

		<jsp:include page="footCommon.jsp"/>

		<script src="<%=jsPath%>/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=jsPath%>/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=jsPath%>/main.js" type="text/javascript" charset="utf-8"></script>
	</body>

<script>

	function showSchool() {
	    var selectId = "";
        for(var i = 1; i <= 6; i++) {
            selectId = "#pic_" + i;
            $(selectId).attr('src','<%=imagesPath%>/butiful/school/school'+i+'.png');
        }
	}

    function showStudent() {
        var selectId = "";
        for(var i = 1; i <= 6; i++) {
            selectId = "#pic_" + i;
            $(selectId).attr('src','<%=imagesPath%>/butiful/student/student'+i+'.png');
        }
    }

    function showCorpor() {
        var selectId = "";
        for(var i = 1; i <= 6; i++) {
            selectId = "#pic_" + i;
            $(selectId).attr('src','<%=imagesPath%>/butiful/corpor/corpor'+i+'.png');
        }
    }

</script>


</html>