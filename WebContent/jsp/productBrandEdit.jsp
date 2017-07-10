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
/* function check_addImformation(){
	var brandName = $('#brand_Name').val();
	var user_json = {
	        "brandName": brandName,
	 };
	   url = "${pageContext.request.contextPath}/productBrandEdit.do";
	    //Ajax发送数据给后台  
	    $.ajax({  
	        url :url,
	        type : "post",  
	        data : user_json,  
	        success : function (res){  
	            if(res=="Success"){ 
					alert("成功"); 
	            } else{  
	            	document.teleform.submit();
	            }  
	        }  
	    });  
} */
function check(){
	var num = document.getElementById("brand_Id").value;
	if(num==null||num==""){
		alert("商品品牌名称不能为空");
	}
	else{
		var brandName = $('#brand_Name').val();
		var brandId = $('#brand_Id').val();
		var user_json = {
				"brandId":brandId,
		        "brandName": brandName,
		 };
		   url = "${pageContext.request.contextPath}/productBrandEdit.do";
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
	var Name = location.href.split("?")[1];
	var Id=location.href.split("?")[2];
	var   name=decodeURI(Name);
	var   id=decodeURI(Id);
	document.getElementById("brand_Name").value=name; 
	document.getElementById("brand_Id").value=id; 
});
  </script>
</head>



<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">基本信息</a></li>
    <li><a href="#">品牌管理</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>信息修改</span></div>
    
    <form name="teleform" action="${pageContext.request.contextPath}/productBrandEdit.do" method="post">
    <input type="hidden" value="true" name="sub">
    <ul class="forminfo">
    <li><label>品牌Id</label><input id="brand_Id" name="brandId"  type="text"  class="dfinput" readonly/></li>
    <li><label>品牌名</label><input id="brand_Name" name="brandName"  type="text"  class="dfinput" placeholder="输入品牌名称"/></li>
     
    <div class="vocation">
	<input id="alert_imf"  type="hidden"  value="${resAddBrand }"/>
    <i>${resAddBrand}</i>
    </div>
    <li><label>&nbsp;</label><input id="button_check" name="" type="button" class="btn" value="修改"  onclick="check()"/></li>
    </ul>
    </form>
    </div>

</body>

</html>