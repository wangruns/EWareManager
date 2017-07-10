<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>确认页面</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  </head>
  <body>
    <form id="tele_form" action="https://www.yeepay.com/app-merchant-proxy/node" method="post">
    	<input type="hidden" name="p0_Cmd" value="${p0_Cmd }">
    	<input type="hidden" name="p1_MerId" value="${p1_MerId }">
    	<input type="hidden" name="p2_Order" value="${p2_Order }">
    	<input type="hidden" name="p3_Amt" value="${p3_Amt }">
    	<input type="hidden" name="p4_Cur" value="${p4_Cur }">
    	<input type="hidden" name="p5_Pid" value="${p5_Pid }">
    	<input type="hidden" name="p6_Pcat" value="${p6_Pcat }">
    	<input type="hidden" name="p7_Pdesc" value="${p7_Pdesc }">
    	<input type="hidden" name="p8_Url" value="${p8_Url }">
    	<input type="hidden" name="p9_SAF" value="${p9_SAF }">
    	<input type="hidden" name="pa_MP" value="${pa_MP }">
    	<input type="hidden" name="pd_FrpId" value="${pd_FrpId }">
    	<input type="hidden" name="pr_NeedResponse" value="${pr_NeedResponse }">
    	<input type="hidden" name="hmac" value="${hmac }">
    	
    </form>
    <script type="text/javascript">
  $("#tele_form").submit();
  </script>
    
  </body>
    
</html>
