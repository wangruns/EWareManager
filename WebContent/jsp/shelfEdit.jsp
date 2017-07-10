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
	var num = document.getElementById("shelf_Id").value;
	if(num==null||num==""){
		alert("商品品牌名称不能为空");
	}
	else{
		document.teleform.submit();
		
		var shelfId = $('#shelf_Id').val();
		var shelfNumber = $('#shelf_Nub').val();
		var user_json = {        
		        "shelfId": shelfId,
		        "shelfNumber":shelfNumber,
		 };
		   url = "${pageContext.request.contextPath}/updateShelf.do";
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
	document.getElementById("shelf_Nub").value=name; 
	document.getElementById("shelf_Id").value=id; 
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
    
    <form name="teleform" action="${pageContext.request.contextPath}/updateShelf.do" method="post">
    <input type="hidden" value="true" name="sub">
    <ul class="forminfo">
    <li><label>货架ID</label><input id="shelf_Id" name="shelfId"  type="text"  class="dfinput" readonly/></li>
    <li><label>货架编号</label><input id="shelf_Nub" name="shelfNumber"  type="text"  class="dfinput" placeholder="输入货架编号"/></li>
     
    <div class="vocation">
    </div>
    
    </li>
    <li><label>&nbsp;</label><input id="button_check" name="" type="button" class="btn" value="修改"  onclick="check()"/></li>
    </ul>
    </form>
    </div>

</body>

</html>