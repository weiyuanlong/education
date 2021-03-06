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
			<!--<div class="pg-nav col-sm-3">
				<div class="tit-ab">
					<p>联系我们</p>
				</div>
				<ul>
					<li><a href="contact.html">联系我们</a></li>
					<li><a href="contact.html#message">在线留言</a></li>
				</ul>
				<div class="tit-ol">
					<p>在线下单</p>
				</div>
				<ul>
					<li><a href="online.html">立即下单</a></li>
					<li><a href="problem.html">常见问题</a></li>
				</ul>
			</div>-->

			<div class="col-sm-9 introduce">
				<section class="title">
					<h1>
						联系我们
						<span>CONTACT US</span>
					</h1>
				</section>
				<div class="contact con-pad">
					<div class="address">
						<p>公司地址：贵州省贵阳市云岩区安云路11号</p>
						<p>联系电话：17385176150</p>
						<p>联系人：刘老师</p>
					</div>
					<div class="map">
						<iframe src="<%=applicationPath%>/static/map/map.html"></iframe>
						<span>地图加载中...</span>
					</div>
					<div id="message" class="row">
						<p>在线留言</p>
						<form id="dataForm">
							<div class="col-sm-6">
								<p>姓名：</p>
								<input type="text" id="userName" name="userName" placeholder="姓名" />
							</div>
							<div class="col-sm-6">
								<p>联系电话：</p>
								<input type="tel" id="telephone" name="telephone" placeholder="电话号码" />
							</div>
							<div class="col-xs-12">
							<p>发送的消息：</p>
							<textarea placeholder="消息" name="content"></textarea>
							<input type="button" onclick="submitForm()" value="立即发送" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="footCommon.jsp"/>

		<script src="<%=jsPath%>/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=jsPath%>/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=jsPath%>/main.js" type="text/javascript" charset="utf-8"></script>
		
	</body>

	<script>
		var flag = true;

		function submitForm() {
			var telephone = $("#telephone").val();
            var str = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
			if(!str.test(telephone) || telephone.length < 11) {
				alert("请输入正确手机号!");
				return ;
			}
            if(flag) {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "<%=applicationPath%>/addUserMessage",
                    data: $("#dataForm").serialize(),
                    success: function (data) {
                        if(data.success) {
                            flag = false;
                            alert(data.message);
                        }else {
                            alert(data.message);
                        }
                    },
                    error : function() {
                        alert("提交失败");
                    }
                });
			}else {
				alert("请勿重复提交");
			}

		}

	</script>

</html>