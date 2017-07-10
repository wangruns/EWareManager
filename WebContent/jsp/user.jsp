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
  var userId =row_ele.cells[1].innerHTML;
  var user_json = {        
        "userId": userId,
 };
   url = "${pageContext.request.contextPath}/deleteUser.do";
    //Ajax发送数据给后台  
   $.ajax({  
       url :url,
       type : "post",  
       data : user_json,  
       success : function (res){ 
           if(res=="Success"){ 
                obj.parentElement.parentElement.parentElement.deleteRow(rowIndex-1);
            alert("成功");
           } else{  
            alert("失败");
           }  
       }  
   });
}
//修改
function edit_data(tableID, obj){
  var rowIndex = obj.parentElement.parentElement.rowIndex;
  var row_ele=document.getElementById ("brand_data").rows [rowIndex];
  var userId =row_ele.cells[1].innerHTML;
  var userName=row_ele.cells[2].innerHTML;
  var userAccount =row_ele.cells[3].innerHTML;
  var userPassword=row_ele.cells[4].innerHTML;
  var userSex =row_ele.cells[5].innerHTML;
  var userEmail=row_ele.cells[6].innerHTML;
  var userAddress=row_ele.cells[7].innerHTML;
  var userLevel =row_ele.cells[8].innerHTML;
  var userPhone=row_ele.cells[9].innerHTML;
  var user_json = {        
        "userId": userId,
 };
   url = "${pageContext.request.contextPath}/findUserById.do";
    //Ajax发送数据给后台  
    $.ajax({  
        url :url,
        type : "post",  
        data : user_json,  
        success : function (){ 
           var myurl="jsp/userEdit.jsp"+"?"+userId+"?"+userName+"?"+userAccount+"?"
              +userPassword+"?"+userSex+"?"+userEmail+"?"+userAddress+"?"+userLevel+"?"+userPhone;
          window.location.assign(myurl);
        }  
    });
}
function check(){
	var num = document.getElementById("user_Name").value;
	if(num==null||num==""){
		alert("供应商名称不能为空");
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
    <li><a href="#">用户管理</a></li>
    <li><a href="#">用户管理</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    
    <div id="tab2" class="tabson">
    
    
    
    <ul class="seachform">
    
    <form action="${pageContext.request.contextPath}/queryUserLikeName.do" method="post">
    <li><input id="user_Name" name="userName"  type="text"  class="dfinput" placeholder="用户姓名"/></li>
    <li><label>&nbsp;</label><input id="search" name=""  type="submit" class="scbtn" value="查询"/></li>
    </form>  
    <li><label>&nbsp;</label><input name="brandName" type="button" class="scbtn" value="添加" onclick="EV_modeAlert('envon')"/></li>     
    </ul>
    
    <div class="formtitle img_top"></div>
    <table class="tablelist" id="brand_data">
        <thead>
        <tr>
        <th><input id="check_all" name="" type="checkbox" value="" /></th>
        <th>用户ID<i class="sort"></i></th>
        <th>用户名称</th>
        <th>用户账号</th>
        <th>用户密码</th>
        <th>用户性别</th>
        <th>用户邮箱</th>
        <th>用户地址</th>
        <th>用户等级</th>
        <th>用户电话</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <form action="${pageContext.request.contextPath}/deleteUser.do" method="post">
        <c:forEach items="${resQueryLikeName}" var="p">
        <tr class="myclass">
        
        <td><input name="check_but ton" type="checkbox" value="" /></td>
        <td>${p.userId}</td>
        <td>${p.userName}</td>
        <td>${p.userAccount}</td>
        <td>${p.userPassword}</td>
        <td>${p.userSex}</td>
        <td>${p.userEmail}</td>
        <td>${p.userAddress}</td>
        <td>${p.userLevel}</td>
        <td>${p.userPhone}</td>
        <td><a  onclick="edit_data('brand_data',this)">修改</a><a class="tablelink"  onclick="deleteRow('brand_data',this)"> 删除</a></td>        
        </tr> 
        </c:forEach>
        </form>
        <button value="text" onclick="test()"/>
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
    <div class="formtitle img_top"><span>添加新用户</span></div>    
    <form name="teleform" action="${pageContext.request.contextPath}/addUser.do" method="post">
    <input type="hidden" value="true" name="sub">
    <ul class="forminfo">
    <li><label>用户名称</label><input id="user_Name" name="userName"  type="text"  class="dfinput" style="height:40px;margin: 0px 4px;"placeholder="用户名称不能为空"/></li>
    <li><label>用户账号</label><input id="user_Account" name="userAccount"  type="text"  class="dfinput" style="height:40px;margin: 0px 4px;"placeholder="账号不能为空"/></li>
    <li><label>用户密码</label><input id="user_Password" name="userPassword"  type="text"  class="dfinput" style="height:40px;margin: 0px 4px;"placeholder="密码不能为空"/></li>
    <li><label>用户性别</label>
        <select style="width: 345px; height:40px; margin: 7px 90px;" name="UserSex">  
        <option value="男">男</option>
		<option value="女">女</option>
    </select></li>    
    <li><label>用户邮箱</label><input id="user_Email" name="userEmail"  type="text"  class="dfinput" style="height:40px;margin: 0px 4px;"/></li>    
    <li><label>用户地址</label><input id="user_Address" name="userAddress"  type="text"  class="dfinput" style="height:40px;margin: 0px 4px;"/></li>    
    <li><label>用户等级</label>
    	<select id="user_Level" class="select3" name="userLevel" style="width: 345px; height:40px; margin: 7px 90px;">
    <option value ="1">普通用户</option>
    <option value ="10010">管理员</option>
    </select></li>    
    <li><label>用户电话</label><input id="user_Phone" name="userPhone"  type="text"  class="dfinput" style="height:40px;margin: 0px 4px;"/></li>        
    <li><label>&nbsp;</label><input id="button_check" name="" type="button" class="scbtn" value="添  加" style="height:40px;margin: 0px 4px;" onclick="check()"/></li>
    </ul>
    </form>
    </div>
    </div>


</body>

</html>
