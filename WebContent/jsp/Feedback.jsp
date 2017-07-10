<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
function check(){
	var num = document.getElementById("content_Id").value;
	if(num==null||num==""){
		alert("内容不能为空");
	}
	else{
		document.teleform.submit();	
	}
}
  </script>
</head>



<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">系统帮助</a></li>
    <li><a href="#">意见反馈</a></li>    
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    
    <form name="teleform" action="${pageContext.request.contextPath}/feedbacksend.do" method="post">
    <input type="hidden" value="true" name="sub">
    <ul class="forminfo">
    <li><label>主题:</label><input id="theme_Id" name="theme"  type="text"  class="dfinput" style="width:900px"/></li>
    <!-- <li><label>内容</label><input id="content_Id" name="message"  type="text"  class="dfinput" style="width:900px;height:300px;"/></li> -->
    <li><label>内容:</label> <textarea class="dfinput" id="content_Id" name="message" cols="30" rows="4" style="width:900px;height:300px;"/></textarea></li>
    <li><label>&nbsp;</label><input id="send_Id" name="" type="button" class="btn" value="发送"  onclick="check()"/></li>
    </ul>
    </form>
    </div>

</body>

</html>