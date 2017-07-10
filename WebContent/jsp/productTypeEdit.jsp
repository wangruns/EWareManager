<%@page import="org.springframework.beans.factory.parsing.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.combo.select.js"></script>
<link href="${pageContext.request.contextPath}/css/combo.select.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
function check(){
	var num = document.getElementById("type_Id").value;
	if(num==null||num==""){
		alert("商品类型名称不能为空");
	}
	else{
		document.teleform.submit();
		}
}
$(function(){
	$('select').comboSelect();
	var Name =location.href.split("?")[1];
	var Id = location.href.split("?")[2];
	var name=decodeURI(Name);
	var id=decodeURI(Id);
	document.getElementById("type_Id").value=id;
	document.getElementById("type_Name").value=name;
});
  </script>
</head>



<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">基本信息</a></li>
    <li><a href="#">商品分类</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>信息修改</span></div>
    
    <form name="teleform" action="${pageContext.request.contextPath}/productTypeEdit.do" method="post">
    <ul class="forminfo">
    <li><label>类型ID</label><input id="type_Id" name="typeId"  type="text"  class="dfinput" readonly style="height:40px;margin: 0px 4px; "/></li>

    <li><label>类型名称</label><input id="type_Name" name="typeName"  type="text"  class="dfinput" style="height:40px;margin: 0px 4px; "placeholder="输入类型名称"/></li>
    
    <li><label>父级名称</label>  
    <div class="vocation">
    <select id="select_Id" class="select3" name="fatherTypeId" style="width: 100px; height:40px; margin: 7px 90px;">
    
    <option value ="0">无</option>
    <option value ="1">1</option>
    <option value ="2">2</option>
    </select><i>${success}</i>
    <input id="res_edit" type="hidden" value="${success}"> 
    
    

    </div>
    
    </li>
    <li><label>&nbsp;</label><input id="button_check" name="" type="button" class="btn" value="修改"  onclick="check()"/></li>
    </ul>
    </form>
    </div>

</body>

</html>