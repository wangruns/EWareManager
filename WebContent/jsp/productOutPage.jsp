<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{ text-align:center} 
.div{ margin-top:100px; width:400px; height:100px; border:2px solid #F00;} 
.show{margin-top:50px;}
ul li{list-style:none;}
#show_id{
   background:	#EFFFD7
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	var productOutId=${productOutId}
	var planOutNumber=${productPlanOutNumber}
	var data={
		"productOutId":productOutId,
		"planOutNumber":planOutNumber
	};
	var polling=function(){
		var url="${pageContext.request.contextPath}/productOutScanVerify.do?"+Math.random;
		$.ajax({
			  url: url,
			  timeout: 6000,
			  data: data,
			  success: function(res){
				  if(res=="ok"){
					  plogin();
				  }else{
					  //设置实际出库的值
					$("#actualOutNumber").text(res);
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
<body id="show_id">
<div class="show">
<ul>
<li><h1>请开始扫描出库</h1></li>
<li><img src="${pageContext.request.contextPath}/images/qrCodeOut.png" /></li>
<li>编号<label>${productOutId}</label></li>
<li><h2>商品的名称：<lable>${productName}</lable></h2></li>
<li><h2>计划出货量：<lable>${productPlanOutNumber}</lable></h2></li>
<li><h2>实际出货量：<span  id="actualOutNumber" style="color:red">0</span></h2></li>
<li><h2>出货人：<lable>${userName}</lable></h2></li>
</ul>
</div>

<form action="${pageContext.request.contextPath}/productOutScanOK.do" id="formId">
</form>
</body>
</html>