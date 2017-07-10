<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>电子化仓储管理系统</title>
<script type="text/javascript" src="js/jquery.dataTable.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery.dataTable.css">
</head>
<frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="${pageContext.request.contextPath}/header.do" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
    <frame src="${pageContext.request.contextPath}/menu.do" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="${pageContext.request.contextPath}/body.do" name="rightFrame" id="rightFrame" title="rightFrame" />
  </frameset>
</frameset>
<noframes><body>
</body></noframes>

</html> --%>
<!doctype html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_home.css"> <!-- Resource style -->
	<script src="${pageContext.request.contextPath}/js/modernizr.js"></script> <!-- Modernizr -->
  <script src="js/prefixfree.min.js"></script>	
	
	<title>Home | EWareManager</title>
</head>
<body class="cd-home" data-hijacking="on" data-animation="opacity">
	
	<section class="cd-section visible">
		<div>
			<main>
				<div class="cd-home cd-main-content">
					<div>
<!-- 						<a class="cd-btn" href="login.do" data-type="page-transition">&#8592; Go back</a> -->
<!-- 						<h1>Weclome to EWareManager</h1> -->

							<a href="#0" class="link link--nukun">We<span>lco</span>me</a>

						<nav>
							<ul class="cd-vertical-nav">
								<li><a href="#0" class="cd-prev inactive">Next</a></li>
								<li><a href="#0" class="cd-next">Prev</a></li>
							</ul>
						</nav> <!-- .cd-vertical-nav -->
					</div>
				</div>
			</main>
		</div>
	</section>
	
	<section class="cd-section">
	<div>
    <iframe class="leftFrame"  src="${pageContext.request.contextPath}/menu.do"   frameborder="no" name="leftFrame" scrolling="No">
    </iframe>
    <iframe class="rightFrame" src="${pageContext.request.contextPath}/body.do"   frameborder="no" name="rightFrame" width="1550px" height="760px" style="position: absolute; top: 200px; left: 330px;">
    </iframe>
    <iframe class="topFrame"   src="${pageContext.request.contextPath}/header.do" frameborder="no" name="topFrame" scrolling="No">
  	</iframe>
   </div>
   <div>
   		<img src="${pageContext.request.contextPath}/images/blewbg.png" style="position: absolute; left:20px; top:940px;"/>	
   </div>
  </section>
	
<div class="cd-cover-layer"></div>
<div class="cd-loading-bar"></div>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
<script src="${pageContext.request.contextPath}/js/velocity.min.js"></script>
<script src="${pageContext.request.contextPath}/js/velocity.ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/Changepage.js"></script> <!-- Resource jQuery -->
<script src="js/main.js"></script> <!-- Resource jQuery -->
</body>
</html>