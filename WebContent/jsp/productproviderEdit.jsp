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
	var num = document.getElementById("provider_Id").value;
	if(num==null||num==""){
		alert("商品品牌名称不能为空");
	}
	else{
		document.teleform.submit();
		
		var providerId = $('#provider_Id').val();
		var providerName = $('#provider_Name').val();
		var providerSex = $('#provider_Sex').val();
		var providerPhone = $('#provider_Phone').val();
		var providerEmail = $('#provider_Email').val();
		var providerAddress = $('#provider_Address').val();
		var user_json = {        
		        "providerId": providerId,
		        "providerName":providerName,
		        "providerSex": providerSex,
		        "providerPhone":providerPhone,
		        "providerEmail": providerEmail,
		        "providerAddress":providerAddress,
		 };
		   url = "${pageContext.request.contextPath}/updateProvider.do";
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
	var proID = location.href.split("?")[1];
	var proName=location.href.split("?")[2];
	var proSex = location.href.split("?")[3];
	var proPhone=location.href.split("?")[4];
	var proEmail = location.href.split("?")[5];
	var proAddress=location.href.split("?")[6];
	
	
	var proid=decodeURI(proID);
	var proname=decodeURI(proName);
	var  prosex =decodeURI(proSex);
	var  prophone =decodeURI(proPhone);
	var  proemail =decodeURI(proEmail);
	var  proaddress =decodeURI(proAddress);
	document.getElementById("provider_Id").value=proid; 
	document.getElementById("provider_Name").value=proname; 
	document.getElementById("provider_Sex").value=prosex; 
	document.getElementById("provider_Phone").value=prophone; 
	document.getElementById("provider_Email").value=proemail; 
	document.getElementById("provider_Address").value=proaddress; 
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
    <li><label>供应商ID</label><input id="provider_Id" name="providerId"  type="text"  class="dfinput" readonly/></li>
    <li><label>供应商姓名</label><input id="provider_Name" name="providerName"  type="text"  class="dfinput" placeholder="供应商名称不能为空"/></li>
    <li><label>供应商性别</label><input id="provider_Sex" name="providerSex"  type="text"  class="dfinput" /></li>
    <li><label>供应商电话</label><input id="provider_Phone" name="providerPhone"  type="text"  class="dfinput" /></li>
    <li><label>供应商邮箱</label><input id="provider_Email" name="providerEmail"  type="text"  class="dfinput" /></li>
    <li><label>供应商地址</label><input id="provider_Address" name="providerAddress"  type="text"  class="dfinput" /></li>
     
    <div class="vocation">
    </div>
    
    </li>
    <li><label>&nbsp;</label><input id="button_check" name="" type="button" class="btn" value="修改"  onclick="check()"/></li>
    </ul>
    </form>
    </div>

</body>

</html>