<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>EWareManager | Login</title>
	
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"> <!-- Resource style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Login.css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/modernizr.js"></script> <!-- Modernizr -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/Login.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.watermark-2.0.min.js"></script>
	
	
	
	<script type="text/javascript">
		//窗口震动
		var variable_1 = ['top','left'];
		var variable_2 = 0;
		var variable_3;
		function shock()
		{
			body_shock.style[variable_1[variable_2 % 2]] = (variable_2++) % 4 < 2 ? "0px" : "4px";
		    if (variable_2 > 15) 
		     {
		       clearInterval(variable_3);
		       variable_2 = 0
		     }
		}
		function shockHint()
		{
			clearInterval(variable_3);
			variable_3 = setInterval(shock, 32);
		}
		
		</script>
</head>

<body>
	<main>
		<div class="cd-login cd-main-content">
			<div>
				<h1>EWareManager</h1>
				<div class="wrap" >
					<div class="avatar" id="body_shock">
						<img src="${pageContext.request.contextPath}/images/avatar.png">
					</div>
					<input id="input_Log" name="userAccount" type="text" placeholder="username" class="border_radio_top" required>
					<div class="bar">
						<i></i>
					</div>
					<input id="pas" name="userPassword" type="password" placeholder="password" required>
					<div class="bar">
						<i></i>
					</div>
					<input id="verifyCode" class="border_radio_buttom" name="Verification_code" type="text" placeholder="VerificationCode" style="display:none" required >
					<img id="randImage" class="forgot_link" src="jsp/verificationCodeLoad.jsp" style="display:none" onclick="loadimage()"  />

					<button href="home.do" data-type="page-transition">Sign in</button>
				</div>
			</div>
		</div>
	</main>
	<div class="cd-cover-layer"></div>
	<div class="cd-loading-bar"></div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/Changepage.js"></script> <!-- Resource jQuery -->
</body>
</html>