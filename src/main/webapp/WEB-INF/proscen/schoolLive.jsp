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
						<li>
							<a href="news-detail1.html">
								<h2>国家邮政局发通告要求严格落实收寄验视制度</h2>
								<span>2017-7-13</span>
								<p>
									新华网北京8月1日电国家邮政局近日会同公安部、国家安全部联合发出通告，要求切实维护南京青奥会期间的寄递物品安全，严格落实收寄验视制度.
								</p>
							</a>
						</li>
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

	}

    function showStudent() {

    }

    function showCorpor() {

    }

</script>


</html>