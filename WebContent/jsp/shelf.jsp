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



<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
    $(function() {
    	$('select').comboSelect();
           $("#brand_data").DataTable({
               //开启本地保存功能
               stateSave: true,
               //保存状态操作
               "stateSaveParams": function (settings, data) {
                   console.log("stateSaveParams");

                   //这里可以操作保存的数据，写上自己特定的逻辑
                   //data.search.search = "";
               },
               "stateSaveCallback": function (settings, data) {
                   console.log("stateSaveCallback");

                   //DT默认保存的key值为DataTables_+表格id+页面名称
                   localStorage.setItem('DataTables_' + settings.sInstance, JSON.stringify(data));

                   // 你可以把这些数据保存在服务器上，上面的代码标识使用本地储存来存储这些数据


               },

               //读取状态操作
               "stateLoadParams": function (settings, data) {
                   console.log("stateSaveParams");

                   //在读取数据的时候可以改变数据，根据自己逻辑来处理
                   //data.search.search = "";

                   //或者你可以直接禁用从缓存里读取数据，只要直接返回false即可
                   //return false;
               },
               "stateLoadCallback": function (settings) {
                   console.log("stateLoadCallback");
                   return JSON.parse(localStorage.getItem('DataTables_' + settings.sInstance));

                   //同样你还可以从服务器取数，采用同步的方式获取到保存在服务器里的数据

               },
               //状态加载完后执行的回调函数
               "stateLoaded": function (settings, data) {
                   console.log("stateLoaded");

                   //在这里你可以打印出保存的缓存数据
                   //alert( 'Saved filter was: '+data.search.search );

               },

               "language": {
                   "lengthMenu": "每页_MENU_ 条记录",
                   "zeroRecords": "没有找到记录",
                   "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                   "infoEmpty": "无记录",
                   "search": "搜索：",
                   "infoFiltered": "(从 _MAX_ 条记录过滤)",
                   "paginate": {
                       "previous": "上一页",
                       "next": "下一页"
                   }
               },
               "dom": "<'row'<'col-xs-2'l><'#mytool.col-xs-4'><'col-xs-6'f>r>" +
               "t" +
               "<'row'<'col-xs-6'i><'col-xs-6'p>>"
           });
       });
  </script>
  
<script type="text/javascript"> 
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
$(function() {
    $("#check_all").click(function() {
         $('input[name="check_button"]').attr("checked",this.checked); 
     });
     var $subBox = $("input[name='check_button']");
     $subBox.click(function(){
         $("#check_all").attr("checked",$check_button.length == $("input[name='check_button']:checked").length ? true : false);
     });
     $(".dl").load(location.href+" .dl");
 });
//删除
function deleteRow(tableID, obj){
var rowIndex = obj.parentElement.parentElement.rowIndex;
var row_ele=document.getElementById ("brand_data").rows [rowIndex];
var shelfId =row_ele.cells[1].innerHTML;
var shelfNumber=row_ele.cells[2].innerHTML;

//alert("shelfId="+shelfId+"  ====== "+" shelfNumber="+shelfNumber); 
var user_json = {        
        "shelfId": shelfId,
        "shelfNumber": shelfNumber,
 };
   url = "${pageContext.request.contextPath}/deleteShelf.do";
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
  var shelfId =row_ele.cells[1].innerHTML;
  var shelfNumber=row_ele.cells[2].innerHTML;
  var user_json = {        
        "shelfId": shelfId,
 };
  
   url = "${pageContext.request.contextPath}/shelfFind.do";
    //Ajax发送数据给后台  
    $.ajax({  
        url :url,
        type : "post",  
        data : user_json,  
        success : function (){ 
        	var myurl="jsp/shelfEdit.jsp"+"?"+shelfNumber+"?"+shelfId;
        	window.location.assign(myurl);
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
    <li><a href="#">货架管理</a></li>
    </ul>
    </div>
    
    <div class="formbody">  
    <div id="usual1" class="usual">    
  	<div id="tab2" class="tabson">   
    <ul class="seachform">   
    <form action="${pageContext.request.contextPath}/QueryLikeshelfNumber.do" method="post">
    <li>
    <select name="shelfId" style="width: 400px; margin: -5px 0px;">
    	<option value="">货架编号</option>
        <c:forEach items="${shelfSelectName}" var="p">
    		<option value="${p}">${p}</option>
    	</c:forEach>
    </select>
    <li><label>&nbsp;</label><input id="search" name=""  type="submit" class="scbtn" value="查询"/></li>
    </form>    
    <li><label>&nbsp;</label><input name="brandName" type="button" class="scbtn" value="添加" onclick="EV_modeAlert('envon')"/></li>        
    </ul>
    
    <div class="formtitle img_top"></div>
    <table class="table table-striped table-bordered" id="brand_data">
    	<thead>
    	<tr>
        <th><input id="check_all" name="" type="checkbox" value="" /></th>
        <th>货架ID<i class="sort"></i></th>
        <th>品牌编号</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <form action="${pageContext.request.contextPath}/deleteShelf.do" method="post">
        <c:forEach items="${resQueryLikeNumber}" var="p">
        <tr class="myclass">
        
        <td><input name="check_but ton" type="checkbox" value="" /></td>
        <td>${p.shelfId}</td>
        <td>${p.shelfNumber}</td>
        <td><a  class="tablelink" onclick="edit_data('brand_data',this)">修改</a>  <a  class="tablelink"  onclick="deleteRow('brand_data',this)"> 删除</a></td>        
        </tr> 
    	</c:forEach>
    	</form>
        </tbody>
        <%-- <input id="none_text" type="text" value ="${resDeleteType}" style="display:none"> --%>

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
    <div class="formtitle img_top"><span>货架添加</span></div>   
    <form name="teleform" action="${pageContext.request.contextPath}/addShelf.do" method="post">
    <input type="hidden" value="true" name="sub">
    <ul class="forminfo">
    <li><label>货架编号</label><input id="shelf_Nub" name="shelfNumber"  type="text"  class="dfinput" style="height:40px;margin: 0px 4px; "placeholder="输入货架编号"/></li>
     
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
