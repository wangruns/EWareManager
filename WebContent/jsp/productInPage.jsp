<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{ text-align:center} 
.div{ margin:0 auto; width:400px; height:100px; border:1px solid #F00} 
.show{margin-top:100px;}
ul li{list-style:none;}
#show_id{
   background:	#EFFFD7
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	var productId=${productId}
	var planInNumber=${productPlanInNumber}
	var data={
		"productId":productId,
		"planInNumber":planInNumber,
	};
	var polling=function(){
		var url="${pageContext.request.contextPath}/productInScanVerify.do?"+Math.random;
		$.ajax({
			  url: url,
			  timeout: 6000,
			  data: data,
			  success: function(res){
				  if(res=="ok"){
					  plogin();
				  }else{
					  //设置实际进库的值
					  $("#actualInNumber").text(res);
					  polling();
				  }
			  }
			});
	}
	
	var plogin=function(){
		$("#formId").submit();
	}
	polling();
</script>
</head>
<body   id="show_id">
<div class="show">
<ul>
<li><h1>请开始扫描入库</h1></li>
<li><img src="${pageContext.request.contextPath}/images/qrCode.png" /></li>
<li><label>编号${productId}</label></li>
<li><h2>商品的名称：<lable>${productName}</lable></h2></li>
<li><h2>计划进货量：<lable>${productPlanInNumber}</lable></h2></li>
<li><h2>实际进量：<span  id="actualInNumber" style="color:red">0</span></h2></li>
<li><h2>进货人：<lable>${userName}</lable></h2></li>
</ul>
</div>

<form action="${pageContext.request.contextPath}/productInScanOK.do" id="formId">
</form>
</body>
</html>