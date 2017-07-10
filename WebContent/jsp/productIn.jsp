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
 			var name=$("#productNameId").val();
 			var num=$("#productNumberId").val();
 			if(name==null||name==""){
 				alert("商品名称不能为空");
 				return false;
 			}
 			if(num==null||num==""){
 				alert("商品数量不能为空");
 				return false;
 			}
 			return true;
 		}
 		 $(function() {
 	    	$('select').comboSelect();
 		 });
 </script>
</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">库存管理</a></li>
    <li><a href="#">商品入库</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>商品入库</span></div>
    
    <form  onsubmit="return check()" action="${pageContext.request.contextPath}/productInAction.do" method="post">
    <ul class="forminfo">
    <li><label>商品名称</label>  
   		<input style="width:345px;height:40px;margin: 0px 4px;" class="scinput"  id="productNameId" name="productName" placeholder="输入商品名称"/>
    </li>
    
    <li><label>商品数量</label>  
   		<input style="width:345px;height:40px;margin: 0px 4px;" class="scinput"  id="productNumberId" name="productNumber" placeholder="输入商品数量"/>
    </li>
    
     <li><label>商品类别</label>  
   <select style="width: 345px; height:40px; margin: 7px 90px;" name="typeId">
    <option value="">选择商品类别</option>
    <c:forEach items="${typeList}" var="p">
    <option value="${p.getTypeId()}">${p.getTypeName()}</option>
    </c:forEach>
    </select>
    </li>
    
    <li><label>供应商家</label>  
   <select style="width: 345px; height:40px; margin: 7px 90px;"  name="providerId">
    <option value="">选择商家名称</option>
    <c:forEach items="${providerList}" var="p">
    <option value="${p.getProviderId()}">${p.getProviderName()}</option>
    </c:forEach>
    </select>
     </li>
    
     <li><label>商品品牌</label>  
   <select style="width: 345px; height:40px; margin: 7px 90px;" name="brandId">
    <option value="">选择商品品牌</option>
    <c:forEach items="${brandList}" var="p">
    <option value="${p.getBrandId()}">${p.getBrandName()}</option>
    </c:forEach>
    </select>
    </li>
    
     <li><label>货架编号</label>  
   <select style="width: 345px; height:40px; margin: 7px 90px;"  name="shelfId">
    <option value="">选择商品货架</option>
    <c:forEach items="${shelfList}" var="p">
    <option value="${p.getShelfId()}">${p.getShelfNumber()}</option>
    </c:forEach>
    </select>
    </li>
    
    </ul>
    <input type="submit" class="btn" value="入  库" style="margin: 0px 113px;"/>
    </form>
    </div>

</body>
</html>