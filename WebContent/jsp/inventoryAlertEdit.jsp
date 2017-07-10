<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
function check(){
	var num = document.getElementById("product_Name").value;
	if(num==null||num==""){
		alert("商品品牌名称不能为空");
	}
	else{
		document.teleform.submit();
	}

}
$(function(){
	var proName = location.href.split("?")[1];
	var proAlert=location.href.split("?")[2];
	var   proname=decodeURI(proName);
	var   proalert=decodeURI(proAlert);
	document.getElementById("product_Name").value=proname; 
	document.getElementById("product_AlertValue").value=proalert;  
});
  </script>
</head>



<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">基本信息</a></li>
    <li><a href="#">商品分类</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    
    <form name="teleform" action="${pageContext.request.contextPath}/Inventory_alarm.do" method="post">
    <input type="hidden" value="true" name="sub">
    <ul class="forminfo">
    <li><label>商品名称</label><input id="product_Name" name="productName"  type="text"  class="dfinput" readonly/></li>
    <li><label>警戒值</label><input id="product_AlertValue" name="productAlertValue"  type="text"  class="dfinput" /><i>名称不超过30个字符且不能为空</i></li>    
    <div class="vocation">
    </div>
    
    </li>
    <li><label>&nbsp;</label><input id="button_check" name="" type="button" class="btn" value="保存"  onclick="check()"/></li>
    </ul>
    </form>
    </div>

</body>

</html>