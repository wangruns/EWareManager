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
	var num = document.getElementById("customer_Name").value;
	if(num==null||num==""){
		alert("供应商名称不能为空");
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
    <li><a href="#">首页</a></li>
    <li><a href="#">用户管理</a></li>
    <li><a href="#">客户管理</a></li>
    <li><a href="#">客户添加</a></li>
    
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    
    <form name="teleform" action="${pageContext.request.contextPath}/addCustomer.do" method="post">
    <input type="hidden" value="true" name="sub">
    <ul class="forminfo">
    <li><label>条形码ID</label><input id="barcode_Id" name=""  type="text"  class="dfinput" /><i>条形码ID不超过30个字符且不能为空</i></li>
    <li><label>&nbsp;</label><input id="button_check" name="" type="button" class="btn" value="添加"  onclick="check()"/></li>
    </ul>
    </form>
    </div>

</body>

</html>