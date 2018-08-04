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
				<%
					List<Map> datas = (List<Map>) request.getAttribute("datas");
					for(Map data : datas) {
						int id = (int) data.get("id");
						int parentId = (int) data.get("parentId");
						if(parentId == 0) {
				%>
							<div class="tit-ab"><p>
								<%=String.valueOf(data.get("professName"))%>
							</p></div>
							<ul>
							<%
								for(Map data2 : datas) {
									int id2 = (int) data2.get("id");
									int parentId2 = (int) data2.get("parentId");
									if(parentId2 == id) {
										request.setAttribute("id2",id2);
							%>
							<li><a href="javascript:void(0)" onclick="changeContent(<%=id2%>)"><%=String.valueOf(data2.get("professName"))%></a></li>
							<%
									}
								}
							%>
						</ul>
						<%
						}
					}
				%>

			</div>
			<div class="col-sm-9">
				<section class="title">
					<h1 id="h1_title">
					</h1>
				</section>
				<div class="news-con con-pad">
					<ul>
						<li>
							<a>
								<h2 id="h2_title"></h2>
								<br/>
								<p>岗位：&nbsp;<span id="gangwei"></span></p>
								<p>工资待遇：&nbsp;<span id="salary"></span></p>
								<p>定额招生：&nbsp;<span id="studentNum"></span></p>
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

	changeContent(${id2});

	function changeContent(professId) {
		$.post("<%=applicationPath%>/pro/findProfessById",{professId:professId},function(data) {
			$("#h1_title").html(data.parentName + "<span></span>");
			$("#h2_title").html(data.professName);
			$("#gangwei").html(data.quartName);
			$("#salary").html(data.salary);
			$("#studentNum").html(data.studentNum);
		},"json");
	}

</script>

</html>