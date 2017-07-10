<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>库存损益分析</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>	 
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.idTabs.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/editor/kindeditor.js"></script>
<%-- 	<script src="${pageContext.request.contextPath}/js/base-loading.js"></script> --%>
	<!-- 图表 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/assets/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/assets/demo.css">
    <script src="${pageContext.request.contextPath}/js/assets/raphael-min.js"></script>
    <script src="${pageContext.request.contextPath}/js/assets/g.raphael.js"></script>
    <script src="${pageContext.request.contextPath}/js/assets/g.pie.js"></script>
    
    <!-- 年月日 -->
    <link href="${pageContext.request.contextPath}/css/Date/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/css/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript"> 
$(function() {
    $("#check_all").click(function() {
         $('input[name="check_button"]').attr("checked",this.checked); 
     });
     var $subBox = $("input[name='check_button']");
     $subBox.click(function(){
         $("#check_all").attr("checked",$check_button.length == $("input[name='check_button']:checked").length ? true : false);
     });
 });

//入库商品次数最多
$(function(){
	var m = new Array();
	var j = new Array();
	var inName= document.getElementById("in_name").value;
	var arrayObj = new Array();
	var arrayObj=inName.split(",");
		for(var i=0;i<arrayObj.length;i++){
			if(i==0){
				m[i]=arrayObj[i].substring(1);
				continue;
			}
			if(i>0&&i==arrayObj.length-1){
				m[i]=arrayObj[i].substring(0,arrayObj[i].length-1);
				continue;
			}
		m[i]=arrayObj[i];
		}
	var  k=0;
	<c:forEach items="${resProduntInNum}" var="p">  
	 j[k]=${p.value};
     k=k+1;
	</c:forEach>
	
         var r = Raphael("holder"),
             pie = r.piechart(300, 250, 160,j, { legend: m, legendpos: "east"});
         r.text(290, 40, "入库商品次数较多的产品").attr({ font: "20px sans-serif" });
         pie.hover(function () {
             this.sector.stop();
             this.sector.scale(1.1, 1.1, this.cx, this.cy);

             if (this.label) {
                 this.label[0].stop();
                 this.label[0].attr({ r: 7.5 });
                 this.label[1].attr({ "font-weight": 800 });
             }
         }, function () {
             this.sector.animate({ transform: 's1 1 ' + this.cx + ' ' + this.cy }, 500, "bounce");

             if (this.label) {
                 this.label[0].animate({ r: 5 }, 500, "bounce");
                 this.label[1].attr({ "font-weight": 400 });
             }
         });
     
});
//出库商品次数最多
$(function(){
	var m = new Array();
	var j = new Array();
	var outName= document.getElementById("out_name").value;
	var arrayObj = new Array();
	var arrayObj=outName.split(",");
		for(var i=0;i<arrayObj.length;i++){
			if(i==0){
				m[i]=arrayObj[i].substring(1);
				continue;
			}
			if(i>0&&i==arrayObj.length-1){
				m[i]=arrayObj[i].substring(0,arrayObj[i].length-1);
				continue;
			}
		m[i]=arrayObj[i];
		}
	var  k=0;
	<c:forEach items="${resOutproductNum}" var="p">  
	 j[k]=${p.value};
     k=k+1;
	</c:forEach>
	
         var r = Raphael("holder"),
             pie = r.piechart(300, 250, 160,j, { legend: m, legendpos: "east"});
         r.text(290, 40, "出库商品次数较多产品").attr({ font: "20px sans-serif" });
         pie.hover(function () {
             this.sector.stop();
             this.sector.scale(1.1, 1.1, this.cx, this.cy);

             if (this.label) {
                 this.label[0].stop();
                 this.label[0].attr({ r: 7.5 });
                 this.label[1].attr({ "font-weight": 800 });
             }
         }, function () {
             this.sector.animate({ transform: 's1 1 ' + this.cx + ' ' + this.cy }, 500, "bounce");

             if (this.label) {
                 this.label[0].animate({ r: 5 }, 500, "bounce");
                 this.label[1].attr({ "font-weight": 400 });
             }
         });
     
});
//找出进货次数最多的供应商
$(function(){
	var m = new Array();
	var j = new Array();
	var providerName= document.getElementById("provider_name").value;
	var arrayObj = new Array();
	var arrayObj=providerName.split(",");
		for(var i=0;i<arrayObj.length;i++){
			if(i==0){
				m[i]=arrayObj[i].substring(1);
				continue;
			}
			if(i>0&&i==arrayObj.length-1){
				m[i]=arrayObj[i].substring(0,arrayObj[i].length-1);
				continue;
			}
		m[i]=arrayObj[i];
		}
	var  k=0;
	<c:forEach items="${resInprovider}" var="p">  
	 j[k]=${p.value};
     k=k+1;
	</c:forEach>
	
         var r = Raphael("holder"),
             pie = r.piechart(300, 250, 160,j, { legend: m, legendpos: "east"});
         r.text(290, 40, "进货次数较多供应商").attr({ font: "20px sans-serif" });
         pie.hover(function () {
             this.sector.stop();
             this.sector.scale(1.1, 1.1, this.cx, this.cy);

             if (this.label) {
                 this.label[0].stop();
                 this.label[0].attr({ r: 7.5 });
                 this.label[1].attr({ "font-weight": 800 });
             }
         }, function () {
             this.sector.animate({ transform: 's1 1 ' + this.cx + ' ' + this.cy }, 500, "bounce");

             if (this.label) {
                 this.label[0].animate({ r: 5 }, 500, "bounce");
                 this.label[1].attr({ "font-weight": 400 });
             }
         });
     
});
//找出出货次数最多的客户
$(function(){
	var m = new Array();
	var j = new Array();
	var providerName= document.getElementById("customer_name").value;
	var arrayObj = new Array();
	var arrayObj=providerName.split(",");
		for(var i=0;i<arrayObj.length;i++){
			if(i==0){
				m[i]=arrayObj[i].substring(1);
				continue;
			}
			if(i>0&&i==arrayObj.length-1){
				m[i]=arrayObj[i].substring(0,arrayObj[i].length-1);
				continue;
			}
		m[i]=arrayObj[i];
		}
	var  k=0;
	<c:forEach items="${resOutCustomer}" var="p">  
	 j[k]=${p.value};
     k=k+1;
	</c:forEach>
	
         var r = Raphael("holder"),
             pie = r.piechart(300, 250, 160,j, { legend: m, legendpos: "east"});
         r.text(290, 40, "出货次数较多客户").attr({ font: "20px sans-serif" });
         pie.hover(function () {
             this.sector.stop();
             this.sector.scale(1.1, 1.1, this.cx, this.cy);

             if (this.label) {
                 this.label[0].stop();
                 this.label[0].attr({ r: 7.5 });
                 this.label[1].attr({ "font-weight": 800 });
             }
         }, function () {
             this.sector.animate({ transform: 's1 1 ' + this.cx + ' ' + this.cy }, 500, "bounce");

             if (this.label) {
                 this.label[0].animate({ r: 5 }, 500, "bounce");
                 this.label[1].attr({ "font-weight": 400 });
             }
         });
     
});
</script>
    
</head>
<body style="background-color:rgb(255,255,255);">
<div class="container">
    <form action="" class="form-horizontal">
        <fieldset>
            <legend>库存损益分析</legend>

			<div class="control-group">
                
                <div class="controls input-append date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input id="time_inp" size="16" type="text" value="" onchange="myFunction()" style="height:34px;width:300px;margin-left:-50%;"  placeholder="   请选择日期" readonly>                 
					<span class="add-on" style="height:34px;width:34px;"><i class="icon-th"></i></span>
					
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/>
            </div>

        </fieldset>
    </form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/date/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/date/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/date/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/date/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">
	$('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
function myFunction(){
    var time_nub = document.getElementById("time_inp").value;
    var time_out = new Array();
    var arrayObj=time_nub.split(" ");
        for(var i=0;i<arrayObj.length;i++){
            time_out[i]=arrayObj[i];
        }
    //月数的数字的改变
    {
        if(time_out[1]=="一月")time_out[1]=1;
        if(time_out[1]=="二月")time_out[1]=2;
        if(time_out[1]=="三月")time_out[1]=3;
        if(time_out[1]=="四月")time_out[1]=4;
        if(time_out[1]=="五月")time_out[1]=5;
        if(time_out[1]=="六月")time_out[1]=6;
        if(time_out[1]=="七月")time_out[1]=7;
        if(time_out[1]=="八月")time_out[1]=8;
        if(time_out[1]=="九月")time_out[1]=9;
        if(time_out[1]=="十月")time_out[1]=10;
        if(time_out[1]=="十一月")time_out[1]=11;
        if(time_out[1]=="十二月")time_out[1]=12;
    }
    var monthnub = time_out[1];
    var yearnub = time_out[2];
    document.getElementById("year").value=yearnub;
    document.getElementById("month").value=monthnub;
    document.teleform.submit();
}
</script>
<input id="in_name" value="${resProductInName}" type="hidden">
<input id="out_name" value="${resProductOutName}" type="hidden">
<input id="provider_name" value="${providerName}" type="hidden">
<input id="customer_name" value="${cutomerName}" type="hidden">
<form name="teleform" action="${pageContext.request.contextPath}/analysisByDate.do">
	<input id="year"  name="yearnub" value="" type="hidden">
	<input id="month" name="monthnub" value="" type="hidden">
</form>


<!-- 图表模式 -->
<!-- <div class="formtitle"><span>入库商品次数最多分析图</span></div> -->
<div id="holder"></div>
<!-- <div class="formtitle"><span>出库商品次数最多分析图</span></div> -->
<div id="holder"></div>
<!-- <div class="formtitle"><span>进货次数最多供应商分析图</span></div> -->
<div id="holder"></div>
<!-- <div class="formtitle"><span>出货次数最多客户分析图</span></div> -->
<div id="holder"></div>
<script src="./js/js/table.js"></script>
<script src="./js/tableExport/libs/pdfMake/pdfmake.min.js"></script>
<script src="./js/tableExport/libs/pdfMake/vfs_fonts.js"></script>

<script type="text/javascript" src="./js/tableExport/libs/FileSaver/FileSaver.min.js"></script>
<script type="text/javascript" src="./js/tableExport/libs/js-xlsx/xlsx.core.min.js"></script>
<script type="text/javascript" src="./js/tableExport/libs/jsPDF/jspdf.min.js"></script>
<script type="text/javascript" src="./js/tableExport/libs/jsPDF-AutoTable/jspdf.plugin.autotable.js"></script>
<script type="text/javascript" src="./js/tableExport/libs/html2canvas/html2canvas.min.js"></script>
<script type="text/javascript" src="./js/tableExport/tableExport.js"></script>
<script src="./js/js/table-export.js"></script>

<script>
    jQuery(document).ready(function () {
        TableExport.init();
    });
</script>
</body>
</html>
