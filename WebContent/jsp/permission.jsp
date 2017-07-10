<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/combo.select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/editor/kindeditor.js"></script>
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




</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">用户管理</a></li>
    <li><a href="#">权限管理</a></li>
    </ul>
    </div>
    <div class="formbody">
    <div id="usual1" class="usual"> 
  	<div id="tab2" class="tabson">
    <ul class="seachform">
    
    <form action="${pageContext.request.contextPath}/queryUser.do" method="post">
    <li><input id="user_Name" name="userName"  type="text"  class="dfinput" placeholder="用户姓名"/></li>
    <li><label>&nbsp;</label><input name=""  type="submit" class="scbtn" value="查询"/></li>
    </form>
    </ul>
    <div class="formtitle img_top"></div> 
    <form action="#"  method="post"  name="removeForm">
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input id="checkAll"  type="checkbox" /></th>
        <th>用户ID<i class="sort"></i></th>
        <th>用户姓名</th>
        <th>用户账号</th>
        <th>用户等级</th>      
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${userList}" var="p">
        <tr>
        <td><input name="selectedUsers" type="checkbox" value="${p.userId}" /></td>
        <td>${p.userId}</td>
        <td>${p.userName}</td>
        <td>${p.userAccount}</td>
        <td>${p.userLevel}</td>
        <td><a href="${pageContext.request.contextPath}/permissionUp.do?userId=${p.userId}"  target="rightFrame" class="tablelink">提升</a>     <a href="${pageContext.request.contextPath}/permissionDown.do?userId=${p.userId}"  target="rightFrame" class="tablelink">降低</a></td>
        </tr> 
    	</c:forEach>
        </tbody>
    </table>
    </form>

    </div>  
       
	</div> 
 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    
    </div>



</html>