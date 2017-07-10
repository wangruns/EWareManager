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
	var num = document.getElementById("customer_Name").value;
	if(num==null||num==""){
		alert("客户姓名名称不能为空");
	}
	else{
		document.teleform.submit();
		
		var customerId = $('#customer_Id').val();
		var customerName = $('#customer_Name').val();
		var customerSex = $('#customer_Sex').val();
		var customerEmail = $('#customer_Email').val();
		var customerAddress = $('#customer_Address').val();
		var customerPhone = $('#customer_Phone').val();
		var user_json = {        
		        "customerId": customerId,
		        "customerName":customerName,
		        "customerSex": customerSex,
		        "customerEmail":customerEmail,
		        "customerAddress": customerAddress,
		        "customerPhone":customerPhone,
		 };
		   url = "${pageContext.request.contextPath}/updateCustomer.do";
		    //Ajax发送数据给后台  
		    $.ajax({  
		        url :url,
		        type : "post",  
		        data : user_json,  
		        success : function (){  
		        	document.teleform.submit();		            
		        }  
		    });
	}

}
$(function(){
	var cusId = location.href.split("?")[1];
	var cusName=location.href.split("?")[2];
	var cusSex = location.href.split("?")[3];
	var cusEmail=location.href.split("?")[4];
	var cusAddress = location.href.split("?")[5];
	var cusPhone=location.href.split("?")[6];
	var  cusid =decodeURI(cusId);
	var   cusname=decodeURI(cusName);
	var   cussex=decodeURI(cusSex);
	var  cusemail =decodeURI(cusEmail);
	var   cusaddress=decodeURI(cusAddress);
	var   cusphone=decodeURI(cusPhone);
	document.getElementById("customer_Id").value=cusid; 
	document.getElementById("customer_Name").value=cusname; 
	document.getElementById("customer_Sex").value=cussex; 
	document.getElementById("customer_Email").value=cusemail; 
	document.getElementById("customer_Address").value=cusaddress; 
	document.getElementById("customer_Phone").value=cusphone; 
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
    
    <form name="teleform" action="${pageContext.request.contextPath}/updateProvider.do" method="post">
    <input type="hidden" value="true" name="sub">
    <ul class="forminfo">
    <li><label>客户ID</label><input id="customer_Id" name="customerId"  type="text"  class="dfinput" readonly/></li>
    <li><label>客户姓名</label><input id="customer_Name" name="customerName"  type="text"  class="dfinput" placeholder="客户名称不能为空"/></li>
    <li><label>客户性别</label><input id="customer_Sex" name="customerSex"  type="text"  class="dfinput" /></li>
    <li><label>客户邮箱</label><input id="customer_Email" name="customerEmail"  type="text"  class="dfinput" /></li>
    <li><label>客户地址</label><input id="customer_Address" name="customerAddress"  type="text"  class="dfinput" /></li>
    <li><label>客户电话</label><input id="customer_Phone" name="customerPhone"  type="text"  class="dfinput" /></li>
     
    <div class="vocation">
    </div>
    
    </li>
    <li><label>&nbsp;</label><input id="button_check" name="" type="button" class="btn" value="修改"  onclick="check()"/></li>
    </ul>
    </form>
    </div>

</body>

</html>