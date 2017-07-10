<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<style type="text/css">
html,body{
	height:100%;
	width:100%;
}
.version_div{
	margin-left: 27%;
	margin-top:10%;
	height: 45%;
	width:600px;
	background-color:rgb(245,245,245);
}
.version_img{
	padding-top:25%;
	padding-left:20%;
	float:left;
}
.version_span{
	font-size: 20px;
	padding-left:20%;
	padding-top:25%;
}
</style>
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">系统帮助</a></li>
    <li><a href="#">意见反馈</a></li>    
    </ul>
    </div>
	<div class="formtitle"><span>系统版本</span></div>
	<div class="version_div"><img class="version_img" src="${pageContext.request.contextPath}/images/systemVer.png"><label>&nbsp;</label><span class="version_span" align="center">  @电子化仓储管理系统V1.0</span></div>
</body>
</html>