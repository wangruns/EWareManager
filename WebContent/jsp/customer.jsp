<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/combo.select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/editor/kindeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/add.js"></script>
<!-- table -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/datatable/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/datatable/dataTables.bootstrap.css  "/>
<script src="${pageContext.request.contextPath}/js/datatable/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/datatable/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/js/datatable/dataTables.bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/datatable/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.combo.select.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/tableselect.js"></script>

<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript"> 
//删除
function deleteRow(tableID, obj){
  var rowIndex = obj.parentElement.parentElement.rowIndex;
  var row_ele=document.getElementById ("brand_data").rows [rowIndex];
  var customerId =row_ele.cells[1].innerHTML;
  var user_json = {        
        "customerId": customerId,
 };
   url = "${pageContext.request.contextPath}/deleteCustomer.do";
    //Ajax发送数据给后台  
   $.ajax({  
       url :url,
       type : "post",  
       data : user_json,  
       success : function (res){ 
           if(res=="Success"){ 
				obj.parentElement.parentElement.parentElement.deleteRow(rowIndex-1);
           	alert("删除成功");
           } else{  
           	alert("删除失败");
           }  
       }  
   });
}
//修改
function edit_data(tableID, obj){
  var rowIndex = obj.parentElement.parentElement.rowIndex;
  var row_ele=document.getElementById ("brand_data").rows [rowIndex];
  var customerId =row_ele.cells[1].innerHTML;
  var customerName=row_ele.cells[2].innerHTML;
  var customerSex =row_ele.cells[3].innerHTML;
  var customerEmail=row_ele.cells[4].innerHTML;
  var customerAddress =row_ele.cells[5].innerHTML;
  var customerPhone=row_ele.cells[6].innerHTML;
  var user_json = {        
        "customerId": customerId,
        "customerName": customerName,
        "customerSex": customerSex,
        "customerEmail": customerEmail,
        "customerAddress": customerAddress,
        "customerPhone": customerPhone,
 };
  
   url = "${pageContext.request.contextPath}/findCustomerById.do";
    //Ajax发送数据给后台  
    $.ajax({  
        url :url,
        type : "post",  
        data : user_json,  
        success : function (){ 
        	var myurl="jsp/customerEdit.jsp"+"?"+customerId+"?"+customerName+"?"+customerSex+"?"+customerEmail+"?"+customerAddress+"?"+customerPhone;
        	window.location.assign(myurl);
        }  
    });
}
function check(){
	var num = document.getElementById("customer_Name").value;
	var text_email = document.getElementById("customer_Email").value;
	if(num==null||num==""){
		alert("客户名称不能为空");
	}
	else{
		if(!checkEmail(text_email))
			alert("邮箱错误");
		document.teleform.submit();	
	}
}
//邮箱的正则表达式
function checkEmail(str){
   var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/
   if(re.test(str))
       {return true;}
   
       return false;
   
}
</script>



</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">用户管理</a></li>
    <li><a href="#">客户管理</a></li>
    </ul>
    </div>    
    <div class="formbody">
    <div id="usual1" class="usual">    
  	<div id="tab2" class="tabson">   
    <ul class="seachform">
    
    <form action="${pageContext.request.contextPath}/queryCustomerLikeName.do" method="post">
    <li><input id="customer_Name" name="customerName"  type="text"  class="dfinput" placeholder="客户姓名"/></li>
    <li><label>&nbsp;</label><input id="search" name=""  type="submit" class="scbtn" value="查询"/></li>
    </form>
    
    <li><label>&nbsp;</label><input name="brandName" type="button" class="scbtn" value="添加" onclick="EV_modeAlert('envon')"/></li>        
    </ul>
    
    <div class="formtitle img_top"></div>
    <table class="tablelist" id="brand_data">
    	<thead>
    	<tr>
        <th><input id="check_all" name="" type="checkbox" value="" /></th>
        <th>客户ID</th>
        <th>客户姓名</th>
        <th>客户性别</th>
        <th>客户Email</th>
        <th>客户地址</th>
        <th>客户电话</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <form action="${pageContext.request.contextPath}/deleteCustomer.do" method="post">
        <c:forEach items="${resQueryLikeName}" var="p">
        <tr class="myclass">
        
        <td><input name="check_but ton" type="checkbox" value="" /></td>
        <td>${p.customerId}</td>
        <td>${p.customerName}</td>
        <td>${p.customerSex}</td>
        <td>${p.customerEmail}</td>
        <td>${p.customerAddress}</td>
        <td>${p.customerPhone}</td>
        <td><a  class="tablelink" onclick="edit_data('brand_data',this)">修改</a><a class="tablelink"  onclick="deleteRow('brand_data',this)"> 删除</a></td>        
        </tr> 
    	</c:forEach>
    	</form>
        </tbody>

    </table>
    </div>  
       
	</div> 
 

  
    </div>
    
<!--     添加客户 -->
    <div id="envon">
	<div class="formbody">
    <a href="javascript:EV_closeAlert()"><img alt="关闭" src="images/off.png" class="img_addr"></a>
    <div class="formtitle img_top"><span>添加客户</span></div>
    <form name="teleform" action="${pageContext.request.contextPath}/addCustomer.do" method="post">
    <input type="hidden" value="true" name="sub">
    <ul class="forminfo">
    <li><label>客户名称</label><input id="customer_Name" name="customerName"  type="text"  class="dfinput" style="height:40px;margin: 0px 4px;"placeholder="客户名称不能为空"/></li>
    <li><label>客户性别</label>
        <select style="width: 345px; height:40px; margin: 7px 90px;" name="UserSex">         
        <option value="男">男</option>
		<option value="女">女</option>
    </select></li>     
    <li><label>客户邮箱</label><input id="customer_Email" name="customerEmail"  type="text"  class="dfinput" style="height:40px;margin: 0px 4px;"/></li>    
    <li><label>供应地址</label><input id="customer_Address" name="customerAddress"  type="text"  class="dfinput" style="height:40px;margin: 0px 4px;"/></li>    
    <li><label>客户电话</label><input id="customer_Phone" name="customerPhone"  type="text"  class="dfinput" style="height:40px;margin: 0px 4px;"/></li>    
    <li><label>&nbsp;</label><input id="button_check" name="" type="button" class="scbtn" value="添加"  onclick="check()" style="height:40px;margin: 0px 4px;"/></li>
    </ul>
    </form>
    </div>
	</div>
</body>

</html>
