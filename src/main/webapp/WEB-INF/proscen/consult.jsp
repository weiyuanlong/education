<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
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
					<p>招生问答</p>
				</div>
				<ul>
					<%
						String firstTitle = "";
						String firstContent = "";
						List<Map> questions = (List<Map>) request.getAttribute("questions");
						for(Map question : questions) {
						    if(firstTitle == "" || "".equals(firstTitle)) {
								firstTitle = (String) question.get("question");
								firstContent = (String) question.get("answer");
							}
					%>
							<li><a href="javascript:void(0)" onclick="showQuestion('<%=question.get("id")%>','<%=question.get("question")%>','<%=question.get("answer")%>')"><%=question.get("question")%></a></li>
					<%
						}
					%>
				</ul>
				<div class="tit-ol">
					<p>专属咨询</p>
				</div>
				<ul>
					<li><a href="javascript:void(0)">专属咨询</a></li>
				</ul>
			</div>
			<div class="col-sm-9">
				<section class="title">
					<h1 id="title1">
						招生问答
					</h1>
				</section>
				<div class="news-con con-pad">
					<ul>
						<li>
							<a>
								<h2 id="h2_title"><%=firstTitle%></h2>
								<br/>
								<span id="content">
									<%=firstContent%>
								</span>
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

	// 展示问答
    function showQuestion(id,title,content) {
		console.log("id=" + id + " title=" + title + " content=" + content);
		$("#title1").html("招生问答");
		$("#h2_title").html(title);
		$("#content").html(content);
	}

</script>

</html>