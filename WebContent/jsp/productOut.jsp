<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link href="${pageContext.request.contextPath}/css/combo.select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.combo.select.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"> 
 		function check(){
 			var num=$("#productPlanOutNumber").val();
 			if(num==null||num==""){
 				alert("出库数量不能为空");
 				return false;
 			}
 			var customerId=$("#productId").val();
 			if(customerId=="needSelect"){
 				alert("请选择客户");
 				return false;
 			}
 			return true;
 		}
		 $(function() {
	 	    	$('select').comboSelect();
	 		 });
 		function updateShelfNumber(){
 			var productId=$("#productId").val();
 			var data={
 				"productId":productId,
 			};
 			url="${pageContext.request.contextPath}/getProductShelfInfo.do";
 			$.ajax({
 				url:url,
 				data:data,
 				success:function(res){
 					if(res!=null){
 						var array=res.split("@");
 						var shelfId=array[0];
 						var shelfNumber=array[1];
 						$("#shelfNumber").val(shelfNumber);
 						$("#shelfId").val(shelfId);
 					}else{
 						alert("请保证网络连接");
 					}
 				}
 			});
 			
 		}
 </script>
</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">库存管理</a></li>
    <li><a href="#">商品出库</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>商品出库</span></div>
    
    <form  onsubmit="return check()" action="${pageContext.request.contextPath}/productOutAction.do" method="post">
    <ul class="forminfo">
    
    <li><label>商品名称</label>  
   <select style="width: 345px; height:40px; margin: 7px 90px;"  id="productId" name="productId" onchange="updateShelfNumber()">
   <option value="needSelect">请选择商品</option>
    <c:forEach items="${productList}" var="p">
    <option value="${p.getProductId()}">${p.getProductName()}</option>
    </c:forEach>
    </select>
     </li>
    
    <li><label>出库数量</label>  
   		<input style="width:345px;height:40px;margin: 0px 4px;" class="scinput"  id="productPlanOutNumber" placeholder="输入出库数量" name="planOutNumber" />
    </li>
    
    <li><label>客户选择</label>  
   <select style="width: 345px; height:40px; margin: 7px 90px;"  name="customerId" >
   <option value="">选择客户名称</option>
    <c:forEach items="${customerList}" var="p">
    <option value="${p.getCustomerId()}">${p.getCustomerName()}</option>
    </c:forEach>
    </select>
     </li>
    
    <li><label>货架编号</label>  
   		<input style="width:345px;height:40px;margin: 0px 4px;" class="scinput"  id="shelfNumber" name="shelfNumber" placeholder="所在货架编号"  readonly="readonly" />
   		<input type="hidden"  id="shelfId" name="shelfId"/>
    </li>
    
    
    </ul>
    
    <input type="submit" class="btn" value="出  库" style="margin: 0px 113px;"/>
    </form>
    </div>

</body>
</html>