<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
function check(){
	var num = document.getElementById("user_Password").value;
	if(num==null||num==""){
		alert("用户密码不能为空");
	}
	else{
		document.teleform.submit();
		
		var userId = $('#user_Id').val();
		var userName = $('#user_Name').val();
		var userAccount = $('#user_Account').val();
		var userPassword = $('#user_Password').val();
		var userSex = $('#user_Sex').val();
		var userEmail = $('#user_Email').val();
		var userAddress = $('#user_Address').val();
		var userLevel = $('#user_Level').val();
		var userPhone = $('#user_Phone').val();
		var user_json = {        
		        "userId": userId,
		        "userName":userName,
		        "userAccount": userAccount,
		        "userPassword":userPassword,
		        "userSex": userSex,
		        "userEmail":userEmail,
		        "userAddress":userAddress,
		        "userLevel": userLevel,
		        "userPhone":userPhone,
		 };
		   url = "${pageContext.request.contextPath}/updateUser.do";
		    //Ajax发送数据给后台  
		    $.ajax({  
		        url :url,
		        type : "post",  
		        data : user_json,  
		        success : function (){  
		        	document.teleform.submit();		            
		        }  
		    });
	}

}
$(function(){
	var uId = location.href.split("?")[1];
	var uName=location.href.split("?")[2];
	var uAccount = location.href.split("?")[3];
	var uPassword=location.href.split("?")[4];
	var uSex = location.href.split("?")[5];
	var uEmail=location.href.split("?")[6];
	var uAddress=location.href.split("?")[7];
	var uLevel = location.href.split("?")[8];
	var uPhone=location.href.split("?")[9];
	
	
	var   uid=decodeURI(uId);
	var   uname=decodeURI(uName);
	var   uaccount=decodeURI(uAccount);
	var   upassword=decodeURI(uPassword);
	var   usex=decodeURI(uSex);
	var   uemail=decodeURI(uEmail);
	var   uaddress=decodeURI(uAddress);
	var   ulevel=decodeURI(uLevel);
	var   uphone=decodeURI(uPhone);

	
	document.getElementById("user_Id").value=uid; 
	document.getElementById("user_Name").value=uname; 
	document.getElementById("user_Account").value=uaccount; 
	document.getElementById("user_Password").value=upassword; 
	document.getElementById("user_Sex").value=usex; 
	document.getElementById("user_Email").value=uemail; 
	document.getElementById("user_Address").value=uaddress; 
	document.getElementById("user_Level").value=ulevel; 
	document.getElementById("user_Phone").value=uphone; 
});
  </script>
</head>



<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">基本信息</a></li>
    <li><a href="#">商品分类</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    
    <form name="teleform" action="${pageContext.request.contextPath}/updateUser.do" method="post">
    <input type="hidden" value="true" name="sub">
    <ul class="forminfo">
    <li><label>用户ID</label><input id="user_Id" name="userId"  type="text"  class="dfinput" readonly/></li>
    <li><label>用户姓名</label><input id="user_Name" name="userName"  type="text"  class="dfinput" /></li>
    <li><label>用户账号</label><input id="user_Account" name="userAccount"  type="text"  class="dfinput" readonly/></li>
    <li><label>用户密码</label><input id="user_Password" name="userPassword"  type="text"  class="dfinput" /><i>用户密码不能为空</i></li>
    <li><label>用户性别</label><input id="user_Sex" name="userSex"  type="text"  class="dfinput" /></li>
    <li><label>用户邮箱</label><input id="user_Email" name="userEmail"  type="text"  class="dfinput" /></li>
    <li><label>用户地址</label><input id="user_Address" name="userAddress"  type="text"  class="dfinput" /></li>
    <li><li><label>用户等级</label><input id="user_Level" name="userLevel"  type="text"  class="dfinput" readonly/></li>
    <li><label>用户电话</label><input id="user_Phone" name="userPhone"  type="text"  class="dfinput" /></li>  
    <div class="vocation">
    </div>
    
    </li>
    <li><label>&nbsp;</label><input id="button_check" name="" type="button" class="btn" value="修改"  onclick="check()"/></li>
    </ul>
    </form>
    </div>

</body>

</html>