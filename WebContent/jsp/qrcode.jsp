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

function deleteRow(tableID, obj){
  var rowIndex = obj.parentElement.parentElement.rowIndex;
  var row_ele=document.getElementById ("brand_data").rows [rowIndex];
  var qrCodeId =row_ele.cells[1].innerHTML;
  var qrContent=row_ele.cells[2].innerHTML;
  var user_json = {        
        "qrContent": qrContent,
 };
   url = "${pageContext.request.contextPath}/deleteQrcode.do";
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
function check(){
	var num = document.getElementById("shelf_Nub").value;
	if(num==null||num==""){
		alert("商品品牌名称不能为空");
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
    <li><a href="#">基本信息</a></li>
    <li><a href="#">条码管理</a></li>
    </ul>
    </div>
    
    <div class="formbody">   
    <div id="usual1" class="usual">    
  	<div id="tab2" class="tabson">  
    <ul class="seachform">
    <form action="${pageContext.request.contextPath}/queryQrcodeLikeCont.do" method="post">
    <li>
    <select name="qrCodeId" style="width: 400px; margin: -5px 0px;">
    	<option value="">条码编号</option>
        <c:forEach items="${qrcodeSelectName}" var="p">
    		<option value="${p}">${p}</option>
    	</c:forEach>
    </select></li>
    <li><label>&nbsp;</label><input id="search" name=""  type="submit" class="scbtn" value="查询"/></li>
    </form>
   
    <li><label>&nbsp;</label><input name="brandName" type="button" class="scbtn" value="添加" onclick="EV_modeAlert('envon')"/></li>   
    
    </ul>
    <div class="formtitle img_top"></div>
    <table class="table table-striped table-bordered" id="brand_data">
    	<thead>
    	<tr>
        <th><input id="check_all" name="" type="checkbox" value="" /></th>
        <th>条形码ID<i class="sort"></i></th>
        <th>条形码编号</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <form action="${pageContext.request.contextPath}/deleteQrcode.do" method="post">
        <c:forEach items="${resQueryContent}" var="p">
        <tr class="myclass">
        
        <td><input name="check_but ton" type="checkbox" value="" /></td>
        <td>${p.qrCodeId}</td>
        <td>${p.qrContent}</td>
        <td><a class="tablelink"  onclick="deleteRow('brand_data',this)"> 删除</a></td>        
        </tr> 
    	</c:forEach>
    	</form>
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
    </div>
    
    <!-- 添加 -->
    <div id="envon">
    <div class="formbody">   
    <a href="javascript:EV_closeAlert()"><img alt="关闭" src="images/off.png" class="img_addr"></a>
    <div class="formtitle img_top"><span>条码添加</span></div>   
    <form name="teleform" action="${pageContext.request.contextPath}/addQrcode.do" method="post">
    <input type="hidden" value="true" name="sub">
    <ul class="forminfo">
    <li><label>条形码编号</label><input id="shelf_Nub" name="qrContent"  type="text"  class="dfinput" style="height:40px;margin: 0px 4px; "placeholder="输入条形码编号"/></li>     
    <div class="vocation">

    </div>
    
    </li>
    <li><label>&nbsp;</label><input id="button_check" name="" type="button" class="scbtn" value="添  加" style="margin: 0px 4px;" onclick="check()"/></li>

    </ul>
    </form>
    </div>
	</div>

</body>

</html>
