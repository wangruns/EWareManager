<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>pay starting page</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Login.css">
	<script type="text/javascript">
	function check(){
		var num = document.getElementById("pas").value;
		if(num==null||num==""){
			alert("金钱不能为空");
		}
		else{
			document.teleform.submit();	
		}
	}
	</script>

  </head>  
  <body style="background-color:#b8def2">
  	<div class="formtitle"><span style="color:rgb(255,255,255)">基本信息</span></div>
    <div id="Login_div" class="login_div" align="center">
    	<form name="teleform" action="${pageContext.request.contextPath }/jsp/pay/bank.jsp" method="post">
		<span class="style_Login">PayMoney</span>
		<div class="box_pass box_input">
			<img src="${pageContext.request.contextPath}/images/money.png" class="icon_input"><input id="pas" name=money class="input_login" placeholder="   Please enter your money"/>
		</div>
		<input type="button" value="支  付" class="btn_Login btn" onclick="check()"/>
	</form>
	</div>
  </body>
</html>
