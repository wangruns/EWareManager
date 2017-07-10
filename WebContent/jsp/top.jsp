<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
</head>

<body style="background:url(images/eware/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="${pageContext.request.contextPath}/home.do" target="_parent"><img src="images/eware/logo.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">
    <li><a href="${pageContext.request.contextPath}/leftBaseInformation.do" target="leftFrame" ><img src="images/eware/icon01.png" title="基本信息" /><h2>基本信息</h2></a></li>
    <li><a href="${pageContext.request.contextPath}/leftUserManagement.do" target="leftFrame"><img src="images/eware/icon02.png" title="用户管理" /><h2>用户管理</h2></a></li>
    <li><a href="${pageContext.request.contextPath}/menu.do"  target="leftFrame" class="selected"><img src="images/eware/icon03.png" title="库存管理" /><h2>库存管理</h2></a></li>
    <li><a href="${pageContext.request.contextPath}/leftReportManagement.do"  target="leftFrame"><img src="images/eware/icon04.png" title="报表分析" /><h2>报表分析</h2></a></li>
    <li><a href="${pageContext.request.contextPath}/leftSystemHelp.do" target="leftFrame"><img src="images/eware/icon05.png" title="系统帮助" /><h2>系统帮助</h2></a></li>
    </ul>
            
    <div class="topright">    
    <ul>
    <li><a href="${pageContext.request.contextPath}/login.do" target="_parent">退出登录&nbsp;&nbsp;&nbsp;</a></li>
    </ul>
     
    <div class="user">
    <span>admin</span>
    </div>    
    
    </div>

</body>

</html> --%>







<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="css/topdefault.css" />
<link rel="stylesheet" type="text/css" href="css/topcomponent.css" />
<!--<link href="css/style.css" rel="stylesheet" type="text/css" />-->
<script language="javascript" src="js/jquery.js"></script>
<script src="js/modernizr.custom.js"></script>
<!--<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
//  The function to change the class
</script>-->
</head>

<body>
	<main>
    <div class="topline">
    <a href="${pageContext.request.contextPath}/home.do" target="_parent"><img src="images/logo.png" title="系统首页" /></a>
	<a href="${pageContext.request.contextPath}/login.do" target="_parent"><img src="images/Round_red.png" style="position: relative; left:1540px; top:-10px;"/></a>
	<img src="images/Round_orange.png" style="position: relative; left:1490px; top:-5px;"/>
	<img src="images/Round_yellow.png" style="position: relative; left:1420px; top:-5px;"/>
    </div>
        
    <!--<ul class="nav">
    <li><a href="${pageContext.request.contextPath}/leftBaseInformation.do" target="leftFrame" ><img src="images/eware/icon01.png" title="基本信息" /><h2>基本信息</h2></a></li>
    <li><a href="${pageContext.request.contextPath}/leftUserManagement.do" target="leftFrame"><img src="images/eware/icon02.png" title="用户管理" /><h2>用户管理</h2></a></li>
    <li><a href="${pageContext.request.contextPath}/menu.do"  target="leftFrame" class="selected"><img src="images/eware/icon03.png" title="库存管理" /><h2>库存管理</h2></a></li>
    <li><a href="${pageContext.request.contextPath}/leftReportManagement.do"  target="leftFrame"><img src="images/eware/icon04.png" title="报表分析" /><h2>报表分析</h2></a></li>
    <li><a href="${pageContext.request.contextPath}/leftSystemHelp.do" target="leftFrame"><img src="images/eware/icon05.png" title="系统帮助" /><h2>系统帮助</h2></a></li>
    </ul>-->
    

    <!--<div class="topright">    
    <ul>
    <li><a href="${pageContext.request.contextPath}/login.do" target="_parent">退出登录&nbsp;&nbsp;&nbsp;</a></li>
    </ul>-->
     
    <!--<div class="user">
    <span>admin</span>
    </div>

    </div>-->

	<div class="container">	
		<!-- Codrops top bar -->
		<div class="main clearfix">
			<nav id="menu" class="nav">					
				<ul>
					<li>
						<a href="${pageContext.request.contextPath}/leftBaseInformation.do" target="leftFrame">
							<span class="icon">
								<i aria-hidden="true" class="icon-home"></i>
							</span>
							<span>基本信息</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/leftUserManagement.do" target="leftFrame">
							<span class="icon"> 
								<i aria-hidden="true" class="icon-services"></i>
							</span>
							<span>用户管理</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/menu.do"  target="leftFrame" class="selected">
							<span class="icon">
								<i aria-hidden="true" class="icon-portfolio"></i>
							</span>
							<span>库存管理</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/leftReportManagement.do"  target="leftFrame">
							<span class="icon">
								<i aria-hidden="true" class="icon-blog"></i>
							</span>
							<span>报表分析</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/leftSystemHelp.do" target="leftFrame">
							<span class="icon">
								<i aria-hidden="true" class="icon-team"></i>
							</span>
							<span>系统帮助</span>
						</a>
					</li>
					<!--<li>
						<a href="#">
							<span class="icon">
								<i aria-hidden="true" class="icon-contact"></i>
							</span>
							<span>Contact</span>
						</a>
					</li>-->
				</ul>
			</nav>
		</div>
	</div><!-- /container -->
	<main>
</body>

</html>