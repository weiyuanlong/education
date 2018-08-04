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
				<div onclick="changeHtml(1)" class="tit-ab">
					<p>招生政策</p>
				</div>
				<div onclick="changeHtml(2)" class="tit-ol">
					<p>邮电之声</p>
				</div>
			</div>
			<div class="col-sm-9 introduce">
				<section class="title">
					<h1 id="title">
						招生政策
					</h1>
				</section>
				<div class="onlinepg con-pad">
					<p>
						月朗星疏，金秋送爽。值此国庆佳节和中秋佳节来临之际，某某快递集团向一直以来支持、关心某某快递成长的各级领导、合作伙伴、客户、媒体及社会各界朋友，致以深深的祝福和衷心的感谢！同时向节日期间坚守在工作岗位上的各位同仁们表示诚挚问候，并致以崇高的敬意。
					</p>
					<p>
						昨天的成绩造就今天的辉煌，今天的辉煌又是明天新的起点。一直以来，某某快递秉承“取信于人送信与人” 的理念，积极响应国家邮政局提出快递服务“全年无休”的工作要求，勤劳诚恳的某某人齐心协力，同舟同济，以严谨扎实的工作作风和热情充沛的劲头，不断推进公司各项工作的提升，某某快递快件时效及服务质量提升效果显著。
					</p>
					<p>
						共同的事业，大家的某某快递。某某深知成绩来之不易，“传递世界文明 铸就美好生活”，是某某人肩负的历史使命，点滴的进步是客户对我们的眷顾和支持。随着快递旺季的到来，某某将以高度的责任感和强烈的使命感，凝心聚力，认真履职，确保每一票快件的时效与安全。我们将通过不懈的努力，不断优化网络环境，加强管控力度，提升服务质量。我们也将拓展和深化各领域务实合作，提升企业核心竞争力，用更加优质的客户体验回报用户。
					</p>
					<p>
						月是中秋明，情是中秋浓，在这象征收获、团圆和喜庆的日子里，某某快递集团真诚祝愿大家节日愉快，阖家欢乐，幸福安康！
					</p>
				</div>
			</div>
		</div>

	<jsp:include page="footCommon.jsp"/>
		<script src="<%=jsPath%>/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=jsPath%>/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=jsPath%>/main.js" type="text/javascript" charset="utf-8"></script>
	</body>

<script>
	function changeHtml(num) {
		if(num == 1) {
			$("#title").html("招生政策");

		}else if(num == 2) {
            $("#title").html("邮电之声");
		}
	}
</script>

</html>