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
		<link rel="stylesheet" type="text/css" href="<%=cssPath%>/swiper.min.css" />
		
	</head>

	<body>
		<jsp:include page="topCommon.jsp"/>

		<!-- sec -->
		<div class="sec aboutpg container">
			<div class="col-sm-12 introduce">
				<section class="title">
					<h1>
						学校介绍
						<span>COMPANY INTRODUCTION</span>
					</h1>
				</section>
				<div class="intro-con con-pad">
					<p> 贵州省邮电学校创建于1958年，是经教育主管部门批准的全日制中等职业学校，是贵州一所具有悠久历史和光荣传统的公办学校。学校分为三个校区，总占地面积350余亩，老校区位于贵阳市一环内安云路33号，毗邻贵州省人民政府、轻轨一号线站，交通便利。</p>
					<p> 新校区位于贵阳清镇职教城，规划建筑面积达12万平方米(预计2019年投入使用)，双龙校区为过渡校区位于贵龙大道上(龙架山公园对面)，学校有一流的教学、实训和生活条件，建有行政办公楼、教学楼、综合楼、膳食中心、师生公寓、师生生活服务中心、高铁动车服务实训馆、幼师实训基地、汽修实训中心、计算机实训室、通信线路实训场、呼叫实训室等先进完善的设施设备能够保障学生的实训操作。</p>
					<p> 我校拥有完善的教学设施和固定的专业教师队伍，依靠先进的办学理念、科学的教学方法和严格的教学管理，使教学质量得到得到根本保证。学校重视对学生综合素质和实际操作技能的培养，我校学生屡次获得全省、全国职业院校技能大奖赛奖项，学校推行“双元制教育”“双证制”，使学生一技在手.终生无忧”。</p>
					<p> 我校学生可直通就读北京邮电大学、重庆邮电大学、西南财经大学的学历教育班。实现学历继续拔高。学校设立了发展规划处、长三角办事处、上海联络办公室、北京联络办公室等开发就业市场，资源共享、深度合作的国际国内知名企业有100多家，在产业结构调整、人才需求等方面信息互通的国际国内知名企业群有1000多家，为毕业生优质的就业、创业奠定了基础。</p>
				</div>
			</div>
		</div>
		<jsp:include page="footCommon.jsp"/>
		/*<div class="fl">
			<ul>
				<li><a href="tel:15995656015">电话咨询</a></li>
				<li><a href="index.html">网站首页</a></li>
				<li><a href="">在线留言</a></li>
			</ul>
		</div>*/
		<script src="<%=jsPath%>/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=jsPath%>/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=jsPath%>/main.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=jsPath%>/swiper.min.js" type="text/javascript" charset="utf-8"></script>
		  <!-- Initialize Swiper -->
		<script>
		var swiper = new Swiper('.swiper-container', {
		  slidesPerView: 4,
		  spaceBetween: 20,
		  autoplay: {
			delay: 3000,
			disableOnInteraction: false,
		  }
		});
		</script>
	</body>

</html>