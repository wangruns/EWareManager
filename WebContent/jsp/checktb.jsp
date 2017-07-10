<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<%-- <link href="${pageContext.request.contextPath}/css/select.css" rel="stylesheet" type="text/css" /> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/editor/kindeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/add.js"></script>
<link href="${pageContext.request.contextPath}/css/combo.select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.combo.select.js"></script>
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
 
//修改
function edit_data(tableID, obj){
var rowIndex = obj.parentElement.parentElement.rowIndex;
var row_ele=document.getElementById ("brand_data").rows [rowIndex];
var checkId =row_ele.cells[1].innerHTML;
var shelfId=row_ele.cells[2].innerHTML;
var userId =row_ele.cells[3].innerHTML;
var productId=row_ele.cells[4].innerHTML;
var checkNumber =row_ele.cells[5].innerHTML;
//alert("providerId="+providerId+"  ====== "+" providerName="+providerName); 
var user_json = {        
        "checkId": checkId,
 };
   url = "${pageContext.request.contextPath}/findChecktbById.do";
    //Ajax发送数据给后台  
    $.ajax({  
        url :url,
        type : "post",  
        data : user_json,  
        success : function (){ 
        	var myurl="jsp/checktbEdit.jsp"+"?"+checkId+"?"+shelfId+"?"+userId+"?"+productId+"?"+checkNumber;
        	window.location.assign(myurl);
        }  
    });
}
function check(){
	var num = document.getElementById("check_nub").value;
	if(num==null||num==""){
		alert("产品数量不能为空");
	}
	else{
		document.teleform.submit();	
	}
}
</script>



</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">库存管理</a></li>
    <li><a href="#">商品盘点</a></li>
    </ul>
    </div>
    
    <div class="formbody">   
    <div id="usual1" class="usual">    
  	<div id="tab2" class="tabson">   
    <ul class="seachform">
    
    <form action="${pageContext.request.contextPath}/checktbQuery.do" method="post">
    <li><label>&nbsp;</label><input id="search" name=""  type="submit" class="scbtn" value="查询"/></li>
    </form>    
    <li><label>&nbsp;</label><input name="brandName" type="button" class="scbtn" value="添加" onclick="EV_modeAlert('envon')"/></li>
    
    </ul>
    
    <div class="formtitle img_top"></div>
    <table class="tablelist" id="brand_data">
    	<thead>
    	<tr>
        <th><input id="check_all" name="" type="checkbox" value="" /></th>
        <th>盘点ID<i class="sort"></i></th>
        <th>货架编号</th>
        <th>盘点人</th>
        <th>盘点商品</th>
        <th>盘点数量</th>
        <th>盘点日期</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resQuerychecktb}" var="p">
        <tr class="myclass">        
        <td><input name="check_but ton" type="checkbox" value="" /></td>
        <td>${p.checkId}</td>
        <td>${p.shelfNumber}</td>
        <td>${p.checkPerson}</td>
        <td>${p.productName}</td>
        <td>${p.checkNumber}</td>
        <td>${p.checkDate}</td>       
        </tr> 
		</c:forEach>
        </tbody>

    </table>
    </div>  
       
	</div> 
 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    
	<!--添加 -->  
	
	<div id="envon">
    <div class="formbody" >
    <a href="javascript:EV_closeAlert()"><img alt="关闭" src="images/off.png" class="img_addr"></a>
    <div class="formtitle img_top"><span>盘点添加</span></div>
    
    <form name="teleform" action="${pageContext.request.contextPath}/addChecktb.do" method="post">
    <input type="hidden" value="true" name="sub">
    <ul class="forminfo">
    
    <li><label>货架编号</label>
    <select style="width:350px;height:40px;margin: 7px 90px;" name="shelfId">
    <c:forEach var="cs" items="${resshelfIdQuery}">
        <option value="${cs.shelfId}">${cs.shelfNumber}</option>
    </c:forEach> 
    </select></li>
    
    <li><label>盘点人</label>
    <select style="width:350px;height:40px;margin: 7px 90px;" name="userId">
    <c:forEach var="cs" items="${resQueryUserLikeName}">
        <option value="${cs.userId}">${cs.userName}</option>
    </c:forEach> 
    </select></li>
    
    
    <li><label>商品名称</label>
        <select style="width:350px;height:40px;margin: 7px 90px;" name="productId">
    <c:forEach var="cs" items="${resproductIdQuery}">
        <option value="${cs.productId}">${cs.productName}</option>
    </c:forEach> 
    </select></li>   
    <li><label>产品数量</label><input id="check_nub" name="checkNumber"  type="text"  class="dfinput" style="width:350px;margin: 0px 4px;"placeholder="产品数量不能为空"/></li>    
    <li><label>&nbsp;</label><input id="button_check" name="" type="button" class="scbtn" value="添加"  style="margin: 0px 4px;"onclick="check()"/></li>
    </ul>
    </form>
    </div>
    </div>
    
    </div>


</body>

</html>
